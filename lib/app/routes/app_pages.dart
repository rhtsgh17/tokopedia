import 'package:get/get.dart';

import 'package:tokopedia/app/modules/ForgotPassword/bindings/forgot_password_binding.dart';
import 'package:tokopedia/app/modules/ForgotPassword/views/forgot_password_view.dart';
import 'package:tokopedia/app/modules/NewPassword/bindings/new_password_binding.dart';
import 'package:tokopedia/app/modules/NewPassword/views/new_password_view.dart';
import 'package:tokopedia/app/modules/Sign-up/bindings/sign_up_binding.dart';
import 'package:tokopedia/app/modules/Sign-up/views/sign_up_view.dart';
import 'package:tokopedia/app/modules/Verification/bindings/verification_binding.dart';
import 'package:tokopedia/app/modules/Verification/views/verification_view.dart';
import 'package:tokopedia/app/modules/detail/bindings/detail_binding.dart';
import 'package:tokopedia/app/modules/detail/views/detail_view.dart';
import 'package:tokopedia/app/modules/home/bindings/home_binding.dart';
import 'package:tokopedia/app/modules/home/views/home_view.dart';
import 'package:tokopedia/app/modules/homeAdmin/bindings/home_admin_binding.dart';
import 'package:tokopedia/app/modules/homeAdmin/views/home_admin_view.dart';
import 'package:tokopedia/app/modules/login/bindings/login_binding.dart';
import 'package:tokopedia/app/modules/login/views/login_view.dart';
import 'package:tokopedia/app/modules/loginWithnoTlp/bindings/login_withno_tlp_binding.dart';
import 'package:tokopedia/app/modules/loginWithnoTlp/views/login_withno_tlp_view.dart';
import 'package:tokopedia/app/modules/otp_verivication/bindings/otp_verivication_binding.dart';
import 'package:tokopedia/app/modules/otp_verivication/views/otp_verivication_view.dart';
import 'package:tokopedia/app/modules/sliderData/bindings/slider_data_binding.dart';
import 'package:tokopedia/app/modules/sliderData/views/slider_data_view.dart';
import 'package:tokopedia/app/modules/splashScreen/bindings/splash_screen_binding.dart';
import 'package:tokopedia/app/modules/splashScreen/views/splash_screen_view.dart';
import 'package:tokopedia/app/modules/update/bindings/update_binding.dart';
import 'package:tokopedia/app/modules/update/views/update_view.dart';

import '../modules/ForgotPassword/views/forgot_password_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.VERIFICATION,
      page: () => VerificationView(),
      binding: VerificationBinding(),
    ),
    GetPage(
      name: _Paths.NEW_PASSWORD,
      page: () => NewPasswordView(),
      binding: NewPasswordBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL,
      page: () => DetailView(),
      binding: DetailBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_WITHNO_TLP,
      page: () => LoginWithnoTlpView(),
      binding: LoginWithnoTlpBinding(),
    ),
    GetPage(
      name: _Paths.OTP_VERIVICATION,
      page: () => OtpVerivicationView(),
      binding: OtpVerivicationBinding(),
    ),
    GetPage(
      name: _Paths.HOME_ADMIN,
      page: () => HomeAdminView(),
      binding: HomeAdminBinding(),
    ),
    GetPage(
      name: _Paths.SLIDER_DATA,
      page: () => SliderDataView(),
      binding: SliderDataBinding(),
    ),
    GetPage(
      name: _Paths.UPDATE,
      page: () => UpdateView(),
      binding: UpdateBinding(),
    ),
  ];
}
