import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';


class BarcodeGenerator extends StatefulWidget {
  const BarcodeGenerator({super.key});

  @override
  _BarcodeGeneratorState createState() => _BarcodeGeneratorState();
}

class _BarcodeGeneratorState extends State<BarcodeGenerator> {
  final _formKey = GlobalKey<FormState>();
  String _barcodeValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.home),
        ),
        title: const Text('Barcode Generator'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Barcode Value',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a barcode value';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    _barcodeValue = value!;
                  });
                },
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  }
                },
                child: const Text('Generate Barcode'),
              ),
              const SizedBox(height: 20.0),
              if (_barcodeValue.isNotEmpty)
                BarcodeWidget(
                  barcode: Barcode.code128(),
                  data: _barcodeValue,
                  width: 200.0,
                  height: 80.0,
                  style: const TextStyle(fontSize: 20.0),
                ),
            ],
          ),
        ),
      ),
    );
  }
}