import 'package:flutter/material.dart';
import 'package:nti_shopping_app/feture/auth/presentation/screens/view/login.dart';
import 'package:nti_shopping_app/feture/auth/presentation/screens/view/sign_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Login(), debugShowCheckedModeBanner: false);
  }
}
