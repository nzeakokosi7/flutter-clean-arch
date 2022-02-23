import 'package:flutter/cupertino.dart';
import 'package:wayve_test_app/core/ui/navigation/navigation.dart';

import '../../../di.dart';

class BaseViewModel extends ChangeNotifier {
  final navigationService = locator<NavigationService>();


  bool _isLoading = false;
  bool disposed = false;

  bool get isLoading => _isLoading;
  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  void setLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    disposed = true;
  }
}
