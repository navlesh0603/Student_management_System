import 'package:flutter/material.dart';
import 'package:student_management/screens/home_screen/home_screen.dart';
import 'package:student_management/screens/login_screen.dart';
import 'package:student_management/screens/splash_screen.dart';

Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
};
