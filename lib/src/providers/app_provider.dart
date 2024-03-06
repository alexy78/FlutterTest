import 'package:flutter/material.dart';
import 'package:test_app/src/services/connectivity_service.dart';
import 'package:test_app/src/services/location_service.dart';

class AppProvider extends ChangeNotifier {
  bool geolocationEnabled = false;
  bool connectivityEnabled = false;

  String _userName = '';
  String get userName => _userName;
  set userName(String newValue) {
    if (newValue != _userName) {
      _userName = newValue;
      notifyListeners();
    }
  }

  Future<void> checkLocationPermission() async {
    geolocationEnabled = await LocationService.checkLocationPermission();
    notifyListeners();
  }

  Future<void> checkConnectivity() async {
    connectivityEnabled = await ConnectivityService.checkConnectivity();
    notifyListeners();
  }
}
