import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_management/components/custom_button.dart';
import 'package:student_management/consts.dart';
import 'package:student_management/screens/home_screen/home_screen.dart';
import 'package:student_management/screens/teacher/t_home_screen.dart';

late bool _passwordVisible;

class TeacherLogin extends StatefulWidget {
  static String routeName = 'TeacherLogin';

  const TeacherLogin({super.key});

  @override
  State<TeacherLogin> createState() => _TeacherLoginState();
}

class _TeacherLoginState extends State<TeacherLogin> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.4,
                child: Stack(
                  children: [
                    Image.asset('assets/top_green.png'),
                    Positioned(
                      top: 100,
                      left: MediaQuery.of(context).size.width / 2 - 100,
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: const Color.fromRGBO(40, 194, 160, 1),
                              width: 5),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/splashscreen/splash_screen.png',
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height ,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              emailField(),
                              const SizedBox(
                                height: 20,
                              ),
                              passwordField(),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomButton(
                                onPress: () {
                                  if (_formKey.currentState!.validate()) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                TeacherHomeScreen()));
                                  }
                                },
                                title: "LOGIN",
                                iconData: Icons.arrow_forward_outlined,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Forgot Password ?",
                                style: GoogleFonts.openSans(
                                    fontSize: 15, fontWeight: FontWeight.w400),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  TextFormField emailField() {
    return TextFormField(
      textAlign: TextAlign.start,
      keyboardType: TextInputType.emailAddress,
      style: GoogleFonts.openSans(
        color: const Color.fromRGBO(0, 0, 0, 1),
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        labelText: "Email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: GoogleFonts.openSans(
          color: const Color.fromRGBO(0, 0, 0, 1),
          fontSize: 19,
          fontWeight: FontWeight.w400,
        ),
        hintStyle: GoogleFonts.openSans(
          color: const Color.fromRGBO(0, 0, 0, 1),
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
      ),
      validator: (value) {
        RegExp regExp = new RegExp(emailPattern);
        if (value == null || value.isEmpty) {
          return "Please Enter some  text";
        } else if (!regExp.hasMatch(value)) {
          return "Please Enter Valid Email";
        }
      },
    );
  }

  TextFormField passwordField() {
    return TextFormField(
      obscureText: _passwordVisible,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.visiblePassword,
      style: GoogleFonts.openSans(
        color: const Color.fromRGBO(0, 0, 0, 1),
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        labelText: "Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: GoogleFonts.openSans(
          color: const Color.fromRGBO(0, 0, 0, 1),
          fontSize: 19,
          fontWeight: FontWeight.w400,
        ),
        hintStyle: GoogleFonts.openSans(
          color: const Color.fromRGBO(0, 0, 0, 1),
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
          icon: Icon(_passwordVisible
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined),
        ),
      ),
      validator: (value) {
        if (value!.length < 5) {
          return "Password must be at least 5 characters";
        }
      },
    );
  }
}
