// import 'dart:async';

import 'package:treva_shop_flutter/Library/Language_Library/lib/easy_localization_delegate.dart';
import 'package:treva_shop_flutter/Library/Language_Library/lib/easy_localization_provider.dart';
import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';
import 'package:treva_shop_flutter/model/brand.dart';
import 'package:treva_shop_flutter/screen/b1_home_screen/home_ui_component/app_bar_component/app_bar_search.dart';

import 'brand_detail.dart';

bool loadImage = true;

class BrandLayout extends StatefulWidget {
  @override
  _BrandLayoutState createState() => _BrandLayoutState();
}

class _BrandLayoutState extends State<BrandLayout> {
  @override
  Widget build(BuildContext context) {
    /// Component appbar
    var _appbar = AppBar(
      backgroundColor: Color(0xFFFFFFFF),
      elevation: 0.0,
      title: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Text(
          AppLocalizations.of(context).tr('categoryBrand'),
          style: TextStyle(
              fontFamily: "Gotik",
              fontSize: 20.0,
              color: Colors.black54,
              fontWeight: FontWeight.w700),
        ),
      ),
      actions: <Widget>[
        InkWell(
          onTap: () {
            Navigator.of(context).push(PageRouteBuilder(
                pageBuilder: (_, __, ___) => new AppBarSearch()));
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20.0),
            // child: Icon(
            //   Icons.search,
            //   size: 27.0,
            //   color: Colors.black54,
            // ),
          ),
        )
      ],
    );

    var data = EasyLocalizationProvider.of(context).data;

    return EasyLocalizationProvider(
      data: data,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Scaffold(
          /// Calling variable appbar
          appBar: _appbar,
          body: _imageLoaded(context),
        ),
      ),
    );
  }
}

///
///
/// Calling ImageLoaded animation for set layout
///
///
Widget _imageLoaded(BuildContext context) {
  return Container(
    color: Colors.white,
    child: CustomScrollView(
      /// Create List Menu
      slivers: <Widget>[
        SliverPadding(
          padding: EdgeInsets.only(top: 0.0),
          sliver: SliverFixedExtentList(
              itemExtent: 145.0,
              delegate: SliverChildBuilderDelegate(

                  /// Calling itemCard Class for constructor card
                  (context, index) => ItemCard(brandData[index]),
                  childCount: brandData.length)),
        ),
      ],
    ),
  );
}

/// Constructor for itemCard for List Menu
class ItemCard extends StatefulWidget {
  /// Declaration and Get data from brand.dart
  final Brand brand;
  ItemCard(this.brand);

  _ItemCardState createState() => _ItemCardState(brand);
}

class _ItemCardState extends State<ItemCard> {
  final Brand brand;

  _ItemCardState(this.brand);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushAndRemoveUntil(
              PageRouteBuilder(
                  pageBuilder: (_, __, ___) => new BrandDetail(brand),
                  transitionDuration: Duration(milliseconds: 600),
                  transitionsBuilder:
                      (_, Animation<double> animation, __, Widget child) {
                    return Opacity(
                      opacity: animation.value,
                      child: child,
                    );
                  }),
              (Route<dynamic> route) => true);
        },
        child: Container(
          height: 130.0,
          width: 400.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          child: Hero(
            tag: 'hero-tag-${brand.id}',
            transitionOnUserGestures: true,
            child: Material(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  image: DecorationImage(
                      image: AssetImage(brand.img), fit: BoxFit.cover),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFABABAB).withOpacity(0.3),
                      blurRadius: 1.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    color: Colors.black12.withOpacity(0.1),
                  ),
                  child: Center(
                    child: Text(
                      brand.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Berlin",
                        fontSize: 35.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
