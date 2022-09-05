import 'package:flutter/material.dart';

// YOU HAVE USE '=' AFTER EACH OPERATION OTHER WISE WRONG OUTPUT......

void main() {
  runApp(CalculatorApp());
}

//************************************************************************************

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

//*****************************************************************************************

class _CalculatorAppState extends State<CalculatorApp> {
  String _history = '';
  String _display = '';
  String _operation = '';

  double _firstNum = 0;
  double _secondNum = 0;

  String check(double ans) {
    String s = (ans).toString();
    if (ans.round() == ans) {
      int k = ans.round();
      s = k.toString();
    }
    return s;
  }

  void _calculate(String btnval) {
    setState(() {
      if (btnval != '<-') {
        _display += btnval;
      }

      if (btnval != '<-') {
        _history += btnval;
      }

      if (btnval == '<-') {
        _display = _display.substring(0, _display.length - 1);
        _history = _display;
      }

      if (btnval == 'AC') {
        double _firstNum = 0;
        double _secondNum = 0;
        _display = '';
        _history = '';
      }

      if (btnval == 'X' ||
          btnval == '/' ||
          btnval == '-' ||
          btnval == '+' ||
          btnval == '^') {
        String first = _display.substring(0, _display.length - 1);
        _firstNum = double.parse(first);
        _operation = btnval;
        _display = '';
      }

      if (btnval == '=') {
        String second = _display.substring(0, _display.length - 1);
        _secondNum = double.parse(second);

        if (_operation == '+') {
          String ans = check(_firstNum + _secondNum);
          _display = ans;
          _history = _display;
        }

        if (_operation == '-') {
          String ans = check(_firstNum - _secondNum);
          _display = ans;
          _history = _display;
        }

        if (_operation == 'X') {
          String ans = check(_firstNum * _secondNum);
          _display = ans;
          _history = _display;
        }

        if (_operation == '/') {
          String ans = check(_firstNum / _secondNum);
          _display = ans;
          _history = _display;
        }

        if (_operation == '^') {
          double ans = _firstNum;
          for (double i = 1; i < _secondNum; i++) {
            ans *= _firstNum;
          }
          String s = check(ans);
          _display = s;
          _history = _display;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Custom Calculator',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculator'),
          backgroundColor: Colors.blueGrey,
        ),
        backgroundColor: Colors.white,
        body: Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        _history,
                        style: TextStyle(
                            fontSize: 25, color: Colors.black.withOpacity(0.4)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        _display,
                        style: TextStyle(
                            fontSize: 50,
                            color: Colors.black.withOpacity(0.5),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 60,
                      width: 75,
                      child: ElevatedButton(
                        onPressed: () {
                          _calculate('AC');
                        },
                        child: Text('AC', style: TextStyle(fontSize: 20)),
                        style:
                            ElevatedButton.styleFrom(primary: Colors.blueGrey),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      width: 75,
                      child: ElevatedButton(
                        onPressed: () {
                          _calculate('<-');
                        },
                        child: Text('<-', style: TextStyle(fontSize: 30)),
                        style:
                            ElevatedButton.styleFrom(primary: Colors.blueGrey),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      width: 75,
                      child: ElevatedButton(
                        onPressed: () {
                          _calculate('^');
                        },
                        child: Text('^', style: TextStyle(fontSize: 20)),
                        style:
                            ElevatedButton.styleFrom(primary: Colors.blueGrey),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      width: 75,
                      child: ElevatedButton(
                        onPressed: () {
                          _calculate('/');
                        },
                        child: Text('/', style: TextStyle(fontSize: 20)),
                        style:
                            ElevatedButton.styleFrom(primary: Colors.blueGrey),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 60,
                      width: 75,
                      child: ElevatedButton(
                        onPressed: () {
                          _calculate('7');
                        },
                        child: Text('7', style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      width: 75,
                      child: ElevatedButton(
                        onPressed: () {
                          _calculate('8');
                        },
                        child: Text('8', style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      width: 75,
                      child: ElevatedButton(
                        onPressed: () {
                          _calculate('9');
                        },
                        child: Text('9', style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      width: 75,
                      child: ElevatedButton(
                        onPressed: () {
                          _calculate('X');
                        },
                        child: Text('X', style: TextStyle(fontSize: 20)),
                        style:
                            ElevatedButton.styleFrom(primary: Colors.blueGrey),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 60,
                      width: 75,
                      child: ElevatedButton(
                        onPressed: () {
                          _calculate('4');
                        },
                        child: Text('4', style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      width: 75,
                      child: ElevatedButton(
                        onPressed: () {
                          _calculate('5');
                        },
                        child: Text('5', style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      width: 75,
                      child: ElevatedButton(
                        onPressed: () {
                          _calculate('6');
                        },
                        child: Text('6', style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      width: 75,
                      child: ElevatedButton(
                        onPressed: () {
                          _calculate('-');
                        },
                        child: Text('-', style: TextStyle(fontSize: 20)),
                        style:
                            ElevatedButton.styleFrom(primary: Colors.blueGrey),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 60,
                      width: 75,
                      child: ElevatedButton(
                        onPressed: () {
                          _calculate('1');
                        },
                        child: Text('1', style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      width: 75,
                      child: ElevatedButton(
                        onPressed: () {
                          _calculate('2');
                        },
                        child: Text('2', style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      width: 75,
                      child: ElevatedButton(
                        onPressed: () {
                          _calculate('3');
                        },
                        child: Text('3', style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      width: 75,
                      child: ElevatedButton(
                        onPressed: () {
                          _calculate('+');
                        },
                        child: Text('+', style: TextStyle(fontSize: 20)),
                        style:
                            ElevatedButton.styleFrom(primary: Colors.blueGrey),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 60,
                      width: 75,
                      child: ElevatedButton(
                        onPressed: () {
                          _calculate('00');
                        },
                        child: Text('00', style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      width: 75,
                      child: ElevatedButton(
                        onPressed: () {
                          _calculate('0');
                        },
                        child: Text('0', style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      width: 75,
                      child: ElevatedButton(
                        onPressed: () {
                          _calculate('.');
                        },
                        child: Text('.', style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      width: 75,
                      child: ElevatedButton(
                        onPressed: () {
                          _calculate('=');
                        },
                        child: Text('=', style: TextStyle(fontSize: 20)),
                        style:
                            ElevatedButton.styleFrom(primary: Colors.blueGrey),
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
