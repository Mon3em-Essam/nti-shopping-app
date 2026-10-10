import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nti_shopping_app/core/routes/app_routes.dart';
import 'package:nti_shopping_app/core/widgets/custom_button.dart';
import 'package:nti_shopping_app/core/widgets/custom_text_form_feild.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEBEBEB),
      appBar: AppBar(
        backgroundColor: const Color(0xffEBEBEB),
        elevation: 0,
        title: const Center(child: Text("login")),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              physics: const BouncingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight:
                      constraints.maxHeight -
                      32, // لضمان أخذ كامل ارتفاع الشاشة
                ),
                child: IntrinsicHeight(
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
                      const SizedBox(height: 71),
                      CustomButton(
                        text: "Login",
                        onTap: () {
                          // التوجيه لـ appSection لكي يظهر الـ Bottom Navigation Bar
                          Navigator.pushReplacementNamed(
                            context,
                            AppRoutes.appSection,
                          );
                        },
                      ),
                      const Spacer(), // يظل يدفع النص لأسفل الشاشة
                      const SizedBox(height: 16),
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
          },
        ),
      ),
    );
  }
}
