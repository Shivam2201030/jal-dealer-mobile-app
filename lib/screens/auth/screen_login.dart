import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jindal_dealer/constants/text_style.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({super.key});
  static const routeName = "screenLogin";

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
        body: Text("LOGIN test".tr,style: normal_700_bold_green_25,)
    );
  }
}
