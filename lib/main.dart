import 'package:flutter/material.dart';
import 'package:one_to_fifty/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final buttonStyle = ButtonStyle(
    shape: MaterialStateProperty.all<OutlinedBorder?>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: const BorderSide(color: Colors.black, width: 2.0),
      ),
    ),
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(
        buttonStyle: buttonStyle,
      ),
    );
  }
}
