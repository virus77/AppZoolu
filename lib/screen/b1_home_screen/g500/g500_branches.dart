import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:treva_shop_flutter/Library/Language_Library/lib/easy_localization.dart';
// import 'package:google_map_location_picker/google_map_location_picker.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:treva_shop_flutter/model/brand.dart';
import 'package:treva_shop_flutter/model/items.dart';
import 'package:treva_shop_flutter/screen/b2_brand_screen/brand/brand_detail.dart';
import 'package:treva_shop_flutter/screen/b3_cart_screen/b3_cart/b3_cart_screen.dart';

class G500Branches extends StatefulWidget {
  @override
  State createState() => _G500Branches();
}

var items = List<ListItem>.generate(
  10,
      (i) =>
  i % 6 == 0
      ? (i % 12 == 0 ? HeadingItem("Cercanas") : HeadingItem("Fuera del rango"))
      : MessageItem("Sucursal", "Av. Prol. Vasco de Quiroga 4800"),
);

class _G500Branches extends State<G500Branches> {
  // Completer<GoogleMapController> _controller = Completer();
  //
  // LatLng initalLng = LatLng(19.28114702894692, -99.6550758167456);

  // static final CameraPosition _initialCameraPosition = CameraPosition(
  //     target: LatLng(19.28114702894692, -99.6550758167456),
  //     zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("G500")
      ),
      body: ListView.builder(
        // Let the ListView know how many items it needs to build.
        itemCount: items.length,
        // Provide a builder function. This is where the magic happens.
        // Convert each item into a widget based on the type of item it is.
        itemBuilder: (context, index) {
          final item = items[index];

          Brand brand = new Brand(
              name: "Sucursal",
              id: "1",
              img: "assets/img/gasolina.jpg",
              desc:
              "Av. Prol. Vasco de Quiroga 4800",
              item: Items(
                  itemImg: "assets/img/g500.jpg",
                  itemId: "1",
                  itemName: "Producto",
                  itemPrice: "\$ 100",
                  itemRatting: "4.5",
                  itemSale: "")
          );

          return GestureDetector(
            child: ListTile(
              title: item.buildTitle(context),
              subtitle: item.buildSubtitle(context),
            ),
            onTap: () => {
            Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => new BrandDetail(brand)))
          },);
        },
      ),
    );
  }
}

/// The base class for the different types of items the list can contain.
abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildSubtitle(BuildContext context);
}

/// A ListItem that contains data to display a heading.
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      style: Theme
          .of(context)
          .textTheme
          .headline5,
    );
  }

  Widget buildSubtitle(BuildContext context) => null;
}

/// A ListItem that contains data to display a message.
class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  Widget buildTitle(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        child: Row(
          children: [
            Icon(
                Icons.location_on
            ),
            SizedBox(width: 20,),
            Text(sender,
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),),
          ],
        ),
      ),
    Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black87,
        ),
        shape: BoxShape.circle,
      ),
    ),
  ],);

  Widget buildSubtitle(BuildContext context) => Row(children: [
    SizedBox(width: 45,),
    Text(body)
  ],);
}
