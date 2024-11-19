import 'package:flutter/material.dart';
import 'package:student_management/screens/teacher/add_account.dart';
import 'package:student_management/screens/teacher/attendance_screen.dart';
import 'package:student_management/screens/teacher/homework.dart';

class TeacherHomeScreen extends StatelessWidget {
  const TeacherHomeScreen({super.key});

  static String routeName = "TeacherHomeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
            child: Stack(
              children: [
                Image.asset('assets/top_green.png'),
                Positioned(
                  top: 125,
                  left: MediaQuery.of(context).size.width / 2 - 75,
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: const Color.fromRGBO(40, 194, 160, 1),
                          width: 5),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/defaul_profile.png',
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
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Cards(
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Attendencescreen(),
                            ),
                          );
                        },
                        icon: 'assets/icons/Attendance.png',
                        title: 'Attendance',
                      ),
                      Cards(
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeworkScreen(),
                            ),
                          );
                        },
                        icon: 'assets/icons/Homework.png',
                        title: 'Homework',
                      ),
                      Cards(
                        onPress: () {},
                        icon: 'assets/icons/Exam.png',
                        title: 'Exam',
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Cards(
                        onPress: () {},
                        icon: 'assets/icons/exam_routine.png',
                        title: 'Exam Routine',
                      ),
                      // Cards(
                      //   onPress: () {},
                      //   icon: 'assets/icons/solution.png',
                      //   title: 'Solutions',
                      // ),
                      Cards(
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddAccount(),
                            ),
                          );
                          print('Add Account button pressed');
                        },
                        icon: 'assets/icons/add_user.png',
                        title: 'Add Account',
                      ),
                      Cards(
                        onPress: () {
                          print('pressed');
                        },
                        icon: 'assets/icons/Notice.png',
                        title: 'Notice',
                      ),
                    ],
                  ),
                  // SizedBox(height: 16),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     Cards(
                  //       onPress: () {
                  //         Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //             builder: (context) => const AddAccount(),
                  //           ),
                  //         );
                  //         print('Add Account button pressed');
                  //       },
                  //       icon: 'assets/icons/add_user.png',
                  //       title: 'Add Account',
                  //     ),
                  //   ],
                  // ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Cards extends StatelessWidget {
  const Cards(
      {super.key,
      required this.onPress,
      required this.icon,
      required this.title});
  final Function() onPress;
  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: MediaQuery.of(context).size.width / 3.2,
        height: MediaQuery.of(context).size.height / 7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromRGBO(40, 194, 160, 0.25),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              // height: 100,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(12, 70, 196, 1),
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
