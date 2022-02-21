import 'package:provider/provider.dart';
import 'package:wayve_test_app/core/enums/user_status.dart';
import 'package:wayve_test_app/core/ui/base/base_view_model.dart';
import 'package:wayve_test_app/core/utils/app_logger.dart';
import 'package:wayve_test_app/features/user_status/data/providers/user_provider.dart';
import 'package:wayve_test_app/features/user_status/domain/entities/user_entity.dart';

class UserViewModel extends BaseViewModel {
  late UserProvider userProvider;

  List<UserEntity> _activeUserList = [];
  List<UserEntity> get activeUserList => _activeUserList;
  set activeUserList(value) {
    _activeUserList = value;
    notifyListeners();
  }

  List<UserEntity> _inactiveUserList = [];
  List<UserEntity> get inactiveUserList => _inactiveUserList;
  set inactiveUserList(value) {
    _inactiveUserList = value;
    notifyListeners();
  }

  void init() async {
    userProvider = Provider.of<UserProvider>(appContext, listen: false);
    isLoading = true;
    List<UserEntity> userList = await userProvider.getUserList();
    if(userList.isNotEmpty) {
      activeUserList = userList.where((i) => i.status == UserStatus.active).toList();
      AppLogger.log(userList[1].gender);

      inactiveUserList = userList.where((i) => i.status == UserStatus.inactive).toList();
    }
    isLoading = false;
  }
}