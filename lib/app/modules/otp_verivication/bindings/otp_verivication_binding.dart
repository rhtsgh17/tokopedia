import 'package:get/get.dart';

import '../controllers/otp_verivication_controller.dart';

class OtpVerivicationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpVerivicationController>(
      () => OtpVerivicationController(),
    );
  }
}
