import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:wayve_test_app/core/api/server_error.dart';
import 'package:wayve_test_app/core/api/service_state.dart';
import 'package:wayve_test_app/core/enums/server_error_types.dart';
import 'package:wayve_test_app/core/utils/app_logger.dart';
import 'package:wayve_test_app/core/utils/constants.dart';
import 'package:wayve_test_app/core/utils/error_helper_messages.dart';
import 'config.dart';
import 'error_response.dart';


class HttpHelper {
  static final Dio _client = Dio();
  static final _config = Config();
  static String baseURL =_config.baseUrl!;

  static Future<Dio> _getInstance({
   String? overridingRoute,
  }) async {

    Map<String, dynamic> headers = {};
    headers['Content-Type'] = 'application/json';

    _client.options.headers = headers;
    _client.options.baseUrl = overridingRoute ?? baseURL;
    _client.options.setRequestContentTypeWhenNoPayload = true;
    _client.options.contentType = 'application/json';
    _client.options.responseType = ResponseType.json;
    _client.options.sendTimeout = CONNECT_TIMEOUT;
    _client.options.receiveTimeout = CONNECT_TIMEOUT;
    _client.options.connectTimeout = CONNECT_TIMEOUT;

    return _client;
  }

  ///For unit tests purposes
  static Future<Dio> get getTestInstance => _getInstance();

  Future<dynamic> get(
      String route, {
        List<int> successStatusCodes = const [200, 201],
        onError,
        bool overrideBaseUrl = false
      }) async {
    AppLogger.log("base url is $baseURL");
    final instance = overrideBaseUrl
        ? await _getInstance(overridingRoute: route)
        : await _getInstance();
    Response response;

    AppLogger.log("Sending GET to $route");
    try {
      response = await instance.get(route);
    } on SocketException {
      return _internetError;
    } on FormatException {
      return _unknownError;
    } on DioError catch (dioError) {
      return _getDioErrorState(dioError, onError: onError);
    } catch (e) {
      return _unknownError;
    }

    dynamic _dataResponse = responseDecoder(response.data);

    if (successStatusCodes.contains(response.statusCode) && _dataResponse != null) {
      AppLogger.log("data response ---  ${_dataResponse.toString()}", longMessage: true);

      return ServiceState.success(_dataResponse);
    }

    if(_dataResponse == null){
      return _unknownError;
    }

    return onError != null
        ? onError(response.data, response.statusCode)
        : _dioError(
      response.data,
      response.statusCode!,
    );
  }

  //Map `DioError` to `ServiceState`
  ServiceState _getDioErrorState(
      DioError dioError, {
        ServiceState Function(dynamic data, int statusCode)? onError,
      }) {
    switch (dioError.type) {
      case DioErrorType.response:
        if (onError != null) {
          return onError(dioError.response?.data, dioError.response!.statusCode!);
        } else {
          return _dioError(
            dioError.response?.data,
            dioError.response!.statusCode!,
          );
        }
      case DioErrorType.other:
      case DioErrorType.connectTimeout:
        return _requestTimeOutState;
      case DioErrorType.receiveTimeout:
        return _requestTimeOutState;
      case DioErrorType.sendTimeout:
        return _requestTimeOutState;
      default:
        return _unknownError;
    }
  }

  final ServiceState _requestTimeOutState =
  ServiceState<ServerErrorModel>.error(
    const ServerErrorModel(
      statusCode: 400,
      errorMessage: 'Request timeout. Please, try again',
      data: null,
      type: ServerErrorTypes.timeout,
    ),
  );

  final ServiceState _internetError = ServiceState<ServerErrorModel>.error(
    const ServerErrorModel(
      statusCode: 400,
      errorMessage:
      // ignore: lines_longer_than_80_chars
      'Something went wrong please check your internet connection and try again',
      data: null,
      type: ServerErrorTypes.internetConnection,
    ),
  );

  final ServiceState _unknownError = ServiceState<ServerErrorModel>.error(
    ServerErrorModel(
      statusCode: 500,
      errorMessage: genericErrorMessageString,
      data: null,
      type: ServerErrorTypes.unknown,
    ),
  );

  ServiceState _dioError(
      // String message,
      dynamic data,
      int statusCode,
      ) {

    String _errorMessage = genericErrorMessageString;

    if (data.runtimeType == Map ||
        data.runtimeType.toString() != "_OneByteString") {
      ErrorResponse _errorResponse = ErrorResponse.fromJson(data);


      if (_errorResponse.success == false) {
        if (_errorResponse.message.runtimeType == String &&
            _errorResponse.message != 'Operation failed') {
          _errorMessage = _errorResponse.message;
        } else if (_errorResponse.data != null &&
            _errorResponse.data.runtimeType == String) {
          _errorMessage = _errorResponse.data;
        }

        return ServiceState.error(
          ServerErrorModel(
              statusCode: statusCode, errorMessage: _errorMessage),
        );
      }
    }

    return ServiceState<ServerErrorModel>.error(
      ServerErrorModel(
        statusCode: statusCode,
        errorMessage: _errorMessage,
        data: data,
      ),
    );
  }

  void dispose() async {
    final instance = await _getInstance();

    instance.clear();
    instance.close(force: true);
  }

  //decode response from user
  dynamic responseDecoder(dynamic data){

    if(data.runtimeType != String){
      return data;
    }else if(data.runtimeType == String){
      try{
        dynamic _jsonData = json.decode(data);


        if(_jsonData != null){
          return _jsonData;
        }

      } catch(e) {
        return null;
      }
    }

    return null;
  }
}