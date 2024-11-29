import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jindal_dealer/constants/color_properties.dart';
import 'package:jindal_dealer/constants/text_style.dart';
class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.label,
    required this.controller,
    this.validator,
  });
  final String label;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: label,
        hintStyle: custom_text_from_feild_hintstyle,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.Corner_radius_5),
          borderSide: BorderSide(color: grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.CORNER_RADIUS_10),
          borderSide: BorderSide(color: greenAccent, width: Get.width * 0.008), // Green color when focused
        ),
        border: const OutlineInputBorder(),
      ),
      validator: validator,
    );
  }
}
