import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
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
  late Future<SharedPreferences> prefs;

  @override
  initState() {
    super.initState();
    prefs = SharedPreferences.getInstance();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: prefs,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreen(
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
      theme: NeumorphicThemeData(
        baseColor: Colors.grey[300]!,
      ),
      darkTheme: NeumorphicThemeData(
        baseColor: Colors.grey[300]!,
      ),
    );
  }
}
