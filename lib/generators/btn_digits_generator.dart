import 'package:calculator_app/states/calculator_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/buttonmodel.dart';

List<ButtonModel> btnDigitsGenerator(BuildContext context) {
  return List.generate(10, (index) {
    return ButtonModel(
      flex: (index == 0) ? 2 : 1,
      displayText: index.toString(),
      callback: () => Provider.of<CalculatorChangeNotifier>(
        context,
        listen: false,
      ).input(
        index.toString(),
      ),
      backgroundColor: Colors.blue.shade500,
      foregroundColor: Colors.white,
    );
  });
}
