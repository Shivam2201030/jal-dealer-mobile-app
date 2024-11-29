import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jindal_dealer/constants/label_constant.dart';
import 'package:jindal_dealer/constants/text_style.dart';
import 'package:jindal_dealer/constants/color_properties.dart';
import 'package:jindal_dealer/model/create_order_model/create_order_model.dart';
import '../Add_Order_Materials/add_order_materials.dart';
import '../../widgets/custom_text_from_field.dart';
// import '../../controllers/create_order_controller.dart';
import 'create_order_controller.dart';

class ScreenCreateOrder extends StatelessWidget {
  ScreenCreateOrder({super.key});
  static const routeName = "createOrder";

  final controller = Get.put(CreateOrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Labels.createOrder),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.all(Get.width * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFormField(
              label: Labels.selectShoppingAddress,
              controller: controller.orderIdController,
            ),
            SizedBox(height: Get.height * 0.01),
            CustomTextFormField(
              label: Labels.finishType,
              controller: controller.orderDateController,
            ),
            SizedBox(height: Get.height * 0.01),
            CustomTextFormField(
              label: Labels.plan,
              controller: controller.planNameController,
            ),
            SizedBox(height: Get.height * 0.01),
            CustomTextFormField(
              label: Labels.remarks,
              controller: controller.orderStatusController,
            ),
            SizedBox(height: Get.height * 0.01),
            CustomTextFormField(
              label: Labels.draft,
              controller: controller.draftController,
            ),
            SizedBox(height: Get.height * 0.02),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(
                          width: Get.width * 0.001, color: Colors.greenAccent),
                    ),
                    child: Text(
                      Labels.cancel,
                      style: green_cancel_button_text_color,
                    ),
                  ),
                ),
                SizedBox(width: Get.width * 0.04),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: greenAccent,
                    ),
                    onPressed: () {
                      final order = Order(
                        orderId: controller.orderIdController.text,
                        orderDate: controller.orderDateController.text,
                        planName: controller.planNameController.text,
                        orderStatus: controller.orderStatusController.text,
                        draft: controller.draftController.text,
                      );
                      Get.back(result: order);
                    },
                    child: Text(
                      Labels.save,
                      style: green_save_button_text_color,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: Get.height * 0.02),
            Obx(() => controller.createOrderList.isNotEmpty
                ? Expanded(
              child:ListView.builder(
                itemCount: controller.createOrderList.length,
                itemBuilder: (context, index) {
                  final item = controller.createOrderList[index];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: Get.height * 0.01,
                          horizontal: Get.width * 0.02,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Material Code:', style:  font_size_16_grey_color),
                            Text(
                              '${item['Material Code'] ?? ''}',
                              style: font_size_16,
                            ),
                            SizedBox(height: Get.height * 0.008),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Quality:', style: font_size_16_grey_color),
                                      Text(
                                        '${item['Quality'] ?? ''}',
                                        style: font_size_16,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: Get.width * 0.15),
                                Expanded(
                                  child:Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Text('Length:', style: font_size_16_grey_color),
                                      Text(
                                        '${item['Length'] ?? ''}',
                                        style: font_size_16,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: Get.height * 0.008),
                            Text('LOUM:', style: font_size_16_grey_color),
                            Text(
                              '${item['LOUM'] ?? ''}',
                              style: font_size_16,
                            ),
                            SizedBox(height: Get.height * 0.008),
                            Text('Packing Type:', style: font_size_16_grey_color),
                            Text(
                              '${item['Packing Type'] ?? ''}',
                              style: font_size_16,
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: grey,
                        thickness: 1.0,
                        indent: Get.width * 0.02,
                        endIndent: Get.width * 0.02,
                      ),
                    ],
                  );
                },
              ),

            )
                : Center(
              // child: Text(
              //   Labels.noItemAddYet,
              //   style: normal_400_regular_15,
              // ),
            )),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        height: Get.height * 0.05,
        width: Get.width * 0.5,
        child: FloatingActionButton(
          onPressed: () async {
            final result = await
             Get.toNamed(AddOrderMaterials.routeName);
            //Get.to(() => AddOrderMaterials());
             if (result != null && result is List<Map<String, String>>) {
              controller.addOrderMaterials(result);
            }
          },
          backgroundColor: greenAccent,
          child: Text(
            Labels.addMaterial,
            style: add_material_button,
          ),
        ),
      ),
    );
  }
}
