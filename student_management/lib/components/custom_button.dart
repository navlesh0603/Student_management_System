import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPress;
  final String title;
  final IconData iconData;

  const CustomButton({super.key, required this.onPress, required this.title, required this.iconData});

  @override
  Widget build(BuildContext context) { 
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(
          right: 10,
          left: 10,
        ),
        padding: EdgeInsets.only(right: 20),
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: Color.fromRGBO(12, 70, 196, 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Text(
              title,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Spacer(),
            Icon(
              iconData,
              size: 30,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
