import 'package:flutter/material.dart';
import 'package:fn_641463011/login.dart';
import 'package:fn_641463011/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
    );
  }
}
