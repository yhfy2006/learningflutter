import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  //String 
  final Function pressFunction;
  final String title;
  Answer(this.pressFunction, this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(onPressed: pressFunction, 
      textColor: Colors.white,
      child: Text(title), 
      color: Colors.blue,),
    );
  }
}