import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_card_io/flutter_card_io.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:treva_shop_flutter/Library/Language_Library/lib/easy_localization.dart';
import 'package:treva_shop_flutter/model/credit_card_custom_model.dart';
import 'package:treva_shop_flutter/screen/b4_profile_screen/account_ui_component/credit_card_custom_form.dart';

class AddCreditCard extends StatefulWidget {
  @override
  _AddCreditCard createState() => _AddCreditCard();
}

class _AddCreditCard extends State<AddCreditCard> {
  final CreditCardCustomModel model = new CreditCardCustomModel(
    color: 0,
    cardNumber: '',
    cardName: '',
    cardExp: '',
    cardCvv: ''
  );

  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController creditCardController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController expirationController = TextEditingController();

  scanCard() async {
    Map<dynamic, dynamic> details;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      details = await FlutterCardIo.scanCard({
        "scanExpiry": true,
        "scanInstructions": "Coloca la tarjeta en el recuadro",
      });

      // for (var key in details.keys) log(key);
      // for (var value in details.values) log(value.toString());

      setState(() {
        this.model.cardNumber = details["cardNumber"].toString().replaceAllMapped(RegExp(r".{4}"), (match) => "${match.group(0)} ");
      });
    } on PlatformException {
      print("Failed");
      return;
    }

    if (details == null) {
      print("Canceled");
      return;
    }

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).tr('addCreditCard')),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            CreditCardWidget(
              cardNumber: this.model.cardNumber,
              expiryDate: this.model.cardExp,
              cardHolderName: this.model.cardName,
              cvvCode: this.model.cardCvv,
              showBackView: isCvvFocused,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CreditCardCustomForm(
                      formKey: formKey,
                      cardNumber: this.model.cardNumber,
                      expiryDate: this.model.cardExp,
                      cardHolderName: this.model.cardName,
                      cvvCode: this.model.cardCvv,
                      obscureCvv: true,
                      obscureNumber: true,
                      cardNumberDecoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Number',
                        hintText: 'XXXX XXXX XXXX XXXX',
                      ),
                      expiryDateDecoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Expired Date',
                        hintText: 'XX/XX',
                      ),
                      cvvCodeDecoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'CVV',
                        hintText: 'XXX',
                      ),
                      cardHolderDecoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Card Holder',
                      ),
                      onCreditCardModelChange: onCreditCardModelChange,
                    ),
                    FloatingActionButton(
                      onPressed: () async {
                        var status = await Permission.camera.request();
                        if (status == PermissionStatus.granted) {
                          scanCard();
                        }
                      },
                      tooltip: 'scan',
                      child: Icon(Icons.camera_alt),
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(8),
                        child: Text(
                          AppLocalizations.of(context).tr('save'),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      color: const Color(0xff1b447b),
                      onPressed: () {
                        if (formKey.currentState.validate()) {
                          Navigator.of(context).pop();
                        } else {
                          print('invalid!');
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      this.model.cardNumber = creditCardModel.cardNumber;
      this.model.cardExp = creditCardModel.expiryDate;
      this.model.cardName = creditCardModel.cardHolderName;
      this.model.cardCvv = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}