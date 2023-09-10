import 'package:attendance/model/api_response.dart';
import 'package:attendance/scanner.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String _selectedDropdownValue = 'First Quarter Assembly';
  TextEditingController _venueController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _aboutController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Code Scanner"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Barangay Imbatug Assembly",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            TextFormField(
              readOnly: true,
              onTap: () {
                // Show dropdown options
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            title: Text('First Quarter Assembly'),
                            onTap: () {
                              setState(() {
                                _selectedDropdownValue =
                                    'First Quarter Assembly';
                              });
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            title: Text('Second Quarter Assembly'),
                            onTap: () {
                              setState(() {
                                _selectedDropdownValue =
                                    'Second Quarter Assembly';
                              });
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            title: Text('Third Quarter  Assembly'),
                            onTap: () {
                              setState(() {
                                _selectedDropdownValue =
                                    'Third Quarter  Assembly';
                              });
                              Navigator.pop(context);
                            },
                          ),
                          // Add more options here
                        ],
                      ),
                    );
                  },
                );
              },
              controller: TextEditingController(text: _selectedDropdownValue),
              decoration: InputDecoration(
                labelText: 'Assembly',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _venueController,
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
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _dateController,
              readOnly: true,
              onTap: () async {
                // Show date picker and set selected date to _dateController
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (selectedDate != null) {
                  setState(() {
                    _dateController.text =
                        DateFormat('yyyy-MM-dd').format(selectedDate);
                  });
                }
              },
              decoration: InputDecoration(
                labelText: 'Date',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _aboutController,
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
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle form submission
                _addAssembly();
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }

  // void _addAssembly() async {
  //   var date;
  //   if (_dateController.text.isNotEmpty) {
  //     date = DateFormat('yyyy-MM-dd').parse(_dateController.text);
  //   }
  //   var data = {
  //     'assembly_type': _selectedDropdownValue,
  //     'date': DateFormat('yyyy-MM-dd').format(date),
  //     'venue': _venueController.text,
  //     'about': _aboutController.text,
  //   };
  //   var result = await CallApi().addData(data, 'assembly');
  //   var body = convert.jsonDecode(result.body);
  //   if (body['success']) {
  //     SharedPreferences localStorage = await SharedPreferences.getInstance();
  //     localStorage.setString('token', body['token']);
  //     localStorage.setString('assembly', convert.jsonEncode(body['assembly']));

  //     // Show snackbar
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Assembly successfully registered!'),
  //       ),
  //     );

  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => Scanner()));
  //   }
  // }
  void _addAssembly() async {
    var date;
    // if (_dateController.text != null) {
    //   if (_dateController.text.isNotEmpty) {
    //     date = DateFormat('yyyy-MM-dd').parse(_dateController.text);
    //   }
    // }
    var data = {
      'assembly_type': _selectedDropdownValue,
      'date': DateFormat('yyyy-MM-dd').format(date),
      'venue': _venueController.text,
      'about': _aboutController.text,
    };
    var result = await CallApi().addData(data, 'assembly');
    var body = convert.jsonDecode(result.body);
    if (body['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      // localStorage.setString('token', body['token']);
      localStorage.setString('assembly', convert.jsonEncode(body['assembly']));

      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => Scanner()));
    }
  }
}
