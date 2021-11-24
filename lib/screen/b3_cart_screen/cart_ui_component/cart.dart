import 'package:treva_shop_flutter/Library/Language_Library/lib/easy_localization_delegate.dart';
import 'package:treva_shop_flutter/Library/Language_Library/lib/easy_localization_provider.dart';
import 'package:flutter/material.dart';
import 'package:treva_shop_flutter/model/cart_item.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:treva_shop_flutter/screen/b3_cart_screen/b3_cart/b3_noitem_cart.dart';
import 'package:treva_shop_flutter/screen/b3_cart_screen/cart_ui_component/checkout.dart';
import 'package:treva_shop_flutter/screen/b3_cart_screen/cart_ui_component/delivery.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  final List<CartItem> items = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      items.add(
        CartItem(
          img: "assets/imgItem/flashsale3.jpg",
          id: 1,
          title: "Samsung Galaxy Note 9 8GB RAM",
          desc: "Internal 1 TB",
          price: "\$ 950",
        ),
      );
    });
  }

  /// Declare price and value for chart
  int value = 1;
  int pay = 950;

  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    return EasyLocalizationProvider(
      data: data,
      child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Color(0xFF6991C7)),
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text(
              AppLocalizations.of(context).tr('cart'),
              style: TextStyle(
                  fontFamily: "Gotik",
                  fontSize: 18.0,
                  color: Colors.black54,
                  fontWeight: FontWeight.w700),
            ),
            elevation: 0.0,
          ),

          ///
          ///
          /// Checking item value of cart
          ///
          ///
          body: items.length > 0
              ? ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, position) {
                    ///
                    /// Widget for list view slide delete
                    ///
                    return Slidable(
                      delegate: new SlidableDrawerDelegate(),
                      actionExtentRatio: 0.25,
                      actions: <Widget>[
                        new IconSlideAction(
                          caption: AppLocalizations.of(context)
                              .tr('cartArchiveText'),
                          color: Colors.blue,
                          icon: Icons.archive,
                          onTap: () {
                            ///
                            /// SnackBar show if cart Archive
                            ///
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(AppLocalizations.of(context)
                                  .tr('cartArchice')),
                              duration: Duration(seconds: 2),
                              backgroundColor: Colors.blue,
                            ));
                          },
                        ),
                      ],
                      secondaryActions: <Widget>[
                        new IconSlideAction(
                          key: Key(items[position].id.toString()),
                          caption:
                              AppLocalizations.of(context).tr('cartDelete'),
                          color: Colors.red,
                          icon: Icons.delete,
                          onTap: () {
                            setState(() {
                              items.removeAt(position);
                            });

                            ///
                            /// SnackBar show if cart delet
                            ///
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(AppLocalizations.of(context)
                                  .tr('cartDeleted')),
                              duration: Duration(seconds: 2),
                              backgroundColor: Colors.redAccent,
                            ));
                          },
                        ),
                      ],
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 1.0, left: 13.0, right: 13.0),

                        /// Background Constructor for card
                        child: Container(
                          height: 220.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12.withOpacity(0.1),
                                blurRadius: 3.5,
                                spreadRadius: 0.4,
                              )
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                      padding: EdgeInsets.all(10.0),

                                      /// Image item
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.1),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black12
                                                        .withOpacity(0.1),
                                                    blurRadius: 0.5,
                                                    spreadRadius: 0.1)
                                              ]),
                                          child: Image.asset(
                                            '${items[position].img}',
                                            height: 130.0,
                                            width: 120.0,
                                            fit: BoxFit.cover,
                                          ))),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25.0, left: 10.0, right: 5.0),
                                      child: Column(
                                        /// Text Information Item
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            '${items[position].title}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontFamily: "Sans",
                                              color: Colors.black87,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(top: 10.0)),
                                          Text(
                                            '${items[position].desc}',
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12.0,
                                            ),
                                          ),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(top: 10.0)),
                                          Text('${items[position].price}'),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 18.0, left: 0.0),
                                            child: Container(
                                              width: 112.0,
                                              decoration: BoxDecoration(
                                                  color: Colors.white70,
                                                  border: Border.all(
                                                      color: Colors.black12
                                                          .withOpacity(0.1))),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: <Widget>[
                                                  /// Decrease of value item
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        value = value - 1;
                                                        pay = 950 * value;
                                                      });
                                                    },
                                                    child: Container(
                                                      height: 30.0,
                                                      width: 30.0,
                                                      decoration: BoxDecoration(
                                                          border: Border(
                                                              right: BorderSide(
                                                                  color: Colors
                                                                      .black12
                                                                      .withOpacity(
                                                                          0.1)))),
                                                      child: Center(
                                                          child: Text("-")),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 18.0),
                                                    child:
                                                        Text(value.toString()),
                                                  ),

                                                  /// Increasing value of item
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        value = value + 1;
                                                        pay = 950 * value;
                                                      });
                                                    },
                                                    child: Container(
                                                      height: 30.0,
                                                      width: 28.0,
                                                      decoration: BoxDecoration(
                                                          border: Border(
                                                              left: BorderSide(
                                                                  color: Colors
                                                                      .black12
                                                                      .withOpacity(
                                                                          0.1)))),
                                                      child: Center(
                                                          child: Text("+")),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(padding: EdgeInsets.only(top: 8.0)),
                              Divider(
                                height: 2.0,
                                color: Colors.black12,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 9.0, left: 10.0, right: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),

                                      /// Total price of item buy
                                      child: Text(
                                        AppLocalizations.of(context)
                                                .tr('cartTotal') +
                                            "\$" +
                                            pay.toString(),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15.5,
                                            fontFamily: "Sans"),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  scrollDirection: Axis.vertical,
                )
              : NoItemCart()),
    );
  }
}