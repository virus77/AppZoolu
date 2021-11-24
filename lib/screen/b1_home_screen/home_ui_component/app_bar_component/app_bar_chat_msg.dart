import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarMsg extends StatelessWidget {
  AppBarMsg({this.txt, this.animationController});

  final String txt;
  final AnimationController animationController;

  @override
  Widget build(BuildContext ctx) {
    return new SizeTransition(
      sizeFactor: new CurvedAnimation(
          parent: animationController, curve: Curves.fastOutSlowIn),
      axisAlignment: 0.0,
      child: new Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            new Expanded(
              child: Padding(
                padding: const EdgeInsets.all(00.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(1.0),
                            bottomLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                            topLeft: Radius.circular(20.0)),
                        color: Color(0xFF6991C7).withOpacity(0.6),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: new Text(
                        txt,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
//            new Container(
//              margin: const EdgeInsets.only(right: 5.0,left: 10.0),
//              child: new CircleAvatar(
//                backgroundImage: AssetImage("assets/avatars/avatar-1.jpg"),
////                  backgroundColor: Colors.indigoAccent,
////                  child: new Text(defaultUserName[0])),
//              ),
//            ),
          ],
        ),
      ),
    );
  }
}