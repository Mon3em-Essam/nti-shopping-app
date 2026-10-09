import 'package:flutter/material.dart';
import 'package:nti_shopping_app/core/routes/app_routes.dart';
import 'package:nti_shopping_app/core/theme/app_colors.dart';
import 'package:nti_shopping_app/core/widgets/custom_button.dart';

class HelloScreen extends StatefulWidget {
  const HelloScreen({super.key});

  @override
  State<HelloScreen> createState() => _HelloScreenState();
}

class _HelloScreenState extends State<HelloScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 24,
          mainAxisAlignment: .center,
          children: [
            Image.asset("assets/images/hello-1.png", width: 343, height: 261),
            Image.asset("assets/images/hello-2.png", width: 147, height: 74),
            CustomButton(
              text: "Sign up",
              onTap: () {
                Navigator.pushReplacementNamed(context, AppRoutes.register);
              },
            ),
            CustomButton(
              text: "Login",
              onTap: () {
                Navigator.pushReplacementNamed(context, AppRoutes.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
