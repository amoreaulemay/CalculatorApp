import 'dart:ui';

class ButtonModel {
  final String displayText;
  final void Function() callback;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final int flex;

  ButtonModel({
    required this.displayText,
    required this.callback,
    this.flex = 1,
    this.backgroundColor,
    this.foregroundColor,
  });
}
