import 'package:flutter/material.dart';
// import 'package:student_management/routes.dart';
import 'package:student_management/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = 'SplashScreen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isPositioned = false;
  bool _isScaled = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        _isPositioned = true;
        _isScaled = true; // Start scaling animation
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    //directs to login screen

    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushNamedAndRemoveUntil(
          context, LoginScreen.routeName, (route) => false);
    });

    return Scaffold(
      
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(seconds: 4),
            curve: Curves.easeInOut,
            left: _isPositioned ? 0 : -60,
            right: _isPositioned ? null : screenWidth - 20,
            top: 0,
            child: Image.asset(
              'assets/splashscreen/topleft.png',
              errorBuilder:
                  (BuildContext context, Object error, StackTrace? stackTrace) {
                return const Text('Error loading image');
              },
            ),
          ),

          // Center Logo with scaling animation
          Center(
            child: AnimatedScale(
              scale:
                  _isScaled ? 1.5 : 0.5, // Scale to 0.5 initially, then to 1.0
              duration: const Duration(
                  seconds: 2), // Duration of the scaling animation
              curve: Curves.easeInOut, // Animation curve
              child: SizedBox(
                height: screenHeight / 4.5,
                width: screenWidth,
                child: Image.asset(
                  'assets/splashscreen/splash_screen.png',
                  fit: BoxFit.contain,
                  errorBuilder: (BuildContext context, Object error,
                      StackTrace? stackTrace) {
                    return const Text('Error loading image');
                  },
                ),
              ),
            ),
          ),

          // Bottom logo
          AnimatedPositioned(
            duration: const Duration(seconds: 4),
            curve: Curves.easeInOut,
            left: 0, // Center horizontally
            right: 0, // Center horizontally
            bottom: _isPositioned ? 0 : -100,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/splashscreen/bottom.png',
                errorBuilder: (BuildContext context, Object error,
                    StackTrace? stackTrace) {
                  return const Text('Error loading image');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
