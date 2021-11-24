import 'package:treva_shop_flutter/Library/Language_Library/lib/easy_localization_delegate.dart';
import 'package:treva_shop_flutter/Library/Language_Library/lib/easy_localization_provider.dart';
import 'package:flutter/material.dart';
import 'package:treva_shop_flutter/model/post.dart';
import 'package:treva_shop_flutter/screen/b4_profile_screen/account_ui_component/no_item_notifications.dart';

class AccountNotification extends StatefulWidget {
  @override
  _AccountNotificationState createState() => _AccountNotificationState();
}

class _AccountNotificationState extends State<AccountNotification> {
  final List<Post> items = [];
  @override
  void initState() {
    super.initState();
    setState(() {
      items.add(
        Post(
            image: "assets/img/Logo.png",
            id: 1,
            title: "Zoolu",
            desc: "Gracias por descargar la aplicación"),
      );
      items.add(
        Post(
            image: "assets/img/Logo.png",
            id: 2,
            title: "Zoolu",
            desc: "Tu producto se ha entregado"),
      );
      items.add(
        Post(
            image: "assets/img/Logo.png",
            id: 3,
            title: "Zoolu",
            desc: "Artículo pendiente de entrega"),
      );
      items.add(
        Post(
            image: "assets/img/Logo.png",
            id: 4,
            title: "Zoolu",
            desc: "Buenos días!"),
      );
    });
  }

  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    // MediaQueryData mediaQuery = MediaQuery.of(context);

    return EasyLocalizationProvider(
      data: data,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context).tr('notification'),
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
          body: items.length > 0
              ? ListView.builder(
                  itemCount: items.length,
                  padding: const EdgeInsets.all(5.0),
                  itemBuilder: (context, position) {
                    return Dismissible(
                        key: Key(items[position].id.toString()),
                        onDismissed: (direction) {
                          setState(() {
                            items.removeAt(position);
                          });
                        },
                        background: Container(
                          color: Color(0xFF6991C7),
                        ),
                        child: Container(
                          height: 88.0,
                          child: Column(
                            children: <Widget>[
                              Divider(height: 5.0),
                              ListTile(
                                title: Text(
                                  '${items[position].title}',
                                  style: TextStyle(
                                      fontSize: 17.5,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600),
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 6.0),
                                  child: Container(
                                    width: 440.0,
                                    child: Text(
                                      '${items[position].desc}',
                                      style: new TextStyle(
                                          fontSize: 15.0,
                                          fontStyle: FontStyle.italic,
                                          color: Colors.black38),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                leading: Column(
                                  children: <Widget>[
                                    Container(
                                      height: 40.0,
                                      width: 40.0,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(60.0)),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  '${items[position].image}'),
                                              fit: BoxFit.cover)),
                                    )
                                  ],
                                ),
                                onTap: () =>
                                    _onTapItem(context, items[position]),
                              ),
                              Divider(height: 5.0),
                            ],
                          ),
                        ));
                  })
              : NoItemNotifications()),
    );
  }
}

void _onTapItem(BuildContext context, Post post) {
  ScaffoldMessenger.of(context).showSnackBar(new SnackBar(content: new Text(post.id.toString() + ' - ' + post.title)));
}


