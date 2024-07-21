import 'package:collection/collection.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:one_to_fifty/widgets/buttons/home_button_widget.dart';
import 'package:one_to_fifty/widgets/buttons/restart_button_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EndDialog extends StatefulWidget {
  final String playTime;
  final List<String> recordTimes;
  final SharedPreferences prefs;

  const EndDialog({
    super.key,
    required this.playTime,
    required this.recordTimes,
    required this.prefs,
  });

  @override
  State<EndDialog> createState() => _EndDialogState();
}

class _EndDialogState extends State<EndDialog> {
  bool isBestTime = false;
  String newBestTime = "";
  String oldBestTime = "";
  String playerName = "";

  @override
  void initState() {
    super.initState();
    oldBestTime = widget.recordTimes.firstOrNull ?? widget.playTime;
    newBestTime = oldBestTime;
    if (widget.playTime.compareTo(oldBestTime) <= 0) {
      isBestTime = true;
      newBestTime = widget.playTime;
    }
    updateRecordTimes();
  }

  Future<void> updateRecordTimes() async {
    await widget.prefs.setStringList(
        'recordTimes',
        [
          ...widget.recordTimes,
          playerName.isEmpty
              ? widget.playTime
              : "$playerName\t${widget.playTime}"
        ].sorted(
          (a, b) {
            var timeA = a.contains("\t") ? a.split("\t")[1] : a;
            var timeB = b.contains("\t") ? b.split("\t")[1] : b;
            return timeA.compareTo(timeB);
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: AlertDialog(
          title: Text(
            isBestTime ? '최고 기록 경신 !' : '게임 종료',
            style: TextStyle(
              fontSize: 32,
              color: isBestTime ? Colors.indigoAccent : null,
            ),
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '최고 기록 : $newBestTime',
                style: const TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                widget.playTime,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: isBestTime ? Colors.indigoAccent : null,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: '이름을 입력하세요',
                  ),
                  onChanged: (value) async {
                    setState(() {
                      playerName = value;
                    });
                    await updateRecordTimes();
                  },
                ),
              ),
            ],
          ),
          contentPadding: const EdgeInsets.only(top: 20, bottom: 10),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            RestartButton(
              prefs: widget.prefs,
            ),
            const HomeButton(),
          ],
        ),
      ),
    );
  }
}
