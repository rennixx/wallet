import 'package:flutter/material.dart';

class ThemedText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;

  const ThemedText({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: Theme.of(context).textTheme.bodyMedium?.merge(style),
    );
  }
}
