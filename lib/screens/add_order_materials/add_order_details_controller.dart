import 'package:get/get.dart';
import 'package:flutter/material.dart';

class OrderDetailsController extends GetxController {
  var material = ''.obs;
  var quality = ''.obs;
  var length = ''.obs;
  var loum = ''.obs;
  var packingType = ''.obs;

  List<Map<String, String>> materialsList = <Map<String, String>>[].obs;

  late TextEditingController materialController;
  late TextEditingController qualityController;
  late TextEditingController lengthController;

  @override
  void onInit() {
    super.onInit();
    materialController = TextEditingController();
    qualityController = TextEditingController();
    lengthController = TextEditingController();

    materialController.addListener(() {
      material.value = materialController.text;
    });

    qualityController.addListener(() {
      quality.value = qualityController.text;
    });

    lengthController.addListener(() {
      length.value = lengthController.text;
    });
  }

  void addMaterial() {
    materialsList.add({
      'Material Code': material.value,
      'Quality': quality.value,
      'Length': length.value,
      'LOUM': loum.value,
      'Packing Type': packingType.value,
    });
    clearFields();
  }

  void clearFields() {
    materialController.clear();
    qualityController.clear();
    lengthController.clear();
    loum.value = '';
    packingType.value = '';
  }

  @override
  void onClose() {
    materialController.dispose();
    qualityController.dispose();
    lengthController.dispose();
    super.onClose();
  }
}
