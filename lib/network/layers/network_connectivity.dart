
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class NetworkConnectivity {
  static Future<bool> get status async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.first == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }
  
  static Future<bool> get isWiFiConnected async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.first == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> get isConnected async {
    if(await status){
      return true;
    }else{
      /// Show no internet dialog
      Get.showSnackbar(GetSnackBar(title: "No Internet".tr));
      return false;
    }
  }
}
