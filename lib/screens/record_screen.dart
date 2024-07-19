import 'package:flutter/material.dart';
import 'package:one_to_fifty/widgets/buttons/custom_back_button_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecordScreen extends StatelessWidget {
  final SharedPreferences prefs;
  final ButtonStyle buttonStyle;

  const RecordScreen({
    super.key,
    required this.prefs,
    required this.buttonStyle,
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
            flex: 2,
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
          Flexible(
            flex: 1,
            child: Center(
              child: CustomBackButton(
                buttonStyle: buttonStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
