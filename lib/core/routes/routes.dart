import 'package:event_app/core/navigation/main_navigation.dart';
import 'package:event_app/features/auth/presentation/pages/home_page.dart';
import 'package:event_app/features/auth/presentation/pages/login_page.dart';
import 'package:event_app/features/auth/presentation/pages/register_page.dart';
import 'package:event_app/features/auth/presentation/pages/register_success_page.dart';
import 'package:event_app/features/event/presentation/pages/detail_event_page.dart';
import 'package:event_app/features/event/presentation/pages/search_event_page.dart';
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

    //* EVENT
    GetPage(
      name: RoutesName.searchEventPage,
      page: SearchEventPage.new,
      transition: Transition.cupertino,
    ),
    GetPage(
      name: RoutesName.detailEventPage,
      page: DetailEventPage.new,
      transition: Transition.cupertino,
    ),

    //* HOME
    GetPage(
      name: RoutesName.homePage,
      page: HomePage.new,
      transition: Transition.cupertino,
    ),
    GetPage(
      name: RoutesName.mainNavigation,
      page: MainNavigation.new,
      transition: Transition.cupertino,
    ),
  ];
}

class RoutesName {
  static const loginPage = '/login';
  static const homePage = '/home';
  static const registerPage = '/register';
  static const registerSuccessPage = '/register-success';
  static const mainNavigation = '/main-navigation';
  static const searchEventPage = '/search-event';
  static const detailEventPage = '/detail-event';
}
