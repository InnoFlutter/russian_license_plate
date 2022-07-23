import 'package:flutter/material.dart';
import 'package:russian_license_plate/plates.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFFFFFFF)),
      home: Scaffold(
        // appBar: AppBar(
        //   title: const Text('Plugin example app'),
        // ),
        body:
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
          PoliceLicensePlateInput(
            size: 70,
            onSubmitted: (value, error) {
              print("$value $error");
            },
          )
        ),
      ),
    );
  }
}
