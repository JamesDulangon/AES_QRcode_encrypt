import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:testqryt/AES.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AES QR Code Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'AES QR Code Generator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController txtController = new TextEditingController();
  String qrData = ' ';
  AES encrypt = new AES();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              QrImage(
                data: encrypt.encryptData(qrData).base64,
                size: 200.0,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                    controller: txtController,
                    decoration: InputDecoration(
                      labelText: 'Enter data',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 15.0),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: ElevatedButton(
                  child: Text('Generate QR'),
                  onPressed: () => setState(() {
                    qrData = txtController.text.trim();
                  }),
                ),
              )
            ],
          ),
        ));
  }
}
