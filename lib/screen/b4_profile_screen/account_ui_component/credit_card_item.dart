import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:treva_shop_flutter/Library/Language_Library/lib/easy_localization.dart';
import 'package:treva_shop_flutter/model/credit_card_custom_model.dart';

/// Custom Text Header
var _txtCustomHead = TextStyle(
  color: Colors.black54,
  fontSize: 17.0,
  fontWeight: FontWeight.w600,
  fontFamily: "Gotik",
);

/// Custom Text Detail
var _txtCustomSub = TextStyle(
  color: Colors.black38,
  fontSize: 13.5,
  fontWeight: FontWeight.w500,
  fontFamily: "Gotik",
);

class CreditCardItem extends StatelessWidget{
  final CreditCardCustomModel model;

  CreditCardItem({this.model});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    return
      Padding(
        padding:
        const EdgeInsets.only(left: 15.0, right: 15.0),
        child: Stack(
          children: <Widget>[
            Image.asset(
              "assets/img/credit_card" + this.model.color.toString() + ".png",
              height: 200.0,
              fit: BoxFit.fill,
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      top: mediaQuery.padding.top + 80.0),
                  child: Text(
                    this.model.cardNumber,
                    style: _txtCustomHead.copyWith(
                        color: Colors.white,
                        fontSize: 16.0,
                        letterSpacing: 3.5),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: mediaQuery.padding.top + 30.0,
                      left: 20.0,
                      right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        AppLocalizations.of(context).tr('cardName'),
                        style:
                        _txtCustomSub.copyWith(color: Colors.white),
                      ),
                      Text(AppLocalizations.of(context).tr('cvv'),
                          style: _txtCustomSub.copyWith(
                              color: Colors.white)),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 20.0, right: 40.0, top: 2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(this.model.cardName,
                          style: _txtCustomSub.copyWith(
                              color: Colors.white)),
                      Text(this.model.cardCvv,
                          style: _txtCustomSub.copyWith(
                              color: Colors.white)),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      );
  }
}