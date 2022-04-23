import 'package:get/get.dart';

import '../../features/authentication/marketer/login_screen.dart';
import '../../features/authentication/pages/reset_password.dart';
import '../../splash_screen.dart';

class AppRoutes {
  AppRoutes._(); //this is to prevent anyone from instantiating this object
  static final routes = [
    GetPage(name: '/', page: () => const SplashScreen()),
    GetPage(name: '/login', page: () => MarketerLoginScreen()),
    //GetPage(name: '/settings', page: () => SettingsUI()),
    GetPage(name: '/reset-password', page: () => const ResetPassword()),
  ];
}
