import 'package:calculator_app/states/calculator_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/buttonmodel.dart';

Map<String, ButtonModel> btnOperationsGenerator(BuildContext context) {
  var buttons = <String, ButtonModel>{};

  buttons['reset'] = ButtonModel(
    displayText: 'C',
    callback: () => Provider.of<CalculatorChangeNotifier>(
      context,
      listen: false,
    ).reset(),
    backgroundColor: Colors.lightBlueAccent.shade100,
    foregroundColor: Colors.black87,
  );

  buttons['invert'] = ButtonModel(
    displayText: '+/-',
    callback: () {
      Provider.of<CalculatorChangeNotifier>(
        context,
        listen: false,
      ).changeOperation(
        Operation.inverse,
      );

      Provider.of<CalculatorChangeNotifier>(
        context,
        listen: false,
      ).calculate();
    },
    backgroundColor: Colors.lightBlueAccent.shade100,
    foregroundColor: Colors.black87,
  );

  buttons['percent'] = ButtonModel(
    displayText: '%',
    callback: () {
      Provider.of<CalculatorChangeNotifier>(
        context,
        listen: false,
      ).changeOperation(
        Operation.percentage,
      );

      Provider.of<CalculatorChangeNotifier>(
        context,
        listen: false,
      ).calculate();
    },
    backgroundColor: Colors.lightBlueAccent.shade100,
    foregroundColor: Colors.black87,
  );

  buttons['divide'] = ButtonModel(
    displayText: '/',
    callback: () {
      Provider.of<CalculatorChangeNotifier>(
        context,
        listen: false,
      ).changeOperation(
        Operation.divide,
      );
    },
    backgroundColor: Colors.teal,
    foregroundColor: Colors.white,
  );

  buttons['multiply'] = ButtonModel(
    displayText: 'x',
    callback: () {
      Provider.of<CalculatorChangeNotifier>(
        context,
        listen: false,
      ).changeOperation(
        Operation.multiply,
      );
    },
    backgroundColor: Colors.teal,
    foregroundColor: Colors.white,
  );

  buttons['subtract'] = ButtonModel(
    displayText: '-',
    callback: () {
      Provider.of<CalculatorChangeNotifier>(
        context,
        listen: false,
      ).changeOperation(
        Operation.subtract,
      );
    },
    backgroundColor: Colors.teal,
    foregroundColor: Colors.white,
  );

  buttons['add'] = ButtonModel(
    displayText: '+',
    callback: () {
      Provider.of<CalculatorChangeNotifier>(
        context,
        listen: false,
      ).changeOperation(
        Operation.add,
      );
    },
    backgroundColor: Colors.teal,
    foregroundColor: Colors.white,
  );

  buttons['equal'] = ButtonModel(
    displayText: '=',
    callback: () {
      Provider.of<CalculatorChangeNotifier>(
        context,
        listen: false,
      ).calculate();
    },
    backgroundColor: Colors.tealAccent,
    foregroundColor: Colors.black,
  );

  buttons['decimal'] = ButtonModel(
    displayText: ',',
    callback: () {
      Provider.of<CalculatorChangeNotifier>(
        context,
        listen: false,
      ).input('.');
    },
    backgroundColor: Colors.blue.shade500,
    foregroundColor: Colors.white,
  );

  return buttons;
}
