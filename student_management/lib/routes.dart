import 'package:flutter/material.dart';
import 'package:student_management/screens/home_screen/home_screen.dart';
import 'package:student_management/screens/login_option.dart';
import 'package:student_management/screens/login_screen.dart';
import 'package:student_management/screens/splash_screen.dart';
import 'package:student_management/screens/student/s_home_screen.dart';
import 'package:student_management/screens/student/student_login.dart';
import 'package:student_management/screens/teacher/add_account.dart';
import 'package:student_management/screens/teacher/attendance_screen.dart';
import 'package:student_management/screens/teacher/homework.dart';
import 'package:student_management/screens/teacher/t_home_screen.dart';
import 'package:student_management/screens/teacher/tearcher_login.dart';

Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  ChooseOptionScreen.routeName: (context) => ChooseOptionScreen(),
  StudentLogin.routeName: (context) => StudentLogin(),
  TeacherLogin.routeName: (context) => TeacherLogin(),
  TeacherHomeScreen.routeName: (context) => TeacherHomeScreen(),
  StudentHomeScreen.routeName: (context) => StudentHomeScreen(),
  AddAccount.routeName: (context) => AddAccount(),
  HomeworkScreen.routeName: (context) => HomeworkScreen(),
  Attendencescreen.routeName: (context) => Attendencescreen(),
};
