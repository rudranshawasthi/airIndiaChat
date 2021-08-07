import 'package:flutter/material.dart';

class SuggestionText extends StatelessWidget {
  String text;
  SuggestionText({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.orangeAccent),
        borderRadius: BorderRadius.circular(15.0),
      ),
      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(fontSize: 16, color: Colors.orangeAccent),
      ),
    );
  }
}
