
import 'package:treva_shop_flutter/Library/Language_Library/lib/easy_localization_delegate.dart';
import 'package:treva_shop_flutter/Library/Language_Library/lib/easy_localization_provider.dart';
import 'package:flutter/material.dart';
import 'package:treva_shop_flutter/screen/b4_profile_screen/account_ui_component/setting.dart';

class SettingAccount extends StatefulWidget {
  @override
  _SettingAccountState createState() => _SettingAccountState();
}

class _SettingAccountState extends State<SettingAccount> {
  static var _txtCustomHead = TextStyle(
    color: Colors.black54,
    fontSize: 17.0,
    fontWeight: FontWeight.w600,
    fontFamily: "Gotik",
  );

  // static var _txtCustomSub = TextStyle(
  //   color: Colors.black38,
  //   fontSize: 15.0,
  //   fontWeight: FontWeight.w500,
  //   fontFamily: "Gotik",
  // );

  @override
  Widget build(BuildContext context) {
        var data = EasyLocalizationProvider.of(context).data;
    
    return EasyLocalizationProvider(
          data: data,
          child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context).tr('settingAccount'),
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18.0,
                color: Colors.black54,
                fontFamily: "Gotik"),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: Color(0xFF6991C7)),
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Setting(
                  head: AppLocalizations.of(context).tr('account'),
                  sub1: AppLocalizations.of(context).tr('address'),
                  sub2:  AppLocalizations.of(context).tr('telephone'),
                  sub3:  AppLocalizations.of(context).tr('email'),
                ),
                Setting(
                  head:  AppLocalizations.of(context).tr('setting'),
                  sub1:  AppLocalizations.of(context).tr('orderNotification'),
                  sub2:  AppLocalizations.of(context).tr('discountNotification'),
                  sub3:  AppLocalizations.of(context).tr('creditCard'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Container(
                    height: 50.0,
                    width: 1000.0,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 13.0, left: 20.0, bottom: 15.0),
                      child: Text(
                        AppLocalizations.of(context).tr('logout'),
                        style: _txtCustomHead,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
