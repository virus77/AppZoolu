import 'package:carousel_slider/carousel_slider.dart';
import 'package:treva_shop_flutter/Library/Language_Library/lib/easy_localization_delegate.dart';
import 'package:treva_shop_flutter/Library/Language_Library/lib/easy_localization_provider.dart';
import 'package:flutter/material.dart';
import 'package:treva_shop_flutter/model/credit_card_custom_model.dart';
import 'package:treva_shop_flutter/screen/b4_profile_screen/account_ui_component/add_credit_card.dart';
import 'package:treva_shop_flutter/screen/b4_profile_screen/account_ui_component/credit_card_info.dart';
import 'package:treva_shop_flutter/screen/b4_profile_screen/account_ui_component/credit_card_item.dart';
import 'package:treva_shop_flutter/screen/b4_profile_screen/account_ui_component/transaction_detail.dart';

/// Custom Text Header
var _txtCustomHead = TextStyle(
  color: Colors.black54,
  fontSize: 17.0,
  fontWeight: FontWeight.w600,
  fontFamily: "Gotik",
);

var creditCardItems = [
  CreditCardItem(
      model: CreditCardCustomModel(
    cardNumber: 'XXXX XXXX XXXX 9510',
    cardName: 'Lorem ipsum dolor',
    cardCvv: 'XXX',
    color: 1,
    cardExp: '12/21',
  )),
  CreditCardItem(
      model: CreditCardCustomModel(
    cardNumber: 'XXXX XXXX XXXX 5263',
    cardName: 'Lorem ipsum dolor',
    cardCvv: 'XXX',
    color: 2,
    cardExp: '12/21',
  )),
  CreditCardItem(
      model: CreditCardCustomModel(
    cardNumber: 'XXXX XXXX XXXX 7821',
    cardName: 'Lorem ipsum dolor',
    cardCvv: 'XXX',
    color: 3,
    cardExp: '12/21',
  ))
];

class CreditCardSetting extends StatefulWidget {
  @override
  _CreditCardSettingState createState() => _CreditCardSettingState();
}

class _CreditCardSettingState extends State<CreditCardSetting> {
  CreditCardItem actualCardItem = creditCardItems.elementAt(0);

  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;

    return EasyLocalizationProvider(
      data: data,
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.of(context).pop(false);
              },
              child: Icon(Icons.arrow_back)),
          elevation: 0.0,
          title: Text(
            AppLocalizations.of(context).tr('payment'),
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18.0,
                color: Colors.black54,
                fontFamily: "Gotik"),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Color(0xFF6991C7)),
          actions: [
            new FlatButton(
              child: Text("Agregar"),
              onPressed: () {
                Navigator.of(context).push(new MaterialPageRoute<Null>(
                    builder: (BuildContext context) {
                      return AddCreditCard();
                    },
                    fullscreenDialog: true
                ));
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CarouselSlider(
                  options: CarouselOptions(
                      height: 200.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          this.actualCardItem = creditCardItems[index];
                        });
                      }),
                  items: creditCardItems,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 30.0, left: 15.0, right: 20.0),
                  child: Text(
                    AppLocalizations.of(context).tr('cardInformation'),
                    style: _txtCustomHead,
                  ),
                ),
                CreditCardInfo(model: actualCardItem.model),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 30.0, left: 15.0, bottom: 10.0, right: 20.0),
                  child: Text(
                    AppLocalizations.of(context).tr('history'),
                    style: _txtCustomHead.copyWith(fontSize: 16.0),
                  ),
                ),
                TransactionsDetail()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Constructor for Card
