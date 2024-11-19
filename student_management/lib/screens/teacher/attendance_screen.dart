import 'package:flutter/material.dart';

class Attendencescreen extends StatefulWidget {
  const Attendencescreen({super.key});
  static String routeName='AttendanceScreen';
  @override
  State createState() => _AttendencescreenState();
}


  final List<String> studentNames = List.generate(10, (index) => 'Prajesh Shailya');
  List<bool> presentList = List.generate(10, (index) => false);
  List<bool> absentList = List.generate(10, (index) => false);

  void _togglePresent(int index, bool? value) {
    setState(() {
      presentList[index] = value ?? false;
      if (value == true) {
        absentList[index] = false; // Ensure "Absent" is unchecked if "Present" is checked
      }
    });
  }
  
  void setState(Null Function() param0) {
  }

  void _toggleAbsent(int index, bool? value) {
    setState(() {
      absentList[index] = value ?? false;
      if (value == true) {
        presentList[index] = false;
      }
    });
  }

class _AttendencescreenState extends State<Attendencescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('ATTENDANCE',
         style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color:Colors.white,
         ),),
        backgroundColor:Color.fromRGBO(12,70,196,1),
        leading:Image.asset('assets/icons/Attendance.png'),
      ),
       body: Column(
        children: [
          Container(
            color:Color.fromRGBO(12,70,196,1),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child:const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Class: 3 A',
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Date: 12/12/21',
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            decoration:const  BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey),
              ),
            ),
            child:const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Student Name',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                ),
                Text(
                  'Present',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(12,70,196,1),),
                ),
                SizedBox(width: 25), // Add spacing between "Present" and "Absent"
                Text(
                  'Absent',
                  style: TextStyle(fontWeight: FontWeight.bold, color:Color.fromRGBO(12,70,196,1),),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: studentNames.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(studentNames[index]),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: presentList[index],
                            onChanged: (bool? value) {
                              _togglePresent(index, value);
                            },
                          ),
                          SizedBox(width: 40), // Add spacing between checkboxes
                          Checkbox(
                            value: absentList[index],
                            onChanged: (bool? value) {
                              _toggleAbsent(index, value);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}