import 'package:get/get.dart';

// import '../../../controllers/product_controller.dart';

class DetailController extends GetxController {

  final count = 0.obs;
  @override
  void onInit() {
    //  ProdukController().filterData();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  // getDataDetail() {}
}
