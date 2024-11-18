import 'package:get/get.dart';
import 'package:jindal_dealer/model/ModelLogin.dart';
import 'package:jindal_dealer/network/network.dart';
import 'package:jindal_dealer/utils/extensions/logs.dart';

class LoginController extends GetxController{
  final loginModel = ModelLogin().obs;

  ///Create Login
  Future<void> makeLogin() async {

    BaseClientGenerator clientGenerator =
    BaseClientGenerator()..body= {}
      ..path = ApiServices.login
      ..shouldDisplayLoadingIndicator = true
      ..method = "POST";

    var data = await NetworkExecutor.execute<ModelLogin>(route: clientGenerator ,responseType: ModelLogin());

    data.whenOrNull(
      success: (successResult){
      /// on api success
    },
    failure: (failResult){
      ("Login error => +${failResult?.toJson()}").log();
    });
  }
}