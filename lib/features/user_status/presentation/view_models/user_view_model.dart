import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:wayve_test_app/core/enums/user_status.dart';
import 'package:wayve_test_app/core/ui/base/base_view_model.dart';
import 'package:wayve_test_app/core/utils/app_logger.dart';
import 'package:wayve_test_app/features/user_status/data/models/user_response_model.dart';
import 'package:wayve_test_app/features/user_status/data/providers/user_provider.dart';
import 'package:wayve_test_app/features/user_status/domain/entities/user_entity.dart';

class UserViewModel extends BaseViewModel {
  late UserProvider userProvider;
  ScrollController scrollController = ScrollController();
  
  int _pager = 0;
  int get pager => _pager;
  set pager(intValue) {
    _pager = intValue;
    notifyListeners();
  }

  bool _isNextAvailable = false;
  bool get isNextAvailable => _isNextAvailable;
  set isNextAvailable(val) {
    _isNextAvailable = val;
    notifyListeners();
  }

  bool _isFetchingNextPage = false;
  bool get isFetchingNextPage => _isFetchingNextPage;
  set isFetchingNextPage(val) {
    _isFetchingNextPage = val;
    notifyListeners();
  }

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
  
  final Map<int, List<UserEntity>> _userActivityPageMap = {};
  Map<int, List<UserEntity>> get userActivityPageMap => _userActivityPageMap;

  void pagination() {
    if ((scrollController.position.pixels ==
        (scrollController.position.maxScrollExtent)) && isNextAvailable) {
      fetchUsers(gotoNextPage: true);
    }
  }

  void fetchUsers({bool gotoNextPage = false})async {
    gotoNextPage ? isFetchingNextPage = true :  isLoading = true;
    UserResponseModel userResponseModel = await userProvider.getUserList(isNext: gotoNextPage);

    isNextAvailable = userResponseModel.metaData.pagination.links.next !=null;
    if(userResponseModel.userEntities.isNotEmpty) {
      activeUserList = userResponseModel.userEntities.where((i) => i.status == UserStatus.active).toList();
      _userActivityPageMap.putIfAbsent(pager, () => activeUserList);
      pager++;

      inactiveUserList = userResponseModel.userEntities.where((i) => i.status == UserStatus.inactive).toList();
      _userActivityPageMap.putIfAbsent(pager, () => inactiveUserList);
      pager++;
      notifyListeners();
    }
    gotoNextPage ? isFetchingNextPage = false :  isLoading = false;
    notifyListeners();
  }

  void init() async {
    userProvider = Provider.of<UserProvider>(appContext, listen: false);
    scrollController.addListener(pagination);
    fetchUsers();
  }
}