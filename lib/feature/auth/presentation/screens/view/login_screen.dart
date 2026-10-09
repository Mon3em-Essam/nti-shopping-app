import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nti_shopping_app/core/routes/app_routes.dart';
import 'package:nti_shopping_app/core/widgets/custom_button.dart';
import 'package:nti_shopping_app/core/widgets/custom_text_form_feild.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _SignUpState();
}

class _SignUpState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEBEBEB),
      appBar: AppBar(
        backgroundColor: Color(0xffEBEBEB),
        title: Center(child: Text("login")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFormField(
                label: "Email",
                hint: "Enter Your Email",
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                label: "Password",
                hint: "Enter Your Password",
                obscureText: true,
              ),
              SizedBox(height: 71),
              CustomButton(
                text: "Login",
                onTap: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.home);
                },
              ),
              Spacer(),
              Center(
                child: Text.rich(
                  TextSpan(
                    text: "Don’t have an account?  ",
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color(0xff212121),
                    ),
                    children: [
                      TextSpan(
                        text: "sign up",
                        style: const TextStyle(
                          color: Color(0xff212121),
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.register,
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
