import 'package:provider/provider.dart';
import 'package:wayve_test_app/core/ui/base/base_view_model.dart';
import 'package:wayve_test_app/features/user_status/data/providers/user_provider.dart';
import 'package:wayve_test_app/features/user_status/domain/entities/user_entity.dart';

class UserViewModel extends BaseViewModel {
  late UserProvider userProvider;

  List<UserEntity> _userList = [];
  List<UserEntity> get userList => _userList;
  set userList(value) {
    _userList = value;
    notifyListeners();
  }

  void init() async {
    userProvider = Provider.of<UserProvider>(appContext, listen: false);
    isLoading = true;
    userList = await userProvider.getUserList();
    isLoading = false;
  }
}