import 'package:flutter/material.dart';
import 'package:nti_shopping_app/core/di/service_locator.dart';
import 'package:nti_shopping_app/core/storage_helper/startup_helper.dart';
import 'package:nti_shopping_app/features/home/presentation/view/screens/home_screen.dart';

void main() async {
  var startup = serviceLocator<StartupHelper>();
  await startup.startupAppInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}
