import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';

class BaseViewModel extends ChangeNotifier {
  bool _isNetworkAvailable = true;
  bool _isLoading = false;
  bool disposed = false;
  late StreamSubscription<ConnectivityResult> networkListener;

  bool get isLoading => _isLoading;
  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  bool get isNetworkAvailable => _isNetworkAvailable;
  set isNetworkAvailable(bool val) {
    _isNetworkAvailable = val;
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
    networkListener.cancel();
  }
}
