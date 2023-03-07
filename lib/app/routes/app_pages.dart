import 'package:get/get.dart';

import '../modules/ForgotPassword/bindings/forgot_password_binding.dart';
import '../modules/ForgotPassword/views/forgot_password_view.dart';
import '../modules/ForgotPassword/views/forgot_password_view.dart';
import '../modules/NewPassword/bindings/new_password_binding.dart';
import '../modules/NewPassword/views/new_password_view.dart';
import '../modules/Sign-up/bindings/sign_up_binding.dart';
import '../modules/Sign-up/views/sign_up_view.dart';
import '../modules/Verification/bindings/verification_binding.dart';
import '../modules/Verification/views/verification_view.dart';
import '../modules/createSlider/bindings/create_slider_binding.dart';
import '../modules/createSlider/views/create_slider_view.dart';
import '../modules/detail/bindings/detail_binding.dart';
import '../modules/detail/views/detail_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/homeAdmin/bindings/home_admin_binding.dart';
import '../modules/homeAdmin/views/home_admin_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/loginWithnoTlp/bindings/login_withno_tlp_binding.dart';
import '../modules/loginWithnoTlp/views/login_withno_tlp_view.dart';
import '../modules/otp_verivication/bindings/otp_verivication_binding.dart';
import '../modules/otp_verivication/views/otp_verivication_view.dart';
import '../modules/produkData/bindings/produk_data_binding.dart';
import '../modules/produkData/views/produk_data_view.dart';
import '../modules/sliderData/bindings/slider_data_binding.dart';
import '../modules/sliderData/views/slider_data_view.dart';
import '../modules/splashScreen/bindings/splash_screen_binding.dart';
import '../modules/splashScreen/views/splash_screen_view.dart';
import '../modules/update/bindings/update_binding.dart';
import '../modules/update/views/update_view.dart';

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
    GetPage(
      name: _Paths.CREATE_SLIDER,
      page: () => CreateSliderView(),
      binding: CreateSliderBinding(),
    ),
    GetPage(
      name: _Paths.PRODUK_DATA,
      page: () => ProdukDataView(),
      binding: ProdukDataBinding(),
    ),
  ];
}
