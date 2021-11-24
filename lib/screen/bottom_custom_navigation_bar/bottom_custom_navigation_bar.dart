import 'package:treva_shop_flutter/Library/Language_Library/lib/easy_localization_delegate.dart';
import 'package:treva_shop_flutter/Library/Language_Library/lib/easy_localization_provider.dart';
import 'package:flutter/material.dart';
import 'package:treva_shop_flutter/screen/b1_home_screen/b1_home/b1_home_screen.dart';
import 'package:treva_shop_flutter/screen/b2_brand_screen/brand/brand_layout.dart';
import 'package:treva_shop_flutter/screen/b3_cart_screen/b3_cart/b3_cart_screen.dart';
import 'package:treva_shop_flutter/screen/b4_profile_screen/b4_profile/b4_profile_screen.dart';

class BottomCustomNavigationBar extends StatefulWidget {
  @override
  _BottomCustomNavigationBarState createState() =>
      _BottomCustomNavigationBarState();
}

class _BottomCustomNavigationBarState extends State<BottomCustomNavigationBar> {
  int currentIndex = 0;

  /// Set a type current number a layout class
  Widget callPage(int current) {
    switch (current) {
      case 0:
        return new B1HomeScreen();
      case 1:
        return new BrandLayout();
      case 2:
        return new B3CartScreen();
      case 3:
        return new B4Profile();
        break;
      default:
        return B1HomeScreen();
    }
  }

  /// Build BottomNavigationBar Widget
  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    return EasyLocalizationProvider(
      data: data,
      child: Scaffold(
        body: callPage(currentIndex),
        bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
                canvasColor: Colors.white,
                textTheme: Theme.of(context).textTheme.copyWith(
                    caption:
                        TextStyle(color: Colors.black26.withOpacity(0.15)))),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: currentIndex,
              fixedColor: Color(0xFF6991C7),
              onTap: (value) {
                currentIndex = value;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: 23.0,
                  ),
                  label: AppLocalizations.of(context).tr('home'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shop),
                  label: AppLocalizations.of(context).tr('brand'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: AppLocalizations.of(context).tr('cart'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    size: 24.0,
                  ),
                  label: AppLocalizations.of(context).tr('account'),
                ),
              ],
            )),
      ),
    );
  }
}
