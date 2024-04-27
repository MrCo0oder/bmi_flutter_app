
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibm_task/presentation/utils/app_constants.dart';
import 'package:ibm_task/presentation/utils/assets_manager.dart';
import 'package:ibm_task/presentation/utils/color_manager.dart';
import 'package:ibm_task/presentation/utils/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _startAnimation(() {});
  }

  @override
  Widget build(BuildContext context) {
    // var theme = Theme.of(context);
    var size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: ColorManager.white,
        body: Center(
          child: AnimatedBuilder(
              animation: _animationController,
              builder: (BuildContext context, Widget? child) {
                return RotationTransition(
                  turns:
                      Tween(begin: 0.0, end: 1.0).animate(_animationController),
                  child: SvgPicture.asset(
                    AssetsManager.splashLogo,
                    width: (size.height > size.width)
                        ? size.width * 0.4
                        : size.height * 0.4,
                    height: (size.height > size.width)
                        ? size.width * 0.4
                        : size.height * 0.4,
                  ),
                );
              }),
        ));
  }

  void _startAnimation(Function callback) {
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: AppConstants.splashDelay),
        animationBehavior: AnimationBehavior.preserve);
    _animationController.forward();
    _animationController.addListener(() {
      setState(() {
        if (_animationController.status == AnimationStatus.completed) {
          _navigateToOnBoarding();
        }
      });
    });
  }

  void _navigateToOnBoarding() {
    Navigator.of(context).pushReplacementNamed(Routes.onBoardingRoute);
  }

  @override
  void dispose() {
    _animationController.stop();
    _animationController.dispose();
    super.dispose();
  }
}
