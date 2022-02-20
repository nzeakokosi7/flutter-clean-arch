import 'package:flutter/cupertino.dart';
import 'package:wayve_test_app/core/api/http_client.dart';
import 'package:wayve_test_app/core/endpoints/endpoints.dart';
import 'package:wayve_test_app/core/exceptions/api_request_exception.dart';

abstract class UserService {
  Future<dynamic> getUsers({
    required BuildContext context,
    String? route
  });
}

class UserServiceImpl extends UserService {
  HttpHelper httpHelper;
  UserServiceImpl({required this.httpHelper});


  @override
  Future<dynamic> getUsers({
    required BuildContext context,
    String? route
  }) async {

    try {
      String path = route ?? "";
      var uri = Endpoints.baseUrl + path;

      final jsonData = await httpHelper.get(uri);

      return jsonData;
    } catch(e) {
      throw ApiRequestException(e);
    }
  }
}