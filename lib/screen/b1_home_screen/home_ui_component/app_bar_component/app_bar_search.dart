import 'package:treva_shop_flutter/Library/Language_Library/lib/easy_localization_delegate.dart';
import 'package:treva_shop_flutter/Library/Language_Library/lib/easy_localization_provider.dart';
import 'package:flutter/material.dart';

class AppBarSearch extends StatefulWidget {
  @override
  _AppBarSearchState createState() => _AppBarSearchState();
}

class _AppBarSearchState extends State<AppBarSearch> {
  @override
  Widget build(BuildContext context) {
    /// Sentence Text header "Hello i am Zoolu.........."
    // var _textHello = Padding(
    //   padding: const EdgeInsets.only(right: 50.0, left: 20.0),
    //   child: Text(
    //     AppLocalizations.of(context).tr('searchHello'),
    //     style: TextStyle(
    //         letterSpacing: 0.1,
    //         fontWeight: FontWeight.w600,
    //         fontSize: 27.0,
    //         color: Colors.black54,
    //         fontFamily: "Gotik"),
    //   ),
    // );

    /// Item TextFromField Search
    var _search = Padding(
      padding: const EdgeInsets.only(top: 35.0, right: 20.0, left: 20.0),
      child: Container(
        height: 50.0,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 15.0,
                  spreadRadius: 0.0)
            ]),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 10.0),
            child: Theme(
              data: ThemeData(hintColor: Colors.transparent),
              child: TextFormField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.search,
                      color: Color(0xFF6991C7),
                      size: 28.0,
                    ),
                    hintText: AppLocalizations.of(context).tr('findYouWant'),
                    hintStyle: TextStyle(
                        color: Colors.black54,
                        fontFamily: "Gotik",
                        fontWeight: FontWeight.w400)),
              ),
            ),
          ),
        ),
      ),
    );

    /// Item Favorite Item with Card item
    // var _favorite = Padding(
    //   padding: const EdgeInsets.only(top: 20.0),
    //   child: Container(
    //     height: 250.0,
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: <Widget>[
    //         Padding(
    //           padding: const EdgeInsets.only(left: 20.0,right: 20.0),
    //           child: Text(
    //     AppLocalizations.of(context).tr('favorite'),
    //             style: TextStyle(fontFamily: "Gotik", color: Colors.black26),
    //           ),
    //         ),
    //         Expanded(
    //           child: ListView(
    //             padding: EdgeInsets.only(top: 20.0, bottom: 2.0),
    //             scrollDirection: Axis.horizontal,
    //             children: <Widget>[
    //               /// Get class FavoriteItem
    //               Padding(padding: EdgeInsets.only(left: 20.0)),
    //               FavoriteItem(
    //                 image: "assets/imgItem/shoes1.jpg",
    //                 title: AppLocalizations.of(context).tr('productTitle1'),
    //                 salary: "\$ 10",
    //                 rating: "4.8",
    //                 sale: AppLocalizations.of(context).tr('productSale1'),
    //               ),
    //               Padding(padding: EdgeInsets.only(left: 20.0)),
    //               FavoriteItem(
    //                 image: "assets/imgItem/acesoris1.jpg",
    //                 title: AppLocalizations.of(context).tr('productTitle2'),
    //                 salary: "\$ 200",
    //                 rating: "4.2",
    //                 sale: AppLocalizations.of(context).tr('productSale2'),
    //               ),
    //               Padding(padding: EdgeInsets.only(left: 20.0)),
    //               FavoriteItem(
    //                 image: "assets/imgItem/kids1.jpg",
    //                 title: AppLocalizations.of(context).tr('productTitle3'),
    //                 salary: "\$ 3",
    //                 rating: "4.8",
    //                 sale: AppLocalizations.of(context).tr('productSale3'),
    //               ),
    //               Padding(padding: EdgeInsets.only(right: 10.0)),
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );

    /// Popular Keyword Item
    // var _sugestedText = Container(
    //   height: 145.0,
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: <Widget>[
    //       Padding(
    //         padding: const EdgeInsets.only(left: 20.0,top: 20.0,right: 20.0),
    //         child: Text(
    //           AppLocalizations.of(context).tr('popularity'),
    //           style: TextStyle(fontFamily: "Gotik", color: Colors.black26),
    //         ),
    //       ),
    //       Padding(padding: EdgeInsets.only(top: 20.0)),
    //       Expanded(
    //           child: ListView(
    //         scrollDirection: Axis.horizontal,
    //         children: <Widget>[
    //           Padding(padding: EdgeInsets.only(left: 20.0)),
    //           KeywordItem(
    //             title: AppLocalizations.of(context).tr('searchTitle1'),
    //             title2: AppLocalizations.of(context).tr('searchTitle2'),
    //           ),
    //           KeywordItem(
    //          title: AppLocalizations.of(context).tr('searchTitle3'),
    //             title2: AppLocalizations.of(context).tr('searchTitle4'),
    //           ),
    //           KeywordItem(
    //             title: AppLocalizations.of(context).tr('searchTitle5'),
    //             title2: AppLocalizations.of(context).tr('searchTitle6'),
    //           ),
    //           KeywordItem(
    //            title: AppLocalizations.of(context).tr('searchTitle7'),
    //             title2: AppLocalizations.of(context).tr('searchTitle8'),
    //           ),
    //         ],
    //       ))
    //     ],
    //   ),
    // );

    var data = EasyLocalizationProvider.of(context).data;
    return EasyLocalizationProvider(
      data: data,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          title: Text(
            AppLocalizations.of(context).tr('search'),
            style: TextStyle(fontFamily: "Sofia"),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  /// Caliing a variable
                  // _textHello,
                  _search,
                  // _sugestedText,
                  // _favorite,
                  Padding(padding: EdgeInsets.only(bottom: 30.0, top: 2.0))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Popular Keyword Item class
class KeywordItem extends StatelessWidget {
  final String title, title2;

  KeywordItem({this.title, this.title2});

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 4.0, left: 3.0),
          child: Container(
            height: 29.5,
            width: 90.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4.5,
                  spreadRadius: 1.0,
                )
              ],
            ),
            child: Center(
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black54, fontFamily: "Sans"),
              ),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 15.0)),
        Container(
          height: 29.5,
          width: 90.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4.5,
                spreadRadius: 1.0,
              )
            ],
          ),
          child: Center(
            child: Text(
              title2,
              style: TextStyle(
                color: Colors.black54,
                fontFamily: "Sans",
              ),
            ),
          ),
        ),
      ],
    );
  }
}
