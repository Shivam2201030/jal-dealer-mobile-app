import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jindal_dealer/constants/label_constant.dart';
import 'package:jindal_dealer/model/ModelLogin.dart';
import 'package:jindal_dealer/network/network.dart';
import 'package:jindal_dealer/utils/extensions/logs.dart';

import '../../Create_Order/screen_order_list.dart';

class LoginController extends GetxController {
  final loginModel = ModelLogin().obs;
  late TextEditingController userNameController, passwordController;
  late GlobalKey<FormState> formKey;

  @override
  void onInit() {
    super.onInit();
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  @override
  void onClose() {
    userNameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  // Validate email format
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    // final gmailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$');

    final gmailRegex = RegExp(r'sales.guj');
    if (!gmailRegex.hasMatch(value)) {
      return Labels.pleaseEnterAvalidGmailAddress;
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return Labels.pleaseEnterThePassword;
    }
    if (value.length < 6) {
      return Labels.passwordMustBeAtLeast6CharacterLong;
    }
    return null;
  }

  RxBool isPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // API Call for Login
  Future<void> makeLogin() async {
    if (formKey.currentState?.validate() ?? false) {
      BaseClientGenerator clientGenerator = BaseClientGenerator()
        ..body = {
          'email': userNameController.text,
          'password': passwordController.text,
        }
        ..path = ApiServices.login
        ..shouldDisplayLoadingIndicator = true
        ..method = "POST";

      var data = await NetworkExecutor.execute<ModelLogin>(
        route: clientGenerator,
        responseType: ModelLogin(),
      );

      data.whenOrNull(
        success: (successResult) {
          Get.toNamed(ScreenOrderList.routeName);
        },
        failure: (failResult) {
          ("Login error => +${failResult?.toJson()}").log();
        },
      );
    }
  }
}



// class LoginController extends GetxController{
//   final loginModel = ModelLogin().obs;
//   late TextEditingController userNameController, passwordController;
//
//   ///Create Login
//   Future<void> makeLogin() async {
//     BaseClientGenerator clientGenerator =
//     BaseClientGenerator()..body= {}
//       ..path = ApiServices.login
//       ..shouldDisplayLoadingIndicator = true
//       ..method = "POST";
//
//     var data = await NetworkExecutor.execute<ModelLogin>(route: clientGenerator ,responseType: ModelLogin());
//
//     data.whenOrNull(
//       success: (successResult){
//       /// on api success
//     },
//     failure: (failResult){
//       ("Login error => +${failResult?.toJson()}").log();
//     });
//   }
// }
