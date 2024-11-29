import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/login_controller.dart';
import 'package:jindal_dealer/constants/label_constant.dart';
import 'package:jindal_dealer/constants/color_properties.dart';
import 'package:jindal_dealer/constants/text_style.dart';
import 'package:jindal_dealer/screens/Create_Order/screen_order_list.dart';
import 'package:jindal_dealer/widgets/custom_text_from_field.dart';
class ScreenLogin extends StatelessWidget {
  const ScreenLogin({super.key});
  static const routeName = "screenLogin";
  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
    return WillPopScope(
      onWillPop: () async {
        return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text(Labels.exitApp),
            content: const Text(Labels.areYouSureYouWantToExit),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text(Labels.yes),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text(Labels.no),
              ),
            ],
          ),
        ) ??
            false;
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                // red green,blue ,opacity
                Color.fromRGBO(13, 150, 28, 1),
                Colors.white,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: Get.width * 0.9,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(Dimensions.CORNER_RADIUS_10),
                    boxShadow: [
                      BoxShadow(
                        color: grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Form(
                    key: loginController.formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            'Login Page',
                            style: login_page_normal_20_regular_800,
                          ),
                        ),
                        CustomTextFormField(
                          label: Labels.userName,
                          controller: loginController.userNameController,
                          validator: loginController.validateEmail,
                        ),
                        SizedBox(height: Get.height * 0.02,),
                        TextFormField(
                          controller: loginController.passwordController,
                          obscureText: !loginController.isPasswordVisible.value,
                          decoration: InputDecoration(
                            hintText: Labels.password,
                            hintStyle: set_hint_text_of_grey,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(Dimensions.Corner_radius_5),
                              borderSide: BorderSide(color:grey, width:Get.width * 0.003),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(Dimensions.CORNER_RADIUS_10),
                              borderSide: BorderSide(color: greenAccent, width:Get.width * 0.009),
                            ),
                            border: const OutlineInputBorder(),
                            suffixIcon: GestureDetector(
                              onTap: loginController.togglePasswordVisibility,
                              child: Icon(
                                loginController.isPasswordVisible.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                          ),
                          validator: loginController.validatePassword,
                        ),
                        SizedBox(height: Get.height * 0.02,),
                        ElevatedButton(
                          onPressed: () {
                            Get.toNamed(ScreenOrderList.routeName);
                          },
                          child: Text(Labels.login.tr),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(Get.width * 0.6,Get.height*0.05),
                            backgroundColor: greenAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
