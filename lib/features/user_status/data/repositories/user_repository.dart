import 'package:wayve_test_app/core/api/api_helpers.dart';
import 'package:wayve_test_app/features/user_status/data/models/user_response_model.dart';
import 'package:wayve_test_app/features/user_status/data/services/user_service.dart';
import 'package:wayve_test_app/features/user_status/domain/entities/user_response_entity.dart';

import '../../../../di.dart';

abstract class UserRepository {
  Future<UserResponseModel> getUserList({
    bool isNext = false,
    bool isPrev = false,
  });
}

class UserRepositoryImpl extends UserRepository {
  final _userService = locator<UserService>();

  late PaginationEntity _pagination;

  @override
  Future<UserResponseModel> getUserList(
      {bool isNext = false, bool isPrev = false}) async {
    late UserResponseModel _userResponseModel;
    if (isNext) {
      dynamic res = await _userService.getUsers(url: _pagination.links.next);
      APIHelpers.handleResponse(res, onSuccess: (response) {
        final userResponseModel = UserResponseModel.fromJson(response.value);
        _pagination = userResponseModel.metaData.pagination;
        _userResponseModel = userResponseModel;
      });
    } else if (isPrev) {
      dynamic res =
          await _userService.getUsers(url: _pagination.links.previous);
      APIHelpers.handleResponse(res, onSuccess: (response) {
        final userResponseModel = UserResponseModel.fromJson(response.value);
        _pagination = userResponseModel.metaData.pagination;
        _userResponseModel = userResponseModel;
      });
    } else {
      dynamic res = await _userService.getUsers();
      APIHelpers.handleResponse(res, onSuccess: (response) {
        final userResponseModel = UserResponseModel.fromJson(response.value);
        _pagination = userResponseModel.metaData.pagination;
        _userResponseModel = userResponseModel;
      });
    }
    return _userResponseModel;
  }
}
