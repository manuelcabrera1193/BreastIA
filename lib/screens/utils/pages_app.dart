import 'package:breast_ia/screens/auth/auth_screen.dart';
import 'package:breast_ia/screens/home/home_binding.dart';
import 'package:breast_ia/screens/home/home_screen.dart';
import 'package:breast_ia/screens/results/results_binding.dart';
import 'package:breast_ia/screens/results/results_error_screen.dart';
import 'package:breast_ia/screens/results/results_success_screen.dart';
import 'package:get/get.dart';

class PagesApp {
  static List<GetPage> screens = [
    GetPage(
      name: AuthScreen.routerName,
      page: () => const AuthScreen(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 1000),
    ),
    GetPage(
      name: HomeScreen.routerName,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 1000),
    ),
    GetPage(
      name: ResultsSuccessScreen.routerName,
      page: () => const ResultsSuccessScreen(),
      binding: ResultsBinding(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 1000),
    ),
    GetPage(
      name: ResultsErrorScreen.routerName,
      page: () => const ResultsErrorScreen(),
      binding: ResultsBinding(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 1000),
    ),
  ];
}
