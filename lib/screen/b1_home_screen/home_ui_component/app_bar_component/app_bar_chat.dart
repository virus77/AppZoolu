import 'package:treva_shop_flutter/Library/Language_Library/lib/easy_localization_delegate.dart';
import 'package:treva_shop_flutter/Library/Language_Library/lib/easy_localization_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:treva_shop_flutter/screen/b1_home_screen/home_ui_component/app_bar_component/app_bar_chat_msg.dart';
import 'package:treva_shop_flutter/screen/b1_home_screen/home_ui_component/app_bar_component/app_bar_chat_no_message.dart';

class ChatItem extends StatefulWidget {
  @override
  _ChatItemState createState() => _ChatItemState();
}

/// defaultUserName use in a Chat name
const String defaultUserName = "Alisa Hearth";

class _ChatItemState extends State<ChatItem> with TickerProviderStateMixin {
  final List<AppBarMsg> _messages = <AppBarMsg>[];
  final TextEditingController _textController = new TextEditingController();
  bool _isWriting = false;

  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    return EasyLocalizationProvider(
      data: data,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.4,
          title: Text(
            AppLocalizations.of(context).tr('chatting'),
            style: TextStyle(
                fontFamily: "Gotik", fontSize: 18.0, color: Colors.black54),
          ),
          iconTheme: IconThemeData(color: Color(0xFF6991C7)),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),

        /// body in chat like a list in a message
        body: Container(
          color: Colors.white,
          child: new Column(children: <Widget>[
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
                  : AppBarNoMessage(),
            ),

            /// Line
            new Divider(height: 1.5),
            new Container(
              child: _buildComposer(),
              decoration: new BoxDecoration(
                  color: Theme.of(context).cardColor,
                  boxShadow: [
                    BoxShadow(blurRadius: 1.0, color: Colors.black12)
                  ]),
            ),
          ]),
        ),
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
              Icon(
                Icons.add,
                color: Colors.blueAccent,
                size: 27.0,
              ),
              new Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
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
                                AppLocalizations.of(context).tr('hintChat'),
                            hintStyle: TextStyle(
                                fontFamily: "Sans",
                                fontSize: 16.0,
                                color: Colors.black26)),
                      ),
                    ),
                  ),
                ),
              ),
              new Container(
                  margin: new EdgeInsets.symmetric(horizontal: 3.0),
                  child: Theme.of(context).platform == TargetPlatform.iOS
                      ? new CupertinoButton(
                          child: new Text("Submit"),
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
    AppBarMsg msg = new AppBarMsg(
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
    for (AppBarMsg msg in _messages) {
      msg.animationController.dispose();
    }
    super.dispose();
  }
}
