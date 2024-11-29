import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateOrderController extends GetxController {
  final orderIdController = TextEditingController();
  final orderDateController = TextEditingController();
  final planNameController = TextEditingController();
  final orderStatusController = TextEditingController();
  final draftController = TextEditingController();

  var createOrderList = <Map<String, String>>[].obs;

  void addOrderMaterials(List<Map<String, String>> materials) {
    createOrderList.assignAll(materials);
  }

  @override
  void onClose() {
    orderIdController.dispose();
    orderDateController.dispose();
    planNameController.dispose();
    orderStatusController.dispose();
    draftController.dispose();
    super.onClose();
  }
}
