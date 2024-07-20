import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:one_to_fifty/widgets/buttons/home_number_button_widget.dart';
import 'package:one_to_fifty/widgets/buttons/play_button_widget.dart';
import 'package:one_to_fifty/widgets/buttons/record_button_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  final SharedPreferences prefs;

  const HomeScreen({
    super.key,
    required this.prefs,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Flexible(
            flex: 1,
            child: SizedBox.expand(),
          ),
          const Flexible(
            flex: 2,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HomeNumberButton(
                    number: '1',
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 32,
                    ),
                    child: AutoSizeText(
                      'to',
                      style: TextStyle(fontSize: 60),
                    ),
                  ),
                  HomeNumberButton(
                    number: '50',
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RecordButton(
                    prefs: prefs,
                  ),
                  PlayButton(
                    prefs: prefs,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
