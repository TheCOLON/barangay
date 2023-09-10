import 'package:barcode_flutter/generate_barcode.dart';
import 'package:barcode_flutter/scan_barcode.dart';
import 'package:barcode_flutter/widget/main_drawer.dart';
import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openEndDrawer() {
    _scaffoldKey.currentState!.openEndDrawer();
  }

  void _closeEndDrawer() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.person),

        ),
        title: const Text('Inventory System',
            style: TextStyle(
                fontFamily: 'Oranienbaum',
                fontWeight: FontWeight.bold,
                fontSize: 24)),
      ),
      endDrawer: const MainDrawer(),
      body:ListView(
              children: [
                const SizedBox(height:130 ),
                Container(
                  padding: const EdgeInsets.all(50),
                  margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25),
                  decoration: const BoxDecoration(
                      color: Colors.green,
                      ),
                  child: ListTile(
                    title: const Center(child: Text("Barcode Scanner",
                        style: TextStyle(
                            fontSize: 22,
                            fontFamily: "Oranienbaum",
                            fontWeight: FontWeight.bold,
                            color: Colors.black54)),
                    ),
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BarcodeScanner())
                      );

                    },
                  ),
                ),
                const SizedBox(height:30 ),
                Container(
                  padding: const EdgeInsets.all(50),
                  margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25),
                  decoration: const BoxDecoration(
                      color: Colors.green),
                  child: ListTile(
                    title: const Center(child: Text("Barcode Generator",
                        style: TextStyle(
                            fontSize: 22,
                            fontFamily: "Oranienbaum",
                            fontWeight: FontWeight.bold,
                            color: Colors.black54))),
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BarcodeGenerator())
                      );

                    },
                  ),

                )
              ]
          )


    );
  }
}
