import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class ResponsiveButtonChild extends StatelessWidget {
  final IconData? icon;

  const ResponsiveButtonChild({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 80,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Icon(
            icon,
            size: constraints.maxHeight,
          );
        },
      ),
    );
  }
}
