import 'package:calculator_app/states/calculator_change_notifier.dart';
import 'package:calculator_app/views/calculator_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Calulator'),
          ),
          body: ChangeNotifierProvider<CalculatorChangeNotifier>(
            create: (context) => CalculatorChangeNotifier(),
            child: const CalculatorBody(),
          )),
    );
  }
}
