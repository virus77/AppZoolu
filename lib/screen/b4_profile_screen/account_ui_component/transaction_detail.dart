import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:treva_shop_flutter/Library/Language_Library/lib/easy_localization_delegate.dart';
import 'package:treva_shop_flutter/screen/b4_profile_screen/account_ui_component/data_transaction.dart';

class TransactionsDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MediaQueryData mediaQuery = MediaQuery.of(context);

    return Padding(
      padding: const EdgeInsets.only(
          top: 10.0, left: 15.0, right: 15.0, bottom: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4.5,
              spreadRadius: 1.0,
            )
          ],
        ),
        child: Column(
          children: <Widget>[
            DataTransaction(
              date: AppLocalizations.of(context).tr('datePayment1'),
              item: AppLocalizations.of(context).tr('itemPayment1'),
              price: "\$ 50",
            ),
            DataTransaction(
              date: AppLocalizations.of(context).tr('datePayment2'),
              item: AppLocalizations.of(context).tr('itemPayment2'),
              price: "\$ 1000",
            ),
            DataTransaction(
              date: AppLocalizations.of(context).tr('datePayment3'),
              item: AppLocalizations.of(context).tr('itemPayment3'),
              price: "\$ 2500",
            ),
            DataTransaction(
              date: AppLocalizations.of(context).tr('datePayment4'),
              item: AppLocalizations.of(context).tr('itemPayment4'),
              price: "\$ 50",
            ),
            DataTransaction(
              date: AppLocalizations.of(context).tr('datePayment5'),
              item: AppLocalizations.of(context).tr('itemPayment5'),
              price: "\$ 50",
            ),
          ],
        ),
      ),
    );
  }
}
