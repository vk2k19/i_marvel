import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:marvel_icons/components/custom_text.dart';

enum LoaderType { circle, dots }

class Loader extends StatelessWidget {
  final String? text;
  final LoaderType? type;
  final double? size;
  final Color? color;
  const Loader(
      {super.key,
      this.text,
      this.type = LoaderType.circle,
      this.size = 30,
      this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    List<Widget> content = [];

    final textType = size! > 29 ? CustomTextType.heading : CustomTextType.body;

    if (text != null) {
      content.add(CustomText(text: text!, type: textType, color: color));
    }

    if (type == LoaderType.circle) {
      content.add(SpinKitCircle(
        color: color,
        size: size!,
      ));
    } else {
      content.add(SpinKitThreeInOut(
        color: color,
        size: size!,
      ));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: content,
    );
  }
}
