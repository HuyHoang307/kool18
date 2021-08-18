import 'package:flutter/material.dart';
import 'package:kool18_new/screens/driver_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kool18',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.grey[200]
      ),
      home: DriverScreen(),
    );
  }
}