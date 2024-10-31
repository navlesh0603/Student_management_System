import 'package:flutter/material.dart';
import 'package:student_management/routes.dart';
import 'package:student_management/screens/splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "School Managemnt  System",
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
