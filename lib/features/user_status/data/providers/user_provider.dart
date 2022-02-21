import 'package:flutter/cupertino.dart';
import 'package:wayve_test_app/core/api/api_helpers.dart';
import 'package:wayve_test_app/core/utils/app_logger.dart';
import 'package:wayve_test_app/features/user_status/data/models/user_response_model.dart';
import 'package:wayve_test_app/features/user_status/data/services/user_service.dart';
import 'package:wayve_test_app/features/user_status/domain/entities/user_entity.dart';
import 'package:wayve_test_app/features/user_status/domain/entities/user_response_entity.dart';

import '../../../../di.dart';

class UserProvider extends ChangeNotifier {
  final _userService = locator<UserService>();

  late PaginationEntity _pagination;

  Future<List<UserEntity>> getUserList({
    bool isNext = false,
    bool isPrev = false
  }) async {
    List<UserEntity> userList = [];
    if(isNext){
      dynamic res = await _userService.getUsers(url: _pagination.links.next);
      APIHelpers.handleResponse(res, onSuccess: (response) {
        final userResponseModel = UserResponseModel.fromJson(response.value);
        _pagination = userResponseModel.metaData.pagination;
        userList = userResponseModel.userEntities;
      });
    } else if(isPrev){
      dynamic res = await _userService.getUsers(url: _pagination.links.previous);
      APIHelpers.handleResponse(res, onSuccess: (response) {
        final userResponseModel = UserResponseModel.fromJson(response.value);
        _pagination = userResponseModel.metaData.pagination;
        userList = userResponseModel.userEntities;
      });
    } else {
      dynamic res = await _userService.getUsers();
      APIHelpers.handleResponse(res, onSuccess: (response) {
        final userResponseModel = UserResponseModel.fromJson(response.value);
        _pagination = userResponseModel.metaData.pagination;
        userList = userResponseModel.userEntities;
      });
    }
    return userList;
  }

}