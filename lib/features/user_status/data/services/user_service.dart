import 'package:flutter/cupertino.dart';
import 'package:wayve_test_app/features/user_status/data/models/user_response_model.dart';

abstract class UserService {
  Future<UserResponseModel> getUsers({
    required BuildContext context,
    required route
  });
}