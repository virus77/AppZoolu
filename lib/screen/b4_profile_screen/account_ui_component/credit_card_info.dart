import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:treva_shop_flutter/Library/Language_Library/lib/easy_localization.dart';
import 'package:treva_shop_flutter/model/credit_card_custom_model.dart';
import 'package:treva_shop_flutter/screen/b4_profile_screen/account_ui_component/edit_credit_card.dart';

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

class CreditCardInfo extends StatelessWidget {
  final CreditCardCustomModel model;

  CreditCardInfo({this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4.5,
                spreadRadius: 1.0,
              )
            ]),
        child: Column(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, left: 20.0, right: 60.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    AppLocalizations.of(context).tr('creditCard'),
                    style: _txtCustomHead.copyWith(
                        fontSize: 15.0, fontWeight: FontWeight.w600),
                  ),
                  Image.asset(
                    "assets/img/credit.png",
                    height: 30.0,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 20.0, bottom: 5.0, left: 20.0, right: 60.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        AppLocalizations.of(context).tr('cardNumber'),
                        style: _txtCustomSub,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(this.model.cardNumber),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        AppLocalizations.of(context).tr('exp'),
                        style: _txtCustomSub,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text("12/29"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 15.0,
                bottom: 30.0,
                left: 20.0,
                right: 30.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        AppLocalizations.of(context).tr('cardName'),
                        style: _txtCustomSub,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(this.model.cardName),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        AppLocalizations.of(context).tr('cvv'),
                        style: _txtCustomSub,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(this.model.cardCvv),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
                height: 50.0,
                width: 1000.0,
                color: Colors.blueGrey.withOpacity(0.1),
                child: Center(
                  child: RaisedButton(
                    child: Text(AppLocalizations.of(context).tr('editDetail')),
                    onPressed: (){
                      Navigator.of(context).push(new MaterialPageRoute<Null>(
                          builder: (BuildContext context) {
                            return EditCreditCard(model: this.model);
                          },
                          fullscreenDialog: true
                      ));
                    },
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
