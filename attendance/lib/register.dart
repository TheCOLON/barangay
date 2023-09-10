// import 'package:attendance/model/api_response.dart';
// import 'package:attendance/scanner.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert' as convert;

// class RegistrationForm extends StatefulWidget {
//   @override
//   _RegistrationFormState createState() => _RegistrationFormState();
// }

// class _RegistrationFormState extends State<RegistrationForm> {
//   String selectedAssemblyType = "First Quarter";
//   DateTime selectedDate = DateTime.now();
//   TextEditingController venueController = TextEditingController();
//   TextEditingController aboutController = TextEditingController();

//   void _addAssembly() async {
//     String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);

//     // Create a data map
//     var data = {
//       'assembly_type': selectedAssemblyType,
//       'date': formattedDate,
//       'venue': venueController.text,
//       'about': aboutController.text,
//     };

//     var result = await CallApi().addData(data, 'assembly');
//     var body = convert.jsonDecode(result.body);

//     if (body != null &&
//         body.containsKey('success') &&
//         body['success'] is bool &&
//         body['success']) {
//       // Handle success case
//       SharedPreferences localStorage = await SharedPreferences.getInstance();
//       localStorage.setString('assembly', convert.jsonEncode(body['assembly']));
//       Navigator.push(
//           context, MaterialPageRoute(builder: (context) => Scanner()));
//     } else {
//       // Handle error or non-success case
//       // You can add error handling logic or show a message to the user here
//     }
//   }

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: selectedDate,
//       firstDate: DateTime(2023),
//       lastDate: DateTime(2030),
//     );
//     if (picked != null && picked != selectedDate)
//       setState(() {
//         selectedDate = picked;
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Registration Form'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             DropdownButton<String>(
//               value: selectedAssemblyType,
//               onChanged: (newValue) {
//                 setState(() {
//                   selectedAssemblyType = newValue!;
//                 });
//               },
//               items: const <DropdownMenuItem<String>>[
//                 DropdownMenuItem<String>(
//                   value: 'First Quarter',
//                   child: Text('First Quarter'),
//                 ),
//                 DropdownMenuItem<String>(
//                   value: 'Second Quarter',
//                   child: Text('Second Quarter'),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16.0),
//             Text(
//               'Date: ${selectedDate.toLocal()}',
//               style: const TextStyle(fontSize: 16),
//             ),
//             ElevatedButton(
//               onPressed: () => _selectDate(context),
//               child: const Text('Select Date'),
//             ),
//             const SizedBox(height: 16.0),
//             TextFormField(
//               controller: venueController,
//               decoration: InputDecoration(
//                 labelText: 'Venue',
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.blue),
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16.0),
//             SizedBox(height: 16),
//             TextFormField(
//               controller: aboutController,
//               decoration: InputDecoration(
//                 labelText: 'About',
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.blue),
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 // Handle form submission here
//                 _addAssembly();
//               },
//               child: const Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:attendance/model/api_response.dart';
// import 'package:attendance/scanner.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert' as convert;

// class RegistrationForm extends StatefulWidget {
//   @override
//   _RegistrationFormState createState() => _RegistrationFormState();
// }

// class _RegistrationFormState extends State<RegistrationForm> {
//   String selectedAssemblyType = "First Quarter";
//   String selectedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
//   TextEditingController venueController = TextEditingController();
//   TextEditingController aboutController = TextEditingController();

//   void _addAssembly() async {
//     // Create a data map
//     var data = {
//       'assembly_type': selectedAssemblyType,
//       'date': selectedDate,
//       'venue': venueController.text,
//       'about': aboutController.text,
//     };

//     var result = await CallApi().addData(data, 'assembly');
//     var body = convert.jsonDecode(result.body);

//     if (body != null &&
//         body.containsKey('success') &&
//         body['success'] is bool &&
//         body['success']) {
//       // Handle success case
//       SharedPreferences localStorage = await SharedPreferences.getInstance();
//       localStorage.setString('assembly', convert.jsonEncode(body['assembly']));
//       Navigator.push(
//           context, MaterialPageRoute(builder: (context) => Scanner()));
//     } else {
//       // Handle error or non-success case
//       // You can add error handling logic or show a message to the user here
//     }
//   }

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2023),
//       lastDate: DateTime(2030),
//     );
//     if (picked != null)
//       setState(() {
//         selectedDate = DateFormat('yyyy-MM-dd').format(picked);
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Registration Form'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             // DropdownButton<String>(
//             //   value: selectedAssemblyType,
//             //   onChanged: (newValue) {
//             //     setState(() {
//             //       selectedAssemblyType = newValue!;
//             //     });
//             //   },
//             //   items: const <DropdownMenuItem<String>>[
//             //     DropdownMenuItem<String>(
//             //       value: 'First Quarter  Assembly',
//             //       child: Text('First Quarter Assembly'),
//             //     ),
//             //     DropdownMenuItem<String>(
//             //       value: 'Second Quarter  Assembly',
//             //       child: Text('Second QuarterAssembly'),
//             //     ),
//             //     DropdownMenuItem<String>(
//             //       value: 'Second Quarter  Assembly',
//             //       child: Text('Third Quarter Assemby'),
//             //     ),
//             //   ],
//             // ),

