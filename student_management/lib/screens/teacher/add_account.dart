import 'package:flutter/material.dart';

class AddAccount extends StatefulWidget {
  static String routeName = "AddAccount";
  const AddAccount({super.key});
  @override
  State createState() => _AddAccountState();
}

class _AddAccountState extends State<AddAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment
              .start, // Aligns the labels and TextFields to the start
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.35,
              child: Stack(
                children: [
                  Image.asset('assets/top_green.png'),
                  Positioned(
                    top: 120,
                    left: MediaQuery.of(context).size.width / 2 - 65,
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
                          'assets/icons/add_photo.png',
                          // height: 60,
                          // width: 60,
                          // fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // const SizedBox(height: 10),
            const Center(
              child: Text('Add Photo', style: TextStyle(color: Colors.teal)),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  _buildLabeledTextField('Full Name'),
                  const SizedBox(height: 10),
                  _buildLabeledTextField('Email'),
                  const SizedBox(height: 10),
                  _buildLabeledTextField('Class'),
                  const SizedBox(height: 10),
                  _buildLabeledTextField('Section'),
                  const SizedBox(height: 10),
                  _buildLabeledTextField('Roll No.'),
                  const SizedBox(height: 10),
                  _buildLabeledTextField('Mobile No.'),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  // Handle submit logic here
                },
                child: Container(
                  height: 40,
                  width: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(12, 70, 196, 1),
                  ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 20, // Adjusted for better readability
                      fontWeight: FontWeight.w500,
                      color: Colors.white, // Changed to ensure legibility
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildLabeledTextField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5), // Space between the label and the TextField
        const TextField(
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
          decoration: const InputDecoration(
            hintText: "Enter here...",
            hintStyle: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
