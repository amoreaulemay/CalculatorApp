import 'package:calculator_app/states/calculator_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorDisplay extends StatelessWidget {
  final String digit = '0';

  const CalculatorDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<CalculatorChangeNotifier, String>(
      builder: (context, value, child) {
        return Container(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
      selector: (context, calculatorChangeNotifier) =>
          calculatorChangeNotifier.displayValue,
    );
  }
}
