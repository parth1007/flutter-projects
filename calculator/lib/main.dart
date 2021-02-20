import 'package:flutter/material.dart';
import './widgets/CalcButton.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(CalcApp());
}

class CalcApp extends StatefulWidget{
  CalcApp({Key key}) : super(key: key);
  @override
  CalcAppState createState() => CalcAppState();
}

class CalcAppState extends State<CalcApp> {
  // This widget is the root of your application.
  String _history = '';
  String _expression = '';
  void numClick(String text){
    setState(() {
      _expression += text;
    });
  }
  void allClear(String text){
    setState(() {
      _expression  = '';
      _history = '';
    });
  }
  void Clear(String text){
    setState(() {
      _expression  = '';
    });
  }

  void evaluate(String text){
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      _history = _expression;
      _expression = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        backgroundColor: Color(0xFF132022),
        body: Column(

          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.only(right: 10),
              child: Text(
                  _history,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w300,
                  color: Colors.white70,
                ),
              ),
              alignment: Alignment(1,1),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                _expression,
                style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),),
              alignment: Alignment(1,1),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton(
                    text: 'AC',
                    callback: allClear,
                  bgcolor: 0xFF6C807F,
                  //textColor: 0xFF132022,
                ),
                CalcButton(
                    text: 'C',
                  callback: Clear,
                  bgcolor: 0xFF6C807F,
                ),
                CalcButton(
                    text: '%',
                  callback: numClick,
                  bgcolor: 0xFFFFFFFF,
                  textColor: 0xFF132022,
                ),
                CalcButton(
                    text: '/',
                  callback: numClick,
                  bgcolor: 0xFFFFFFFF,
                  textColor: 0xFF132022,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton(
                    text: '7',
                  callback: numClick,
                  bgcolor: 0xFF2d3a3c,
                ),
                CalcButton(
                    text: '8',
                  callback: numClick,
                  bgcolor: 0xFF2d3a3c,
                ),
                CalcButton(
                    text: '9',
                  callback: numClick,
                  bgcolor: 0xFF2d3a3c,
                ),
                CalcButton(
                    text: '*',
                  callback: numClick,
                  bgcolor: 0xFFFFFFFF,
                  textColor: 0xFF132022,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton(
                    text: '4',
                  callback: numClick,
                  bgcolor: 0xFF2d3a3c,
                ),
                CalcButton(
                    text: '5',
                  callback: numClick,
                  bgcolor: 0xFF2d3a3c,
                ),
                CalcButton(
                    text: '6',
                  callback: numClick,
                  bgcolor: 0xFF2d3a3c,
                ),
                CalcButton(
                    text: '-',
                  callback: numClick,
                  bgcolor: 0xFFFFFFFF,
                  textColor: 0xFF132022,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton(
                  text: '1',
                  callback: numClick,
                  bgcolor: 0xFF2d3a3c,
                ),
                CalcButton(
                  text: '2',
                  callback: numClick,
                  bgcolor: 0xFF2d3a3c,
                ),
                CalcButton(
                  text: '3',
                  callback: numClick,
                  bgcolor: 0xFF2d3a3c,
                ),
                CalcButton(
                  text: '+',
                  callback: numClick,
                  bgcolor: 0xFFFFFFFF,
                  textColor: 0xFF132022,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton(
                    text: '.',
                  callback: numClick,
                  bgcolor: 0xFF2d3a3c,
                ),
                CalcButton(
                    text: '0',
                  callback: numClick,
                  bgcolor: 0xFF2d3a3c,
                ),
                CalcButton(
                    text: '00',
                  callback: numClick,
                  bgcolor: 0xFF2d3a3c,
                ),
                CalcButton(
                    text: '=',
                  callback: evaluate,
                  bgcolor: 0xFFFFFFFF,
                  textColor: 0xFF132022,
                ),
              ],
            ),
          ]
        ),
      ),
    );
  }
}
