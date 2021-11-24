import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimeWidget extends StatefulWidget {
  final int time;

  TimeWidget({this.time});

  @override
  State<StatefulWidget> createState() => new _TimeWidgetState(time: time);
}

class _TimeWidgetState extends State<TimeWidget> {
  int time;

  _TimeWidgetState({this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200.0,
        width: 200.0,
        decoration: new BoxDecoration(
            color: Color(0xFFFFFFFF),
            border: new Border.all(
                width: 20, color: Color(0xFFFCE273), style: BorderStyle.solid),
            borderRadius: new BorderRadius.all(Radius.circular(100))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              time.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: Colors.black,
              ),
            ),
          ],
        ));
  }
}
