import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  static Future<bool> checkConnectivity() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    switch (connectivityResult) {
      case (ConnectivityResult.mobile):
      case (ConnectivityResult.wifi):
      case (ConnectivityResult.ethernet):
        return true;
      case (ConnectivityResult.vpn):
      case (ConnectivityResult.bluetooth):
      case (ConnectivityResult.other):
      case (ConnectivityResult.none):
        return false;
    }
  }
}
