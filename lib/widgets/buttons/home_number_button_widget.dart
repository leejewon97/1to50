import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:one_to_fifty/neumorphic_button_style.dart';
import 'package:one_to_fifty/services/play_service.dart';
import 'package:soundpool/soundpool.dart';

class HomeNumberButton extends StatefulWidget {
  final String number;

  const HomeNumberButton({
    super.key,
    required this.number,
  });

  @override
  State<HomeNumberButton> createState() => _HomeNumberButtonState();
}

class _HomeNumberButtonState extends State<HomeNumberButton> {
  Soundpool soundpool = Soundpool.fromOptions();
  late Future<Map<String, int>> soundIds;

  @override
  void initState() {
    super.initState();
    soundIds = PlayService().getSoundIds(soundpool);
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 90,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            width: constraints.maxHeight,
            child: NeumorphicButton(
              onPressed: () {
                soundIds.then((ids) {
                  soundpool.play(ids['tap']!);
                });
              },
              style: NeumorphicButtonStyle(),
              padding: EdgeInsets.zero,
              child: Center(
                child: Text(
                  widget.number,
                  style: TextStyle(
                    fontSize: constraints.maxHeight / 2,
                    color: Colors.indigo,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
