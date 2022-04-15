import 'package:calculator_app/generators/btn_digits_generator.dart';
import 'package:calculator_app/generators/btn_operations_generator.dart';
import 'package:calculator_app/views/calculator_button.dart';
import 'package:flutter/material.dart';

import 'calculator_buttons_row.dart';
import 'calulator_display.dart';

class CalculatorBody extends StatelessWidget {
  const CalculatorBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final digitsBtns = btnDigitsGenerator(context);
    final operationsBtns = btnOperationsGenerator(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Expanded(
          flex: 2,
          child: CalculatorDisplay(),
        ),
        CalculatorButtons(
          buttons: [
            operationsBtns['reset']!,
            operationsBtns['invert']!,
            operationsBtns['percent']!,
            operationsBtns['divide']!,
          ],
        ),
        CalculatorButtons(
          buttons: [
            digitsBtns[7],
            digitsBtns[8],
            digitsBtns[9],
            operationsBtns['multiply']!,
          ],
        ),
        CalculatorButtons(
          buttons: [
            digitsBtns[4],
            digitsBtns[5],
            digitsBtns[6],
            operationsBtns['subtract']!,
          ],
        ),
        CalculatorButtons(
          buttons: [
            digitsBtns[1],
            digitsBtns[2],
            digitsBtns[3],
            operationsBtns['add']!,
          ],
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              CalculatorButton(
                model: digitsBtns[0],
              ),
              CalculatorButton(
                model: operationsBtns['decimal']!,
              ),
              CalculatorButton(
                model: operationsBtns['equal']!,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
