import 'package:calculator_app/models/buttonmodel.dart';
import 'package:calculator_app/views/calculator_button.dart';
import 'package:flutter/material.dart';

class CalculatorButtons extends StatelessWidget {
  final List<ButtonModel> buttons;
  const CalculatorButtons({Key? key, required this.buttons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CalculatorButton(
              model: buttons[0],
            ),
            CalculatorButton(
              model: buttons[1],
            ),
            CalculatorButton(
              model: buttons[2],
            ),
            CalculatorButton(
              model: buttons[3],
            ),
          ],
        ),
      ),
    );
  }
}
