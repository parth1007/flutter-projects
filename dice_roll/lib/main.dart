import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  runApp(DiceRollingApp());
}
class DiceRollingApp extends StatefulWidget {
  @override
  _DiceRollingAppState createState() => _DiceRollingAppState();
}

class _DiceRollingAppState extends State<DiceRollingApp> {
  int nextDiceImage = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Dice Rolling App')),
          backgroundColor: Colors.cyan,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset('assets/images/dice_$nextDiceImage.png'),
            ),
            ),
            RaisedButton(
                onPressed: (){
                  setState(() {
                    nextDiceImage = Random().nextInt(6) + 1;
                  });
                },
              
              child: Container(
                  padding: EdgeInsets.all(15.0),
                  child: Text('Click here to Roll')),
              
              color: Colors.cyan,
            )
          ],
        ),
      ),
    );
  }
}
