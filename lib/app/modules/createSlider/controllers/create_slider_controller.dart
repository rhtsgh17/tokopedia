 import 'package:flutter/material.dart';
  import 'package:get/get.dart';
  import 'package:tokopedia/app/controllers/slider_controller.dart';

  class CreateSliderController extends GetxController {
    final active = true.obs;
    changeActivation() => active.toggle();

    TextEditingController gambarSlider = TextEditingController();
    TextEditingController desSlider = TextEditingController();

    uploadGambar() {
      final data = SliderController().addPhoto();
      gambarSlider.text = data;
    }

    final count = 0.obs;
    @override
    void onInit() {
      super.onInit();
    }

    @override
    void onReady() {
      super.onReady();
    }

    @override
    void onClose() {
      super.onClose();
    }

    void increment() => count.value++;
  }
