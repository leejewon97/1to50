import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecordScreen extends StatelessWidget {
  final SharedPreferences prefs;

  const RecordScreen({
    super.key,
    required this.prefs,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> recordTimes = prefs.getStringList('recordTimes') ?? [];

    return Scaffold(
      backgroundColor: Colors.amber[100],
      body: Column(
        children: [
          const Flexible(
            flex: 1,
            child: Center(
              child: Text(
                'Record',
                style: TextStyle(fontSize: 60),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: ListView.builder(
              itemCount: recordTimes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Center(
                    child: Text(
                      '${index == 0 ? '1st' : index == 1 ? '2nd' : index == 2 ? '3rd' : '${index + 1}th'}    ${recordTimes[index]}',
                      style: const TextStyle(fontSize: 30),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
