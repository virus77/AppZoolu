import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:treva_shop_flutter/Library/intro_views_flutter-2.4.0/lib/Models/page_view_model.dart';
import 'package:treva_shop_flutter/Library/intro_views_flutter-2.4.0/lib/intro_views_flutter.dart';
import 'package:treva_shop_flutter/screen/b1_home_screen/b1_home/b1_home_screen.dart';
import 'package:treva_shop_flutter/screen/opening_apps/login_or_signup/chose_login_or_signup.dart';
import 'package:treva_shop_flutter/shared/dropdown_custom_button.dart';
import 'package:treva_shop_flutter/shared/text_form_custom_field.dart';

class OnBoardingLogin extends StatefulWidget {
  @override
  _OnBoardingLoginState createState() => _OnBoardingLoginState();
}

var _fontHeaderStyle = TextStyle(
    fontFamily: "Popins",
    fontSize: 21.0,
    fontWeight: FontWeight.w800,
    color: Colors.black87,
    letterSpacing: 1.5);

var _fontDescriptionStyle = TextStyle(
    fontFamily: "Sans",
    fontSize: 15.0,
    color: Colors.black26,
    fontWeight: FontWeight.w400);

///
/// Page View Model for on boarding
///
final pages = [
  new PageViewModel(
      pageColor: Colors.white,
      iconColor: Colors.black,
      bubbleBackgroundColor: Colors.black,
      title: Text(
        'Datos de acceso',
        style: _fontHeaderStyle,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextFormCustomField(
            icon: Icons.email,
            password: false,
            labelText: 'Correo electrónico',
            inputType: TextInputType.emailAddress,
          ),
          Padding(
              padding:
              EdgeInsets.symmetric(vertical: 5.0)),

          /// TextFromField Password
          TextFormCustomField(
            icon: Icons.vpn_key,
            password: true,
            labelText: 'Contraseña',
            inputType: TextInputType.text,
          )
        ],
      ),
      mainImage: Image.asset(
        'assets/imgIllustration/IlustrasiOnBoarding3.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ))
];

class _OnBoardingLoginState extends State<OnBoardingLogin> {
  @override
  Widget build(BuildContext context) {
    return IntroViewsFlutter(
      pages,
      pageButtonsColor: Colors.black45,
      showSkipButton: false,
      doneText: Text(
        "Hecho",
        style: _fontDescriptionStyle.copyWith(
            color: Colors.deepPurpleAccent,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.0),
      ),
      onTapDoneButton: () async {
        SharedPreferences prefs;
        prefs = await SharedPreferences.getInstance();
        prefs.setString("username", "Login");
        Navigator.of(context).pushReplacement(PageRouteBuilder(
          pageBuilder: (_, __, ___) => new B1HomeScreen(),
          transitionsBuilder:
              (_, Animation<double> animation, __, Widget widget) {
            return Opacity(
              opacity: animation.value,
              child: widget,
            );
          },
          transitionDuration: Duration(milliseconds: 1500),
        ));
      },
    );
  }
}
