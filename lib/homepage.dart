// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() {
//     return _HomePageState();
//   }
//   // _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
      
//     );
//   }
// }
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();
  double result = 0.0;

  void calculateResult(String operation) {
    double num1 = double.tryParse(num1Controller.text) ?? 0.0;
    double num2 = double.tryParse(num2Controller.text) ?? 0.0;
    double res = 0.0;
    if (operation == '+') {
      res = num1 + num2;
    } else if (operation == '-') {
      res = num1 - num2;
    } else if (operation == '*') {
      res = num1 * num2;
    } else if (operation == '/') {
      if (num2 != 0) {
        res = num1 / num2;
      } else {
        // Handle division by zero error
        res = double.infinity; // or show an error message
      }
    }
    setState(() {
      result = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 50.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter number 1',
              ),
            ),
            TextField(
              controller: num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter number 2',
              ),
            ),
            SizedBox(height: 16.0),
            Column(
              
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () => calculateResult('+'),
                  child: Text('Additon'),
                ),
                ElevatedButton(
                  onPressed: () => calculateResult('-'),
                  child: Text('Subtraction'),
                ),
                ElevatedButton(
                  onPressed: () => calculateResult('*'),
                  child: Text('Multiplication'),
                ),
                ElevatedButton(
                  onPressed: () => calculateResult('/'),
                  child: Text('Division'),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'Result: $result',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
