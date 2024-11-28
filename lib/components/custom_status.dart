import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_icons/components/custom_text.dart';

enum MessageType { success, error, info, warning }

class Status extends StatelessWidget {
  final String message;
  final MessageType? type;

  const Status(
      {super.key, required this.message, this.type = MessageType.info});

  @override
  Widget build(BuildContext context) {
    Color bgColor = Colors.white;
    Color color = Colors.blue;
    IconData icon = Icons.info_outline_rounded;

    if (type == MessageType.success) {
      icon = Icons.check_circle_outline;
      color = Colors.green;
    } else if (type == MessageType.warning) {
      icon = Icons.warning_amber_outlined;
      color = Colors.deepOrange;
    } else if (type == MessageType.info) {
      icon = Icons.error_outline;
      color = Colors.red;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: bgColor,
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                icon,
                size: 32,
                color: color,
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                  text: '${type?.name}: $message',
                  type: CustomTextType.heading,
                  color: color),
            )),
          ]),
        )
      ],
    );
  }
}
