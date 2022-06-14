import 'package:flutter/material.dart';

class Answer extends StatelessWidget {

  final Function selectHandler;
  final String answer;
  Answer(this.selectHandler, this.answer);


  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        child: Text(this.answer),
        onPressed: this.selectHandler,
      ),
    );
  }
}
