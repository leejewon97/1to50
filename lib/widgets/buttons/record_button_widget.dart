import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:one_to_fifty/neumorphic_button_style.dart';
import 'package:one_to_fifty/screens/record_screen.dart';
import 'package:one_to_fifty/widgets/responsive_button_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecordButton extends StatelessWidget {
  final SharedPreferences prefs;

  const RecordButton({
    super.key,
    required this.prefs,
  });

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RecordScreen(
                prefs: prefs,
              ),
            ));
      },
      style: NeumorphicButtonStyle(),
      child: const ResponsiveButtonChild(
        icon: Icons.format_list_numbered_rounded,
      ),
    );
  }
}
