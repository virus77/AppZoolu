import 'dart:async';

import 'package:treva_shop_flutter/Library/Language_Library/lib/easy_localization_delegate.dart';
import 'package:treva_shop_flutter/Library/Language_Library/lib/easy_localization_provider.dart';
import 'package:flutter/material.dart';
import 'package:treva_shop_flutter/shared/button_black_bottom.dart';
import 'package:treva_shop_flutter/shared/dropdown_custom_button.dart';
import 'package:treva_shop_flutter/shared/text_form_custom_field.dart';

import 'login.dart';
import 'login_animation.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> with TickerProviderStateMixin {
  //Animation Declaration
  AnimationController sanimationController;
  AnimationController animationControllerScreen;
  Animation animationScreen;

  String dropdownValue = 'One';

  var tap = 0;

  /// Set AnimationController to initState
  @override
  void initState() {
    sanimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800))
          ..addStatusListener((status) {
            if (status == AnimationStatus.dismissed) {
              setState(() {
                tap = 0;
              });
            }
          });
    // TODO: implement initState
    super.initState();
  }

  /// Dispose animationController
  @override
  void dispose() {
    sanimationController.dispose();
    super.dispose();
  }

  /// Playanimation set forward reverse
  Future<Null> _playAnimation() async {
    try {
      await sanimationController.forward();
      await sanimationController.reverse();
    } on TickerCanceled {}
  }

  /// Component Widget layout UI
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    mediaQueryData.size.height;
    mediaQueryData.size.width;

    var data = EasyLocalizationProvider.of(context).data;
    return EasyLocalizationProvider(
      data: data,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              /// Set Background image in layout
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/img/backgroundgirl.png"),
                fit: BoxFit.cover,
              )),
              child: Container(
                /// Set gradient color in image
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(0, 0, 0, 0.2),
                      Color.fromRGBO(0, 0, 0, 0.3)
                    ],
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                  ),
                ),

                /// Set component layout
                child: ListView(
                  padding: EdgeInsets.all(0.0),
                  children: <Widget>[
                    Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              alignment: AlignmentDirectional.topCenter,
                              child: Column(
                                children: <Widget>[
                                  /// padding logo
                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: mediaQueryData.padding.top +
                                              40.0)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image(
                                        image:
                                            AssetImage("assets/img/Logo.png"),
                                        height: 70.0,
                                      ),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.0)),

                                      /// Animation text treva shop accept from login layout
                                      Hero(
                                        tag: "Zoolu",
                                        child: Text(
                                          AppLocalizations.of(context)
                                              .tr('title'),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                              letterSpacing: 0.6,
                                              fontFamily: "Sans",
                                              color: Colors.white,
                                              fontSize: 20.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 30.0)),

                                  /// TextFromField Nombre
                                  TextFormCustomField(
                                    icon: Icons.view_agenda,
                                    password: false,
                                    labelText:
                                        AppLocalizations.of(context).tr('name'),
                                    inputType: TextInputType.name,
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5.0)),

                                  /// TextFromField Apellido paterno
                                  TextFormCustomField(
                                    icon: Icons.view_agenda,
                                    password: false,
                                    labelText: AppLocalizations.of(context)
                                        .tr('lastname1'),
                                    inputType: TextInputType.name,
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5.0)),

                                  /// TextFromField Apellido Materno
                                  TextFormCustomField(
                                    icon: Icons.view_agenda,
                                    password: false,
                                    labelText: AppLocalizations.of(context)
                                        .tr('lastname2'),
                                    inputType: TextInputType.name,
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5.0)),
                                  DropdownCustomButton(
                                    icon: Icons.view_agenda,
                                    items: ['Femenino', 'Masculino'],
                                    controller: new TextEditingController(),
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5.0)),

                                  /// TextFromField phone
                                  TextFormCustomField(
                                    icon: Icons.phone,
                                    password: false,
                                    labelText: AppLocalizations.of(context)
                                        .tr('telephone'),
                                    inputType: TextInputType.phone,
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5.0)),

                                  /// TextFromField Email
                                  TextFormCustomField(
                                    icon: Icons.email,
                                    password: false,
                                    labelText: AppLocalizations.of(context)
                                        .tr('email'),
                                    inputType: TextInputType.emailAddress,
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5.0)),

                                  /// TextFromField Password
                                  TextFormCustomField(
                                    icon: Icons.vpn_key,
                                    password: true,
                                    labelText: AppLocalizations.of(context)
                                        .tr('password'),
                                    inputType: TextInputType.text,
                                  ),

                                  /// Button Login
                                  FlatButton(
                                      padding: EdgeInsets.only(top: 20.0),
                                      onPressed: () {
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        new LoginScreen()));
                                      },
                                      child: Text(
                                        AppLocalizations.of(context)
                                            .tr('notHaveLogin'),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: "Sans"),
                                      )),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: mediaQueryData.padding.top + 50.0,
                                        bottom: 0.0),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),

                        /// Set Animaion after user click buttonLogin
                        tap == 0
                            ? InkWell(
                                splashColor: Colors.yellow,
                                onTap: () {
                                  setState(() {
                                    tap = 1;
                                  });
                                  _playAnimation();
                                  return tap;
                                },
                                child: ButtonBlackBottom(),
                              )
                            : new LoginAnimation(
                                animationController: sanimationController.view,
                              )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
