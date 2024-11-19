import 'package:flutter/material.dart';
import 'package:student_management/screens/login_screen.dart';
import 'package:student_management/screens/student/student_login.dart';
import 'package:student_management/screens/teacher/tearcher_login.dart';

class ChooseOptionScreen extends StatefulWidget {
  static String routeName = 'ChooseOption';
  const ChooseOptionScreen({Key? key}) : super(key: key);

  @override
  State<ChooseOptionScreen> createState() => _ChooseOptionScreenState();
}

class _ChooseOptionScreenState extends State<ChooseOptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 480),
          // margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.4,
                child: Stack(
                  children: [
                    Image.asset('assets/top_green.png'),
                    Positioned(
                      top: 100, // Position the image at the bottom
                      left: MediaQuery.of(context).size.width / 2 -
                          100, // Center horizontally
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
                            height:
                                150, // Adjust the height to fit the container
                            width: 150, // Adjust the width to fit the container
                            fit: BoxFit.cover, // Ensures the image fits well
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 49),
              Text(
                'Choose your option',
                style: TextStyle(
                  color: const Color(0xFF0C46C4),
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Open Sans',
                ),
              ),
              const SizedBox(height: 51),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OptionButton(
                    iconPath: 'assets/icons/Student.png',
                    label: 'Student',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StudentLogin()),
                      );
                    },
                  ),
                  const SizedBox(width: 76),
                  OptionButton(
                    iconPath: 'assets/icons/teacher.png',
                    label: 'Teacher',
                    onTap: () {
                      // Navigate to the Teacher screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TeacherLogin()),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 51),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class OptionButton extends StatelessWidget {
  final String iconPath;
  final String label;
  final VoidCallback onTap;

  const OptionButton({
    Key? key,
    required this.iconPath,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: const Color(0xFF0C46C4),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Image.asset(
                iconPath,
                width: 60,
                height: 60,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w400,
            fontFamily: 'Open Sans',
          ),
        ),
      ],
    );
  }
}
