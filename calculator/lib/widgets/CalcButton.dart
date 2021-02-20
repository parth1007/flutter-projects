import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget{
  final String text;
  final int bgcolor;
  final int textColor;
  final Function callback;
  //final int textColor;
  const CalcButton({Key key,
    this.text,
    this.callback,
    this.textColor=0xFFFFFFFF,
    this.bgcolor}
    ): super(key:key);
  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: EdgeInsets.all(14.0),
      child: SizedBox(
        width: 70,
        height: 70,
        child: FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50)),
            child: Text(
                text,
              style: TextStyle(
                fontSize: 23.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            onPressed: (){
              callback(text);
            },
            color: bgcolor != null ? Color(bgcolor) : null,
            textColor: Color(textColor),
        ),
      ),
    );
  }
}