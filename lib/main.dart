import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _expression = '';

  void _onButtonPressed(String value) {
    setState(() {
      if (value == '=') {
        try {
          _expression = evalExpression(_expression).toString();
        } catch (e) {
          _expression = 'Error';
        }
      } else if (value == 'C') {
        _expression = '';
      } else {
        _expression += value;
      }
    });
  }

  double evalExpression(String expression) {
    // You can use a math library or your own parser here
    return 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator App'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.bottomRight,
              child: Text(
                _expression,
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          Divider(height: 1.0, color: Colors.grey),
          Column(
            children: [
              _buildButtonRow(['7', '8', '9', '/']),
              _buildButtonRow(['4', '5', '6', '*']),
              _buildButtonRow(['1', '2', '3', '-']),
              _buildButtonRow(['0', '.', '=', '+']),
            ],
          ),
        ],
      ),
      
    );
  }

  Widget _buildButtonRow(List<String> buttons) {
    return Row(
      children: buttons.map((buttonText) => _buildButton(buttonText)).toList(),
    );
  }

  Widget _buildButton(String buttonText) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(5.0),
        child: ElevatedButton(
          onPressed: () => _onButtonPressed(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.grey[300],
            onPrimary: Color.fromARGB(255, 71, 5, 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }
}

