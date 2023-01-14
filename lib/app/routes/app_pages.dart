import 'package:get/get.dart';

import 'package:tokopedia/app/modules/ForgotPassword/bindings/forgot_password_binding.dart';
import 'package:tokopedia/app/modules/ForgotPassword/views/forgot_password_view.dart';
import 'package:tokopedia/app/modules/NewPassword/bindings/new_password_binding.dart';
import 'package:tokopedia/app/modules/NewPassword/views/new_password_view.dart';
import 'package:tokopedia/app/modules/Sign-up/bindings/sign_up_binding.dart';
import 'package:tokopedia/app/modules/Sign-up/views/sign_up_view.dart';
import 'package:tokopedia/app/modules/Verification/bindings/verification_binding.dart';
import 'package:tokopedia/app/modules/Verification/views/verification_view.dart';
import 'package:tokopedia/app/modules/home/bindings/home_binding.dart';
import 'package:tokopedia/app/modules/home/views/home_view.dart';
import 'package:tokopedia/app/modules/login/bindings/login_binding.dart';
import 'package:tokopedia/app/modules/login/views/login_view.dart';
import 'package:tokopedia/app/modules/splashScreen/bindings/splash_screen_binding.dart';
import 'package:tokopedia/app/modules/splashScreen/views/splash_screen_view.dart';

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
  ];
}
