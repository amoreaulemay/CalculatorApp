import 'package:calculator_app/models/buttonmodel.dart';
import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final ButtonModel model;

  const CalculatorButton({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: model.flex,
      child: InkWell(
        onTap: model.callback,
        child: Container(
          margin: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(
            color: model.backgroundColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(999),
            ),
          ),
          child: Center(
            child: Text(
              model.displayText,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: model.foregroundColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
