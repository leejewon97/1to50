import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:one_to_fifty/widgets/buttons/custom_back_button_widget.dart';
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
          const Flexible(
            flex: 1,
            child: Center(
              child: CustomBackButton(),
            ),
          ),
        ],
      ),
    );
  }
}
