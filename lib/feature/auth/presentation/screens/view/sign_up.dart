import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nti_shopping_app/core/widgets/custom_button.dart';
import 'package:nti_shopping_app/core/widgets/custom_text_form_feild.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEBEBEB),
      appBar: AppBar(
        backgroundColor: Color(0xffEBEBEB),
        title: Center(child: Text("Sign up")),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5),
              CustomTextFormField(
                label: "Name",
                hint: "Enter Your Name",
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                label: "phone",
                hint: "Enter Your phone",
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20),
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
              SizedBox(height: 20),
              CustomTextFormField(
                label: "Cofirm Password",
                hint: "Cofirm Your Password",
                obscureText: true,
              ),
              SizedBox(height: 32),
              CustomButton(text: "Sign up", onTap: () {}),
              SizedBox(height: 100),
              Center(
                child: Text.rich(
                  TextSpan(
                    text: "Already have an account? ",
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color(0xff212121),
                    ),
                    children: [
                      TextSpan(
                        text: "Login",
                        style: const TextStyle(
                          color: Color(0xff212121),
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
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
