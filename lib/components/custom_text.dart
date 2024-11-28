import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum CustomTextType { heading, body }

class CustomText extends StatelessWidget {
  final String text;
  final CustomTextType type;
  final TextStyle? style;
  final TextAlign textAlign;
  final int? maxLines;
  final Color? color;
  final double? size;

  const CustomText(
      {super.key,
      required this.text,
      this.style,
      this.textAlign = TextAlign.start,
      this.type = CustomTextType.body,
      this.maxLines,
      this.size = 0.075,
      this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;

    TextStyle customStyle = GoogleFonts.nunitoSans(
        color: color,
        fontSize: width * (size! / 2),
        decoration: TextDecoration.none,
        fontWeight: FontWeight.normal);

    if (type == CustomTextType.heading) {
      customStyle = GoogleFonts.blackOpsOne(
          color: color,
          fontSize: width * size!,
          decoration: TextDecoration.none);
    }

    if (style != null) {
      customStyle = style as TextStyle;
    }

    return Text(
      text,
      style: customStyle,
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }
}
