import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
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
      [...widget.recordTimes, widget.playTime].sorted((a, b) => a.compareTo(b)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        isBestTime ? '최고 기록 경신 !' : '게임 종료',
        style: const TextStyle(
          fontSize: 32,
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
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      contentPadding: const EdgeInsets.only(top: 20, bottom: 10),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.home_rounded,
            size: 40,
          ),
        ),
      ],
    );
  }
}
