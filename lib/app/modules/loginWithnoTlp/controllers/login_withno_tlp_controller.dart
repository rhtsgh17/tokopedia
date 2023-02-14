import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginWithnoTlpController extends GetxController {
  TextEditingController phone = TextEditingController();
  final showhidepw = true.obs;
  changeEye() => showhidepw.toggle();
  final count = 0.obs;
  TextEditingController password = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
