import 'package:flutter/material.dart';
import 'package:movies_app/presentation/pages/bottom_nav_bar.dart';
import 'package:movies_app/presentation/pages/register_page.dart';
import 'package:movies_app/presentation/widgets/custom_text_field.dart';

import '../../data/constatns/colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/my_behavior.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(gradient: kLinearGradient),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        "Login to continue using the app . .",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white54,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        "Email",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextField(
                        hintText: "Enter your email",
                        onChanged: (text) {},
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        "Password",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextField(
                        hintText: "Enter your password",
                        onChanged: (text) {},
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 2, bottom: 2),
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text("Forgot Password ?",style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ],
                  ),
                  CustomButton(
                    label: "Login",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const BottomNavBar();
                          },
                        ),
                      );
                    },
                    color: Colors.orangeAccent,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Center(
                    child: Text("Or login with",style: TextStyle(color: Colors.white),),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomButton(
                    label: "Login with google",
                    onPressed: () {},
                    color: Colors.red,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const RegisterPage();
                          },
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                                text: "Don't have an account ? ",
                                style: TextStyle(color: Colors.white)),
                            TextSpan(
                                text: "Register",
                                onEnter: (text) {},
                                style: const TextStyle(
                                    color: Colors.orangeAccent,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
