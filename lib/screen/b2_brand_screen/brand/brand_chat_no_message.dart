import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:treva_shop_flutter/Library/Language_Library/lib/easy_localization.dart';

class BrandChatNoMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Opacity(
                  opacity: 0.5,
                  child: Image.asset(
                    "assets/imgIllustration/IlustrasiMessage.png",
                    height: 220.0,
                  )),
              Text(
                AppLocalizations.of(context).tr('notHaveMessage'),
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.black12,
                    fontSize: 17.0,
                    fontFamily: "Popins"),
              )
            ],
          ),
        ));
  }
}