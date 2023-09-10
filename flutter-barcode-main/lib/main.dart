import 'package:barcode_flutter/widget/main_drawer.dart';
import 'package:barcode_flutter/scan_barcode.dart';
import 'package:barcode_flutter/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inventory Management System',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.green[900],
            secondary: Colors.black,
      )),
      home: const MyStatefulWidget(),
    );
  }
}