//             TextFormField(
//               decoration: InputDecoration(
//                 labelText: 'Assembly Type',
//               ),
//               onChanged: (value) {
//                 setState(() {
//                   selectedAssemblyType = value;
//                 });
//               },
//             ),
//             DropdownButton<String>(
//               value: selectedAssemblyType,
//               onChanged: (newValue) {
//                 setState(() {
//                   selectedAssemblyType = newValue!;
//                 });
//               },
//               items: const <DropdownMenuItem<String>>[
//                 DropdownMenuItem<String>(
//                   value: 'First Quarter Assembly',
//                   child: Text('First Quarter Assembly'),
//                 ),
//                 DropdownMenuItem<String>(
//                   value: 'Second Quarter Assembly',
//                   child: Text('Second Quarter Assembly'),
//                 ),
//                 DropdownMenuItem<String>(
//                   value: 'Third Quarter Assembly',
//                   child: Text('Third Quarter Assembly'),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 16.0),
//             Text(
//               'Date: $selectedDate',
//               style: const TextStyle(fontSize: 16),
//             ),
//             ElevatedButton(
//               onPressed: () => _selectDate(context),
//               child: const Text('Select Date'),
//             ),
//             const SizedBox(height: 16.0),
//             TextFormField(
//               controller: venueController,
//               decoration: InputDecoration(
//                 labelText: 'Venue',
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.blue),
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16.0),
//             SizedBox(height: 16),
//             TextFormField(
//               controller: aboutController,
//               decoration: InputDecoration(
//                 labelText: 'About',
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.blue),
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 // Handle form submission here
//                 _addAssembly();
//               },
//               child: const Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:attendance/model/api_response.dart';
import 'package:attendance/scanner.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String selectedAssemblyType = "First Quarter Assembly";
  String selectedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  TextEditingController venueController = TextEditingController();
  TextEditingController aboutController = TextEditingController();

  void _addAssembly() async {
    if (_formKey.currentState!.validate()) {
      var data = {
        'assembly_type': selectedAssemblyType,
        'date': selectedDate,
        'venue': venueController.text,
        'about': aboutController.text,
      };

      var result = await CallApi().addData(data, 'assembly');
      var body = convert.jsonDecode(result.body);

      if (body != null &&
          body.containsKey('success') &&
          body['success'] is bool &&
          body['success']) {
        // Handle success case
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString(
            'assembly', convert.jsonEncode(body['assembly']));
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => Scanner()));
      } else {
        // Handle error or non-success case
        // You can add error handling logic or show a message to the user here
      }
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2030),
    );
    if (picked != null)
      setState(() {
        selectedDate = DateFormat('yyyy-MM-dd').format(picked);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            // Add your logo here
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                'https://o.remove.bg/downloads/e56f6e60-387e-4249-875b-f31543998eff/png-transparent-security-hacker-the-dots-android-hacker-emblem-hacker-miscellaneous-game-computer-thumbnail-removebg-preview.png', // Replace with your logo's network URL
                height: 40,
              ),
            ),
            const Text('Barangay Imbatug'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DropdownButtonFormField<String>(
              value: selectedAssemblyType,
              onChanged: (newValue) {
                setState(() {
                  selectedAssemblyType = newValue!;
                });
              },
              items: const <DropdownMenuItem<String>>[
                DropdownMenuItem<String>(
                  value: 'First Quarter Assembly',
                  child: Text('First Quarter Assembly'),
                ),
                DropdownMenuItem<String>(
                  value: 'Second Quarter Assembly',
                  child: Text('Second Quarter Assembly'),
                ),
                DropdownMenuItem<String>(
                  value: 'Third Quarter Assembly',
                  child: Text('Third Quarter Assembly'),
                ),
              ],
              decoration: InputDecoration(
                labelText: 'Assembly Type',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            //
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Text(
                      'Date: $selectedDate',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0), // Add some space here
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: const Text('Select Date'),
                ),
              ],
            ),

            const SizedBox(height: 16.0),
            TextFormField(
              controller: venueController,
              decoration: InputDecoration(
                labelText: 'Venue',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter some text';
                }
                // You can add more validation rules here.
                return null; // Return null if the input is valid.
              },
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: aboutController,
              decoration: InputDecoration(
                labelText: 'About',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter some text';
                }
                // You can add more validation rules here.
                return null; // Return null if the input is valid.
              },
            ),

            const SizedBox(height: 16.0),
            Center(
              child: Container(
                width: 200.0, // Adjust the width as needed
                child: ElevatedButton(
                  onPressed: () {
                    // Handle form submission here
                    _addAssembly();
                  },
                  child: const Text('Submit'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
