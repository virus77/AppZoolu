import 'package:treva_shop_flutter/Library/Language_Library/lib/easy_localization_delegate.dart';
import 'package:treva_shop_flutter/Library/Language_Library/lib/easy_localization_provider.dart';
import 'package:flutter/material.dart';
import 'package:treva_shop_flutter/screen/b4_profile_screen/account_ui_component/about_apps.dart';

// import 'package:treva_shop_flutter/screen/b4_profile_screen/account_ui_component/call_center.dart';
import 'package:treva_shop_flutter/screen/b4_profile_screen/account_ui_component/credit_card_setting.dart';

// import 'package:treva_shop_flutter/screen/b4_profile_screen/account_ui_component/message.dart';
// import 'package:treva_shop_flutter/screen/b4_profile_screen/account_ui_component/my_orders.dart';
// import 'package:treva_shop_flutter/screen/b4_profile_screen/account_ui_component/account_notification.dart';
import 'package:treva_shop_flutter/screen/b4_profile_screen/account_ui_component/setting_account.dart';
import 'package:treva_shop_flutter/screen/b4_profile_screen/b4_profile/b4_profile_category.dart';
// import 'package:treva_shop_flutter/screen/b4_profile_screen/account_ui_component/languageSetting.dart';

/// Custom Font
var _txt = TextStyle(
  color: Colors.black,
  fontFamily: "Sans",
);

/// Get _txt and custom value of Variable for Name User
var _txtName = _txt.copyWith(fontWeight: FontWeight.w700, fontSize: 17.0);

/// Get _txt and custom value of Variable for Edit text
var _txtEdit = _txt.copyWith(color: Colors.black26, fontSize: 15.0);

class B4Profile extends StatefulWidget {
  @override
  _B4ProfileState createState() => _B4ProfileState();
}

class _B4ProfileState extends State<B4Profile> {
  @override
  Widget build(BuildContext context) {
    /// Declare MediaQueryData
    // MediaQueryData mediaQueryData = MediaQuery.of(context);

    /// To Sett PhotoProfile,Name and Edit Profile
    var _profile = Padding(
      padding: EdgeInsets.only(
        top: 50.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Container(
              //   height: 100.0,
              //   width: 100.0,
              //   decoration: BoxDecoration(
              //       border: Border.all(color: Colors.white, width: 2.5),
              //       shape: BoxShape.circle,
              //       image: DecorationImage(
              //           image: AssetImage("assets/img/womanface.jpg"))),
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  AppLocalizations.of(context).tr('name'),
                  style: _txtName,
                ),
              ),
              InkWell(
                onTap: null,
                child: Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: Text(
                    AppLocalizations.of(context).tr('editProfile'),
                    style: _txtEdit,
                  ),
                ),
              ),
            ],
          ),
          Container(),
        ],
      ),
    );

    var data = EasyLocalizationProvider.of(context).data;
    return EasyLocalizationProvider(
      data: data,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context).tr('account'),
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18.0,
                color: Colors.black54,
                fontFamily: "Gotik"),
          ),
          iconTheme: IconThemeData(
            color: const Color(0xFF6991C7),
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Stack(
              children: <Widget>[
                /// Setting Header Banner
                // Container(
                //   height: 240.0,
                //   decoration: BoxDecoration(
                //       image: DecorationImage(
                //           image: AssetImage("assets/img/headerProfile.png"),
                //           fit: BoxFit.cover)),
                // ),
                //
                // /// Calling _profile variable
                _profile,
                Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Column(
                    /// Setting Category List
                    children: <Widget>[
                      /// Call category class
                      // category(
                      //   txt: AppLocalizations.of(context).tr('notification'),
                      //   padding: 35.0,
                      //   image: "assets/icon/notification.png",
                      //   tap: () {
                      //     Navigator.of(context).push(PageRouteBuilder(
                      //         pageBuilder: (_, __, ___) => new notification()));
                      //   },
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.only(
                      //       top: 20.0, left: 85.0, right: 30.0),
                      //   child: Divider(
                      //     color: Colors.black12,
                      //     height: 2.0,
                      //   ),
                      // ),
                      B4ProfileCategory(
                        txt: AppLocalizations.of(context).tr('payments'),
                        padding: 35.0,
                        image: "assets/icon/creditAcount.png",
                        tap: () {
                          Navigator.of(context).push(PageRouteBuilder(
                              pageBuilder: (_, __, ___) =>
                                  new CreditCardSetting()));
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, left: 85.0, right: 30.0),
                        child: Divider(
                          color: Colors.black12,
                          height: 2.0,
                        ),
                      ),
                      // category(
                      //   txt: AppLocalizations.of(context).tr('message'),
                      //   padding: 26.0,
                      //   image: "assets/icon/chat.png",
                      //   tap: () {
                      //     Navigator.of(context).push(PageRouteBuilder(
                      //         pageBuilder: (_, __, ___) => new chat()));
                      //   },
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.only(
                      //       top: 20.0, left: 85.0, right: 30.0),
                      //   child: Divider(
                      //     color: Colors.black12,
                      //     height: 2.0,
                      //   ),
                      // ),
                      // category(
                      //   txt: AppLocalizations.of(context).tr('myOrders'),
                      //   padding: 23.0,
                      //   image: "assets/icon/truck.png",
                      //   tap: () {
                      //     Navigator.of(context).push(PageRouteBuilder(
                      //         pageBuilder: (_, __, ___) => new order()));
                      //   },
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.only(
                      //       top: 20.0, left: 85.0, right: 30.0),
                      //   child: Divider(
                      //     color: Colors.black12,
                      //     height: 2.0,
                      //   ),
                      // ),
                      B4ProfileCategory(
                        txt: AppLocalizations.of(context).tr('settingAccount'),
                        padding: 30.0,
                        image: "assets/icon/setting.png",
                        tap: () {
                          Navigator.of(context).push(PageRouteBuilder(
                              pageBuilder: (_, __, ___) =>
                                  new SettingAccount()));
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, left: 85.0, right: 30.0),
                        child: Divider(
                          color: Colors.black12,
                          height: 2.0,
                        ),
                      ),
                      // category(
                      //   txt: AppLocalizations.of(context).tr('callCenter'),
                      //   padding: 30.0,
                      //   image: "assets/icon/callcenter.png",
                      //   tap: () {
                      //     Navigator.of(context).push(PageRouteBuilder(
                      //         pageBuilder: (_, __, ___) => new callCenter()));
                      //   },
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.only(
                      //       top: 20.0, left: 85.0, right: 30.0),
                      //   child: Divider(
                      //     color: Colors.black12,
                      //     height: 2.0,
                      //   ),
                      // ),
                      // category(
                      //   txt: AppLocalizations.of(context).tr('language'),
                      //   padding: 30.0,
                      //   image: "assets/icon/language.png",
                      //   tap: () {
                      //     Navigator.of(context).push(PageRouteBuilder(
                      //         pageBuilder: (_, __, ___) =>
                      //             new languageSetting()));
                      //   },
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.only(
                      //       top: 20.0, left: 85.0, right: 30.0),
                      //   child: Divider(
                      //     color: Colors.black12,
                      //     height: 2.0,
                      //   ),
                      // ),
                      B4ProfileCategory(
                        padding: 38.0,
                        txt: AppLocalizations.of(context).tr('aboutApps'),
                        image: "assets/icon/aboutapp.png",
                        tap: () {
                          Navigator.of(context).push(PageRouteBuilder(
                              pageBuilder: (_, __, ___) => new AboutApps()));
                        },
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 20.0)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
