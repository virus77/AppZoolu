import 'package:treva_shop_flutter/Library/Language_Library/lib/easy_localization_delegate.dart';
import 'package:treva_shop_flutter/Library/Language_Library/lib/easy_localization_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:treva_shop_flutter/screen/b2_brand_screen/brand/brand_chat_no_message.dart';
import 'package:treva_shop_flutter/model/brand.dart';
import 'package:treva_shop_flutter/screen/b2_brand_screen/brand/brand_chat_msg.dart';

class BrandChat extends StatefulWidget {
  /// Declare Brand class and Get Data Name for Appbar (brand.dart)
  final Brand brand;

  BrandChat(this.brand);

  @override
  _BrandChatState createState() => _BrandChatState(brand);
}

class _BrandChatState extends State<BrandChat> with TickerProviderStateMixin {
  final List<BrandChatMsg> _messages = <BrandChatMsg>[];
  final TextEditingController _textController = new TextEditingController();
  bool _isWriting = false;

  /// Declare Brand class
  final Brand brand;

  _BrandChatState(this.brand);

  @override
  Widget build(BuildContext ctx) {
    /// Declare default User Name
    // String defaultUserName = AppLocalizations.of(context).tr('name');
    var data = EasyLocalizationProvider.of(context).data;

    return EasyLocalizationProvider(
      data: data,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.4,
          title: Text(
            brand.name,
            style: TextStyle(
                fontFamily: "Gotik", fontSize: 18.0, color: Colors.black54),
          ),
          iconTheme: IconThemeData(color: Color(0xFF6991C7)),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: new Column(children: <Widget>[
          new Flexible(
            child: _messages.length > 0
                ? Container(
                    child: new ListView.builder(
                      itemBuilder: (_, int index) => _messages[index],
                      itemCount: _messages.length,
                      reverse: true,
                      padding: new EdgeInsets.all(10.0),
                    ),
                  )
                : BrandChatNoMessage(),
          ),
          new Divider(height: 1.5),
          new Container(
            child: _buildComposer(),
            decoration: new BoxDecoration(
                color: Theme.of(ctx).cardColor,
                boxShadow: [BoxShadow(blurRadius: 1.0, color: Colors.black12)]),
          ),
        ]),
      ),
    );
  }

  /// Component for typing text
  Widget _buildComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
          margin: const EdgeInsets.symmetric(horizontal: 9.0),
          child: new Row(
            children: <Widget>[
              new Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: new TextField(
                    controller: _textController,
                    onChanged: (String txt) {
                      setState(() {
                        _isWriting = txt.length > 0;
                      });
                    },
                    onSubmitted: _submitMsg,
                    decoration: new InputDecoration.collapsed(
                        hintText:
                            AppLocalizations.of(context).tr('hintMessage'),
                        hintStyle: TextStyle(
                            fontFamily: "Sans",
                            fontSize: 16.0,
                            color: Colors.black26)),
                  ),
                ),
              ),
              new Container(
                  margin: new EdgeInsets.symmetric(horizontal: 3.0),
                  child: Theme.of(context).platform == TargetPlatform.iOS
                      ? new CupertinoButton(
                          child: new Text(
                              AppLocalizations.of(context).tr('submit')),
                          onPressed: _isWriting
                              ? () => _submitMsg(_textController.text)
                              : null)
                      : new IconButton(
                          icon: new Icon(Icons.message),
                          onPressed: _isWriting
                              ? () => _submitMsg(_textController.text)
                              : null,
                        )),
            ],
          ),
          decoration: Theme.of(context).platform == TargetPlatform.iOS
              ? new BoxDecoration(
                  border: new Border(top: new BorderSide(color: Colors.brown)))
              : null),
    );
  }

  void _submitMsg(String txt) {
    _textController.clear();
    setState(() {
      _isWriting = false;
    });
    BrandChatMsg msg = new BrandChatMsg(
      txt: txt,
      animationController: new AnimationController(
          vsync: this, duration: new Duration(milliseconds: 800)),
    );
    setState(() {
      _messages.insert(0, msg);
    });
    msg.animationController.forward();
  }

  @override
  void dispose() {
    for (BrandChatMsg msg in _messages) {
      msg.animationController.dispose();
    }
    super.dispose();
  }
}
