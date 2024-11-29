import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jindal_dealer/constants/label_constant.dart';
import 'package:jindal_dealer/constants/text_style.dart';
import 'package:jindal_dealer/constants/color_properties.dart';
import 'package:jindal_dealer/widgets/custom_text_from_field.dart';
import 'add_order_details_controller.dart';
class AddOrderMaterials extends StatelessWidget {
    AddOrderMaterials({super.key});
    static const routeName="addMaterial";
  final OrderDetailsController controller = Get.put(OrderDetailsController());
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Labels.addDetailsFormt),
        backgroundColor: transparent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(Get.width * 0.04),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Get.height * 0.02),
                CustomTextFormField(
                  label: Labels.materialCode,
                  controller: controller.materialController,
                ),
                SizedBox(height: Get.height * 0.02),
                CustomTextFormField(
                  label: Labels.qty,
                  controller: controller.qualityController,
                ),
                SizedBox(height: Get.height * 0.02),
                CustomTextFormField(
                  label: Labels.length,
                  controller: controller.lengthController,
                ),

                SizedBox(height: Get.height * 0.01),
                Obx(() => DropdownButtonFormField<String>(
                  value: controller.loum.value.isNotEmpty
                      ? controller.loum.value
                      : null,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Dimensions.Corner_radius_5),
                      borderSide: BorderSide(color: grey, width: Get.width * 0.003),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Dimensions.CORNER_RADIUS_10),
                      borderSide: BorderSide(color: greenAccent, width: Get.width * 0.009),
                    ),
                  ),
                  hint: Text(Labels.loum),
                  items: [
                    DropdownMenuItem(
                      value: 'Option 1',
                      child: Text('Option 1'),
                    ),
                    DropdownMenuItem(
                      value: 'Option 2',
                      child: Text('Option 2'),
                    ),
                  ],
                  onChanged: (value) {
                    controller.loum.value = value ?? '';
                  },
                )),

                SizedBox(height: Get.height * 0.02),

                Obx(() => DropdownButtonFormField<String>(
                  value: controller.packingType.value.isNotEmpty
                      ? controller.packingType.value
                      : null,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Dimensions.CORNER_RADIUS_10),
                      borderSide: BorderSide(color: grey, width: Get.width * 0.003),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Dimensions.CORNER_RADIUS_10),
                      borderSide: BorderSide(color: greenAccent, width: Get.width * 0.009),
                    ),
                  ),
                  hint: Text(Labels.packingType),
                  items: [
                    DropdownMenuItem(
                      value: 'Box',
                      child: Text('Box'),
                    ),
                    DropdownMenuItem(
                      value: 'Bag',
                      child: Text('Bag'),
                    ),
                  ],
                  onChanged: (value) {
                    controller.packingType.value = value ?? '';
                  },
                )),

                SizedBox(height: Get.height * 0.04),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {

                          controller.addMaterial();
                           Get.back(result: controller.materialsList);

                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: greenAccent,
                          side: BorderSide(color: greenAccent),
                        ),
                        child: Text(
                          Labels.save,
                          style: green_save_button_text_color,
                        ),
                      ),
                    ),

                  ],
                ),
              ],
            ),
            // SizedBox(height: Get.height * 0.02),
          ],
        ),
      ),
    );
  }
}
