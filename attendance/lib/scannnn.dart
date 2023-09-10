import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerQr extends StatefulWidget {
  const ScannerQr({Key? key}) : super(key: key);

  @override
  _ScannerQrState createState() => _ScannerQrState();
}

class _ScannerQrState extends State<ScannerQr> {
  bool _screenOpened = false;

  void openDialog(String studentName, String studentID, String email) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 300,
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text('Name: $studentName',
                    style:
                        GoogleFonts.poppins(color: Colors.red, fontSize: 24)),
                const SizedBox(height: 20),
                Text('ID Number: $studentID',
                    style:
                        GoogleFonts.poppins(color: Colors.red, fontSize: 24)),
                const SizedBox(height: 20),
                Text('Email Address: $email',
                    style:
                        GoogleFonts.poppins(color: Colors.red, fontSize: 24)),
                const SizedBox(height: 1),
                ElevatedButton(
                  onPressed: () {
                    // Add your navigation logic here
                  },
                  child: const Text('Check Attendance'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              // Add your delete logic here
            },
            icon: const Icon(Icons.delete),
          ),
        ],
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white54,
        title: Text('SCANNER', style: GoogleFonts.poppins(color: Colors.black)),
      ),
      body: Column(
        children: [
          const SizedBox(height: 220),
          Container(
            height: 300,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 5)),
            child: MobileScanner(
              controller: MobileScannerController(
                detectionSpeed: DetectionSpeed.normal,
                facing: CameraFacing.back,
                torchEnabled: false,
              ),
              onDetect: (capture) {
                String? finalData;

                final List<Barcode> barcodes = capture.barcodes;

                for (final barcode in barcodes) {
                  setState(() {
                    String data = barcode.rawValue!;
                    finalData = data;
                  });
                }
                if (!_screenOpened) {
                  // Simulate some data for demonstration purposes
                  final studentName = "John Doe";
                  final studentID = "12345";
                  final email = "johndoe@example.com";
                  openDialog(studentName, studentID, email);
                  _screenOpened = true;
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
