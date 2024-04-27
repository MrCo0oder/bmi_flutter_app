
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ibm_task/presentation/utils/color_manager.dart';
import 'package:ibm_task/presentation/utils/routes_manager.dart';
import 'package:ibm_task/widget/form_container_widget.dart';

import '../../widget/custom_button.dart';
import '../login/login_view.dart';
import '../utils/strings_manager.dart';
// import 'package:quiz_app/screens/home_screen.dart';

// import 'package:ibm_task/screens/login_page.dart';
// import 'package:quiz_app/widget/form_container_widget.dart';

// import '../service/firebase_auth_services.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  // final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("SignUp"),
      // ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sign Up",
                style: TextStyle(color: ColorManager.primary,fontSize: 27, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              FormContainerWidget(
                controller: _usernameController,
                hintText: "Username",
                isPasswordField: false,
              ),
              SizedBox(
                height: 10,
              ),
              FormContainerWidget(
                controller: _emailController,
                hintText: "Email",
                isPasswordField: false,
              ),
              SizedBox(
                height: 10,
              ),
              FormContainerWidget(
                controller: _passwordController,
                hintText: "Password",
                isPasswordField: true,
              ),
              SizedBox(
                height: 30,
              ),
              CustomButton(label: AppStrings.signup,
                onClick: () {},
              ),
              const SizedBox(height: 20,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  const SizedBox(width: 5,),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed(Routes.loginRoute);
                      },
                      child: Text("Login", style: TextStyle(color:ColorManager.primary, fontWeight: FontWeight.bold),))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // void _signUp() async {
  //   // String username = _usernameController.text;
  //   String email = _emailController.text;
  //   String password = _passwordController.text;

  //   User? user = await _auth.signUpWithEmailAndPassword(email, password);

  //   if (user!= null){
  //     print("User is successfully created");
  //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>HomeScreen()));
  //   } else{
  //     print("Some error happend");
  //   }

  // }

}
 