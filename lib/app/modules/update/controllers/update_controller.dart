import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UpdateController extends GetxController {
  // ignore: todo
  //TODO: Implement UpdateDataController
  final listData = Get.arguments;
  RxBool aktif = true.obs;
  change() => aktif.toggle();
  TextEditingController gambar = TextEditingController();
  TextEditingController keterangan = TextEditingController();
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
  void onClose() {}
  void increment() => count.value++;
}
