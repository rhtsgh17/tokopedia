// ignore: unused_import
import 'dart:developer';

import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../controllers/product_controller.dart';

class ProdukDataController extends GetxController {
  //TODO: Implement ProdukDataController

  final count = 0.obs;
  @override
  void onInit() {
    //   produk = ProdukController().getData();
    // log('jalan =>');
    // print(data);

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
