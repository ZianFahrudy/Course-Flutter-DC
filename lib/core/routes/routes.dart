import 'package:event_app/features/auth/presentation/pages/home_page.dart';
import 'package:event_app/features/auth/presentation/pages/login_page.dart';
import 'package:event_app/features/auth/presentation/pages/register_page.dart';
import 'package:event_app/features/auth/presentation/pages/register_success_page.dart';
import 'package:get/get.dart';

class Routes {
  static List<GetPage<void>> page = <GetPage<void>>[
    // * AUTH
    GetPage(
      name: RoutesName.loginPage,
      page: LoginPage.new,
      transition: Transition.cupertino,
    ),
    GetPage(
      name: RoutesName.registerPage,
      page: RegisterPage.new,
      transition: Transition.cupertino,
    ),
    GetPage(
      name: RoutesName.registerSuccessPage,
      page: RegisterSuccessPage.new,
      transition: Transition.cupertino,
    ),

    //* HOME
    GetPage(
      name: RoutesName.homePage,
      page: HomePage.new,
      transition: Transition.cupertino,
    )
  ];
}

class RoutesName {
  static const loginPage = '/login';
  static const homePage = '/home';
  static const registerPage = '/register';
  static const registerSuccessPage = '/register-success';
}
