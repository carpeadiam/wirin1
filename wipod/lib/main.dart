import 'package:flutter/material.dart';
import 'package:wipod/pages/base.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
          scaffoldBackgroundColor: Colors.white,
      ),

      debugShowCheckedModeBanner: false,
      home: const BasePage(),
    );
  }
}
