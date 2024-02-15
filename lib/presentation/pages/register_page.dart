import 'package:flutter/material.dart';
import 'package:movies_app/presentation/pages/login_page.dart';
import 'package:movies_app/presentation/widgets/custom_auth_text.dart';

import '../../data/constatns/colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/my_behavior.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
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
                      const CustomAuthText(text: "Username"),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextField(
                        hintText: "Enter your username",
                        onChanged: (text) {},
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const CustomAuthText(text: "Email"),
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
                      const CustomAuthText(text: "Password"),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextField(
                        hintText: "Enter your password",
                        onChanged: (text) {},
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                  CustomButton(
                    label: "Signup",
                    onPressed: () {},
                    color: Colors.orangeAccent,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Center(
                    child: Text("Or signup with",style: TextStyle(color: Colors.white),),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomButton(
                    label: "Signup with google",
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
                            return const LoginView();
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
                              text: "Have an account ? ",
                              style: TextStyle(color: Colors.white),
                            ),
                            TextSpan(
                                text: "Login",
                                onEnter: (text) {},
                                style: const TextStyle(
                                    color: Colors.orangeAccent,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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
