import 'package:flutter/material.dart';

import '../models/stack.dart';

enum Operation {
  reset,
  divide,
  multiply,
  subtract,
  add,
  inverse,
  percentage,
}

const int maxDigits = 10;

class CalculatorChangeNotifier extends ChangeNotifier {
  final _inputs = StackDS<String>();
  bool _newInput = true;
  Operation _operation = Operation.reset;
  bool _error = false;
  bool _nan = false;
  double _previousRhs = 0.0;

  String get displayValue {
    if (_error) {
      return 'Error';
    } else if (_nan) {
      return 'NaN';
    }

    String displayText = _inputs.peek()?.replaceAll('.', ',') ?? '0';

    displayText = (displayText.length <= maxDigits)
        ? displayText
        : '${displayText.substring(0, maxDigits)}...';

    return displayText;
  }

  void input(String input) {
    if (!_newInput) {
      String? lastEntry = _inputs.pop();

      if (lastEntry != null) {
        if (lastEntry.length >= maxDigits) {
          // We want to return here, otherwise the digits would overflow
          _inputs.push(lastEntry);
          return;
        }

        if (lastEntry == '0') {
          (input == '0') ? null : lastEntry = input;
        } else {
          lastEntry += input;
        }
      } else {
        lastEntry = input;
      }

      _inputs.push(lastEntry);
    } else {
      _inputs.push(input);
      _newInput = false;
    }

    notifyListeners();
  }

  void changeOperation(Operation newOperation) {
    _operation = newOperation;
    if (_operation != Operation.percentage || _operation != Operation.inverse) {
      _newInput = true;
    }
  }

  void reset() {
    _inputs.clear();
    _newInput = true;
    _operation = Operation.reset;
    _error = false;
    _nan = false;
    _previousRhs = 0.0;

    notifyListeners();
  }

  void calculate() {
    if (_inputs.isEmpty || _operation == Operation.reset) {
      return;
    }

    // Single operand operations
    if (_operation == Operation.inverse) {
      String lastEntry = _inputs.pop()!;
      if (lastEntry.startsWith('-')) {
        lastEntry = lastEntry.substring(1);
      } else {
        lastEntry = '-' + lastEntry;
      }

      _inputs.push(lastEntry);
      notifyListeners();
      return;
    }

    if (_operation == Operation.percentage) {
      String lastEntry = _inputs.pop()!;

      // Removing potential trailing dots
      if (lastEntry.endsWith('.')) {
        lastEntry = lastEntry.substring(0, lastEntry.length - 2);
      }

      double lhs = double.tryParse(lastEntry)!;
      lhs /= 100;

      _inputs.push(lhs.toString());
      notifyListeners();
      return;
    }

    // Two operands operations
    // Beyond this point expecting _inputs.size >= 2
    if (_inputs.size < 2) {
      _inputs.push(_previousRhs.toString());
    }

    double lhs = 0.0; // Left hand side
    double rhs = 0.0; // Right hand side
    double rst = 0.0; // Result
    try {
      rhs = double.parse(_inputs.pop()!);
      lhs = double.parse(_inputs.pop()!);
    } on FormatException {
      _error = true;
      notifyListeners();
      return;
    }

    switch (_operation) {
      case Operation.divide:
        if (rhs == 0) {
          _nan = true;
          notifyListeners();
          return;
        }
        rst = lhs / rhs;
        break;
      case Operation.multiply:
        rst = lhs * rhs;
        break;
      case Operation.subtract:
        rst = lhs - rhs;
        break;
      case Operation.add:
        rst = lhs + rhs;
        break;
      default:
        return;
    }

    _previousRhs = rhs;
    _inputs.push(rst.toString());
    notifyListeners();
  }
}
