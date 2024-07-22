import 'package:auto_size_text/auto_size_text.dart';
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

    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Column(
          children: [
            const Flexible(
              flex: 1,
              child: Center(
                child: AutoSizeText(
                  'Record',
                  style: TextStyle(fontSize: 60),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: ListView.builder(
                  itemCount: recordTimes.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Center(
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            final recordStyle = RecordStyle(
                              recordIndex: index,
                              recordSize: constraints.maxWidth / 12,
                            );
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    "${index == 0 ? '1st' : index == 1 ? '2nd' : index == 2 ? '3rd' : '${index + 1}th'}${recordTimes[index].contains('\t') ? '\t${recordTimes[index].split('\t')[0]}' : ''}",
                                    style: recordStyle,
                                  ),
                                ),
                                Text(
                                  recordTimes[index].contains('\t')
                                      ? recordTimes[index].split('\t')[1]
                                      : recordTimes[index],
                                  style: recordStyle,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
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
      ),
    );
  }
}

class RecordStyle extends TextStyle {
  RecordStyle({
    required int recordIndex,
    required double recordSize,
  }) : super(
          fontSize: recordSize,
          color: recordIndex == 0
              ? Colors.indigoAccent
              : recordIndex == 1
                  ? Colors.indigo
                  : recordIndex == 2
                      ? Colors.indigo[900]
                      : Colors.black,
        );
}
