import 'package:attendance/register.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'scannnn.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter UI',
    theme: ThemeData(primarySwatch: Colors.cyan),
    home: ScannerQr(),
  ));
}
