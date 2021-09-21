import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AdaptiveText extends StatelessWidget {
  const AdaptiveText(
    this.text, {
    Key? key,
    this.style,
    this.maxLines,
    this.textAlign,
  }) : super(key: key);

  final String text;
  final TextStyle? style;
  final int? maxLines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return SelectableText(
        text,
        style: style,
        textAlign: textAlign,
        maxLines: maxLines,

      );
    } else {
      return Text(
        text,
        style: style,
        textAlign: textAlign,
        maxLines: maxLines,
      );
    }
  }
}
