// import 'package:flutter/material.dart';

// class Scanner extends StatefulWidget {
//   const Scanner({super.key});

//   @override
//   State<Scanner> createState() => _ScannerState();
// }

// ignore_for_file: prefer_const_constructors

// class _ScannerState extends State<Scanner> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//       title: const Text("Attendance Scanner"),
//     ),
//     body:SafeArea(child: SingleChildScrollView(
//       child: Future,
//     ))
//     );
//   }
// }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({Key? key}) : super(key: key);

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  //----------------------API calls------------------\\
  Future<Map<String, dynamic>> getData() async {
    final response = await http.get(
        Uri.parse('http://127.0.0.1:8000/api/assembly/1'),
        headers: {'Authorization': 'Bearer $_getToken'});
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data['assembly'];
    } else {
      throw Exception('Error');
    }
  }

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    return '?token=$token';
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan QR Code"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: getData(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasError) {
                return const Text('404 error');
              } else if (snapshot.hasData) {
                final data = snapshot.data!;
                return Column(
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      child: Center(
                        child: ListTile(
                          title: Text(
                            "Assembly Details",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    ListTile(
                      title: Text('Assembly: ${data['assembly_type']}'),
                    ),
                    const SizedBox(height: 1),
                    ListTile(
                      title: Text('Date: ${data['date']}'),
                    ),
                    const SizedBox(height: 1),
                    ListTile(
                      title: Text('Venue: ${data['venue']}'),
                    ),
                    const SizedBox(height: 1),
                    ListTile(
                      title: Text('About: ${data['about']}'),
                    ),
                    const SizedBox(height: 1),
                    Container(
                      width: 200, // Adjust this value to your desired width
                      child: ElevatedButton(
                        onPressed: () {
                          // Add your scan QR code functionality here
                          // This is where you'll handle the scanning action.
                        },
                        child: Text("SCAN"),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                );
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
// class ProfilePage extends StatefulWidget {
//   const ProfilePage({Key? key}) : super(key: key);

//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {

//    Future<void> getToDo() async {
//     final url = 'http://127.0.0.1:8000/api/assembly/$id';
//     final uri = Uri.parse(url);
//     final response = await http.get(uri);
//     final json = jsonDecode(response.body) as Map;
//     final result = json['assembly'];

//     setState(() {
//       assembly = result;
//     });
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile Page'),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               const SizedBox(height: 20),
//               Container(
//                 width: 200,
//                 height: 200,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   border: Border.all(width: 1, color: Colors.black),
//                   image: DecorationImage(
//                     image: NetworkImage(
//                         'http://192.168.98.11:8000/storage/user_profile/ZRchGen0YysE9ZPxTS0JSB7QU2vT5qWDyuJKL4dq.jpg'),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 30),
//               if (assemblyData != null) ...[
//                 Text('Name: ${assemblyData!['assembly_type']}'),
//                 const SizedBox(height: 5),
//                 Text('Date: ${assemblyData!['date']}'),
//                 const SizedBox(height: 30),
//                 Text('Venue: ${assemblyData!['venue']}'),
//                 const SizedBox(height: 30),
//                 Text('About: ${assemblyData!['about']}'),
//                 const SizedBox(height: 30),
//               ]
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
