import 'package:flutter/material.dart';
import 'package:one_to_fifty/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final buttonStyle = ButtonStyle(
    shape: MaterialStateProperty.all<OutlinedBorder?>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: const BorderSide(color: Colors.black, width: 2.0),
      ),
    ),
  );

  late Future<SharedPreferences> prefs;

  @override
  initState() {
    super.initState();
    prefs = SharedPreferences.getInstance();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: prefs,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreen(
              buttonStyle: buttonStyle,
              prefs: snapshot.data!,
            );
          } else {
            return Scaffold(
              backgroundColor: Colors.amber[100],
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
