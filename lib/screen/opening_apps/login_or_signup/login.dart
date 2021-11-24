import 'dart:async';

import 'package:treva_shop_flutter/Library/Language_Library/lib/easy_localization_delegate.dart';
import 'package:treva_shop_flutter/Library/Language_Library/lib/easy_localization_provider.dart';
import 'package:flutter/material.dart';
import 'package:treva_shop_flutter/shared/button_black_bottom.dart';
import 'package:treva_shop_flutter/shared/text_form_custom_field.dart';

import 'login_animation.dart';
import 'signup.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

/// Component Widget this layout UI
class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  //Animation Declaration
  AnimationController sanimationController;

  var tap = 0;

  @override

  /// set state animation controller
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

  /// Dispose animation controller
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
    mediaQueryData.size.width;
    mediaQueryData.size.height;

    var data = EasyLocalizationProvider.of(context).data;

    return EasyLocalizationProvider(
      data: data,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          /// Set Background image in layout (Click to open code)
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/img/loginscreenbackground.png"),
            fit: BoxFit.cover,
          )),
          child: Container(
            /// Set gradient color in image (Click to open code)
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(0, 0, 0, 0.0),
                  Color.fromRGBO(0, 0, 0, 0.3)
                ],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
              ),
            ),

            /// Set component layout
            child: ListView(
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
                                      top: mediaQueryData.padding.top + 40.0)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image(
                                    image: AssetImage("assets/img/Logo.png"),
                                    height: 70.0,
                                  ),
                                  Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.0)),

                                  /// Animation text treva shop accept from signup layout (Click to open code)
                                  Hero(
                                    tag: "Zoolu",
                                    child: Text(
                                      AppLocalizations.of(context).tr('title'),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          letterSpacing: 0.6,
                                          color: Colors.white,
                                          fontFamily: "Sans",
                                          fontSize: 20.0),
                                    ),
                                  ),
                                ],
                              ),

                              // /// ButtonCustomFacebook
                              // Padding(
                              //     padding:
                              //         EdgeInsets.symmetric(vertical: 30.0)),
                              // buttonCustomFacebook(),
                              //
                              // /// ButtonCustomGoogle
                              // Padding(
                              //     padding: EdgeInsets.symmetric(vertical: 7.0)),
                              // buttonCustomGoogle(),
                              //
                              // /// Set Text
                              // Padding(
                              //     padding:
                              //         EdgeInsets.symmetric(vertical: 10.0)),
                              // Text(
                              //   AppLocalizations.of(context).tr('or'),
                              //   style: TextStyle(
                              //       fontWeight: FontWeight.w900,
                              //       color: Colors.white,
                              //       letterSpacing: 0.2,
                              //       fontFamily: 'Sans',
                              //       fontSize: 17.0),
                              // ),

                              /// TextFromField Email
                              Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 10.0)),
                              TextFormCustomField(
                                icon: Icons.email,
                                password: false,
                                labelText: AppLocalizations.of(context).tr('email'),
                                inputType: TextInputType.emailAddress,
                              ),

                              /// TextFromField Password
                              Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5.0)),
                              TextFormCustomField(
                                icon: Icons.vpn_key,
                                password: true,
                                labelText:
                                    AppLocalizations.of(context).tr('password'),
                                inputType: TextInputType.text,
                              ),

                              /// Button Signup
                              FlatButton(
                                  padding: EdgeInsets.only(top: 20.0),
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                new Signup()));
                                  },
                                  child: Text(
                                    AppLocalizations.of(context).tr('notHave'),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Sans"),
                                  )),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: mediaQueryData.padding.top + 100.0,
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
                              new LoginAnimation(
                                animationController: sanimationController.view,
                              );
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
      ),
    );
  }
}