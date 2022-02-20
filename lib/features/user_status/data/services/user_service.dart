import 'package:flutter/cupertino.dart';
import 'package:wayve_test_app/core/api/http_client.dart';
import 'package:wayve_test_app/core/endpoints/endpoints.dart';
import 'package:wayve_test_app/core/exceptions/api_request_exception.dart';

abstract class UserService {
  Future<dynamic> getUsers({
    String? url
  });
}

class UserServiceImpl extends UserService {
  HttpHelper httpHelper;
  UserServiceImpl({required this.httpHelper});


  @override
  Future<dynamic> getUsers({
    String? url
  }) async {

    try {
      var uri = url ?? Endpoints.baseUrl;

      final jsonData = await httpHelper.get(uri);

      return jsonData;
    } catch(e) {
      throw ApiRequestException(e);
    }
  }
}