import 'package:get/get.dart';

import '../controllers/login_withno_tlp_controller.dart';

class LoginWithnoTlpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginWithnoTlpController>(
      () => LoginWithnoTlpController(),
    );
  }
}
