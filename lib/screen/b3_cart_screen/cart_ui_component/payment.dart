import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:treva_shop_flutter/Library/Language_Library/lib/easy_localization_delegate.dart';
import 'package:treva_shop_flutter/Library/Language_Library/lib/easy_localization_provider.dart';
import 'package:flutter/material.dart';
import 'package:treva_shop_flutter/model/credit_card_custom_model.dart';
import 'package:treva_shop_flutter/screen/b3_cart_screen/cart_ui_component/estimated_delivery_time.dart';
import 'package:treva_shop_flutter/screen/b3_cart_screen/cart_ui_component/rate_service.dart';
import 'package:treva_shop_flutter/screen/b4_profile_screen/account_ui_component/credit_card_item.dart';
import 'package:treva_shop_flutter/screen/bottom_custom_navigation_bar/bottom_custom_navigation_bar.dart';

var creditCardItems = [
  CreditCardItem(
      model: CreditCardCustomModel(
        cardNumber: 'XXXX XXXX XXXX 9510',
        cardName: 'Lorem ipsum dolor',
        cardCvv: 'XXX',
        color: 1,
        cardExp: '12/21',
      )),
  CreditCardItem(
      model: CreditCardCustomModel(
        cardNumber: 'XXXX XXXX XXXX 5263',
        cardName: 'Lorem ipsum dolor',
        cardCvv: 'XXX',
        color: 2,
        cardExp: '12/21',
      )),
  CreditCardItem(
      model: CreditCardCustomModel(
        cardNumber: 'XXXX XXXX XXXX 7821',
        cardName: 'Lorem ipsum dolor',
        cardCvv: 'XXX',
        color: 3,
        cardExp: '12/21',
      ))
];

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  CreditCardItem actualCardItem = creditCardItems.elementAt(0);

  /// Duration for popup card if user succes to payment
  startTime() async {
    return Timer(Duration(milliseconds: 1450), navigator);
  }

  /// Navigation to route after user succes payment
  void navigator() {
    Navigator.of(context).pushReplacement(PageRouteBuilder(
        pageBuilder: (_, __, ___) => new BottomCustomNavigationBar()));
  }

  /// For radio button
  int tapvalue = 0;
  int tapvalue2 = 0;
  int tapvalue3 = 0;
  int tapvalue4 = 0;

  /// Custom Text
  var _customStyle = TextStyle(
      fontFamily: "Gotik",
      fontWeight: FontWeight.w800,
      color: Colors.black,
      fontSize: 17.0);

  final LocalAuthentication auth = LocalAuthentication();
  bool _canCheckBiometrics;
  List<BiometricType> _availableBiometrics;
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;

  Future<void> _checkBiometrics() async {
    bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
  }

  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _availableBiometrics = availableBiometrics;
    });
  }

  Future<void> _authenticate() async {
    bool canCheckBiometrics;
    List<BiometricType> availableBiometrics;
    bool authenticated = false;

    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });

      try {
        canCheckBiometrics = await auth.canCheckBiometrics;

        try {
          availableBiometrics = await auth.getAvailableBiometrics();

          if (availableBiometrics.contains(BiometricType.face)) {

            authenticated = await auth.authenticateWithBiometrics(
                localizedReason: 'Utiliza tu cara para autorizar',
                useErrorDialogs: true,
                stickyAuth: true);
          } else if (availableBiometrics.contains(BiometricType.fingerprint)) {
            authenticated = await auth.authenticateWithBiometrics(
                localizedReason: 'Escanea tu huella para autorizar',
                useErrorDialogs: true,
                stickyAuth: true);
          }

          setState(() {
            _isAuthenticating = false;
            _authorized = 'Authenticating';
          });
        } on PlatformException catch (e) {
          print(e);
        }
      } on PlatformException catch (e) {
        print(e);
      }

    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    final String message = authenticated ? 'Authorized' : 'Not Authorized';
    setState(() {
      _authorized = message;
      if(authenticated){
        _showDialog(context);
        startTime();
      }
    });
  }

  void _cancelAuthentication() {
    auth.stopAuthentication();
  }

  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    return EasyLocalizationProvider(
      data: data,
      child: Scaffold(
        /// Appbar
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.of(context).pop(false);
              },
              child: Icon(Icons.arrow_back)),
          elevation: 0.0,
          title: Text(
            AppLocalizations.of(context).tr('chosePaymnet'),
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18.0,
                color: Colors.black54,
                fontFamily: "Gotik"),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Color(0xFF6991C7)),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  /// For RadioButton if selected or not selected
                  CarouselSlider(
                    options: CarouselOptions(
                        height: 200.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            this.actualCardItem = creditCardItems[index];
                          });
                        }),
                    items: creditCardItems,
                  ),
                  Padding(padding: EdgeInsets.only(top: 110.0)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Custom Text Header for Dialog after user succes payment
var _txtCustomHead = TextStyle(
  color: Colors.black54,
  fontSize: 23.0,
  fontWeight: FontWeight.w600,
  fontFamily: "Gotik",
);

/// Custom Text Description for Dialog after user succes payment
var _txtCustomSub = TextStyle(
  color: Colors.black38,
  fontSize: 15.0,
  fontWeight: FontWeight.w500,
  fontFamily: "Gotik",
);

/// Card Popup if success payment
_showDialog(BuildContext ctx) {
  showDialog(
    context: ctx,
    barrierDismissible: true,
    builder: (context) => SimpleDialog(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 30.0, right: 60.0, left: 60.0),
          color: Colors.white,
          child: Image.asset(
            "assets/img/checklist.png",
            height: 110.0,
            color: Colors.lightGreen,
          ),
        ),
        Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                AppLocalizations.of(ctx).tr('yuppy'),
                style: _txtCustomHead,
              ),
            )),
        Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 40.0),
              child: Text(
                AppLocalizations.of(ctx).tr('paymentReceive'),
                style: _txtCustomSub,
              ),
            )),
      ],
    ),
  );
}
