import 'package:flutter/material.dart';
import 'package:ibm_task/presentation/utils/color_manager.dart';
import 'package:ibm_task/presentation/utils/routes_manager.dart';
import 'package:ibm_task/presentation/utils/strings_manager.dart';
import 'package:ibm_task/widget/form_container_widget.dart';

import '../../widget/custom_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // bool _isSigning = false;

  // final FirebaseAuthService _auth = FirebaseAuthService();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.login,
                style: Theme.of(context)
                    .textTheme
                    .displayLarge
                    ?.copyWith(color: ColorManager.darkBlue),
              ),
              const SizedBox(
                height: 30,
              ),
              FormContainerWidget(
                controller: _emailController,
                hintText: AppStrings.email,
                isPasswordField: false,
              ),
              const SizedBox(
                height: 10,
              ),
              FormContainerWidget(
                controller: _passwordController,
                hintText: AppStrings.password,
                isPasswordField: true,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                label: AppStrings.login,
                onClick: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(AppStrings.notMemberSignUp),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacementNamed(Routes.registerRoute);
                      },
                      child: Text(
                        AppStrings.signup,
                        style: TextStyle(
                            color: ColorManager.primary,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Soft login"),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacementNamed(Routes.mainScreen);
                      },
                      child: Text(
                        "Lets go!",
                        style: TextStyle(
                            color: ColorManager.primary,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
