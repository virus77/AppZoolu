import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:treva_shop_flutter/Library/Language_Library/lib/easy_localization.dart';
import 'package:treva_shop_flutter/model/zoolu_colors.dart';
import 'package:treva_shop_flutter/screen/b3_cart_screen/cart_ui_component/cart.dart';
import 'package:treva_shop_flutter/screen/b3_cart_screen/cart_ui_component/delivery.dart';
import 'package:treva_shop_flutter/screen/b3_cart_screen/cart_ui_component/payment.dart';
import 'package:treva_shop_flutter/shared/dropdown_custom_button.dart';
import 'package:treva_shop_flutter/shared/text_form_custom_field.dart';

class CheckoutData extends StatefulWidget {
  @override
  _CheckoutDataState createState() => _CheckoutDataState();
}

class _CheckoutDataState extends State<CheckoutData> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
                child: Row(
                  children: [
                    Icon(Icons.location_on),
                    SizedBox(
                      width: 20,
                    ),
                    RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                          text: 'Dirección de entrega\n',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                          ),
                          children: [
                            TextSpan(
                              text: 'Av. Prol. Vasco...',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                    )
                  ],
                ),
              ),
              FlatButton(
                  onPressed: () {
                    _changeDelivery(context);
                  },
                  child: Text(
                    'Cambiar',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: ZooluColors.PrimaryColor),
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
                child: Row(
                  children: [
                    Icon(Icons.directions_car),
                    SizedBox(
                      width: 20,
                    ),
                    RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                          text: 'Ford plateado\n',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                          ),
                          children: [
                            TextSpan(
                              text: '424ZMS',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
              FlatButton(
                  onPressed: () {
                    _changeCar(context);
                  },
                  child: Text(
                    'Cambiar',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: ZooluColors.PrimaryColor),
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
                child: Text('Entrega estimada',
                    style: TextStyle(
                        fontSize: 18,
                        color: ZooluColors.PrimaryColor,
                        fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(25, 25, 20, 25),
                child: Text(
                  '23-38 mins',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
                child: Row(
                  children: [
                    Icon(Icons.shopping_cart),
                    SizedBox(
                      width: 20,
                    ),
                    RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                          text: 'Sucursal\n',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                          ),
                          children: [
                            TextSpan(
                              text: '10 Productos',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
              FlatButton(
                  onPressed: () {
                    _changeCart(context);
                  },
                  child: Text(
                    'Cambiar',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: ZooluColors.PrimaryColor),
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
                child: Row(
                  children: [
                    Icon(Icons.credit_card),
                    SizedBox(
                      width: 20,
                    ),
                    RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                          text: 'Mastercard\n',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                          ),
                          children: [
                            TextSpan(
                              text: '**** **** **** 1234',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
              FlatButton(
                  onPressed: () {
                    _changePaymentMethod(context);
                  },
                  child: Text(
                    'Cambiar',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: ZooluColors.PrimaryColor),
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
                child: Row(
                  children: [
                    Icon(Icons.monetization_on),
                    SizedBox(
                      width: 20,
                    ),
                    RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                          text: 'Propina\n',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                          ),
                          children: [
                            TextSpan(
                              text: '\$30.00',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
              FlatButton(
                  onPressed: () {
                    _changeTip(context);
                  },
                  child: Text(
                    'Cambiar',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: ZooluColors.PrimaryColor),
                  )),
            ],
          ),
        ],
      ),
    );
  }

  _changeDelivery(context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        builder: (builder) {
          return Delivery();
        });
  }

  _changeCart(context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        builder: (builder) {
          return Cart();
        });
  }

  _changePaymentMethod(context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        builder: (builder) {
          return Payment();
        });
  }

  _changeTip(context) {
    TextEditingController tipController =
        new TextEditingController(text: '\$30.00');
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        builder: (builder) {
          var data = EasyLocalizationProvider.of(context).data;
          return EasyLocalizationProvider(
              data: data,
              child: Scaffold(

                  /// Appbar
                  appBar: AppBar(
                    leading: InkWell(
                        onTap: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Icon(Icons.arrow_back)),
                    elevation: 0.0,
                    title: Text(
                      'Propina',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18.0,
                          color: Colors.black54,
                          fontFamily: "Gotik"),
                    ),
                    centerTitle: true,
                    backgroundColor: Colors.white,
                    iconTheme: IconThemeData(color: Color(0xFF6991C7)),
                  ),
                  body: SingleChildScrollView(
                      child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DropdownCustomButton(
                        controller: tipController,
                        icon: Icons.monetization_on,
                        items: [
                          '\$0.00',
                          '\$20.00',
                          '\$25.00',
                          '\$30.00',
                          'Otro'
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormCustomField(
                        icon: Icons.money,
                        labelText: 'Otro',
                        inputType: TextInputType.text,
                        controller: TextEditingController(),
                        password: false,
                      )
                    ],
                  ))));
        });
  }

  _changeCar(context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        builder: (builder) {
          var data = EasyLocalizationProvider.of(context).data;
          return EasyLocalizationProvider(
              data: data,
              child: Scaffold(

                  /// Appbar
                  appBar: AppBar(
                    leading: InkWell(
                        onTap: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Icon(Icons.arrow_back)),
                    elevation: 0.0,
                    title: Text(
                      'Vehículo',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18.0,
                          color: Colors.black54,
                          fontFamily: "Gotik"),
                    ),
                    centerTitle: true,
                    backgroundColor: Colors.white,
                    iconTheme: IconThemeData(color: Color(0xFF6991C7)),
                  ),
                  body: SingleChildScrollView(
                      child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormCustomField(
                        icon: Icons.directions_car,
                        labelText: 'Modelo',
                        inputType: TextInputType.text,
                        controller: TextEditingController(),
                        password: false,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormCustomField(
                        icon: Icons.money,
                        labelText: 'Matrícula',
                        inputType: TextInputType.text,
                        controller: TextEditingController(),
                        password: false,
                      )
                    ],
                  ))));
        });
  }
}
