import 'package:flutter/material.dart';
import 'package:ibm_task/presentation/history/history.dart';
import 'package:ibm_task/presentation/login/login_view.dart';
import 'package:ibm_task/presentation/register/register_view.dart';
import 'package:ibm_task/presentation/utils/strings_manager.dart';
import '../main/main_screen.dart';
import '../onboarding/onboarding_view.dart';
import '../splash/splash_view.dart';
import 'color_manager.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String onBoardingRoute = "/onBoarding";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
  static const String mainScreen = "/mainScreen";
  static const String historyPage = "/historyPage";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case Routes.mainScreen:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case Routes.historyPage:
        return MaterialPageRoute(builder: (_) =>  HistoryPage());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (BuildContext context) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
                elevation: 1,
              ),
              body: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.close_rounded,
                      size: 25.0,
                      color: ColorManager.error,
                    ),
                    Text(
                      AppStrings.noRouteFound,
                    ),
                  ],
                ),
              ),
            ));
  }
}
