import 'package:flutter/material.dart';
import 'package:whatsapp/models/chat_model.dart';

class SingleChatScreen extends StatelessWidget {

  final ChatModel data;

  SingleChatScreen({ @required this.data });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Directionality(
        textDirection: TextDirection.rtl,
        child: new Scaffold(
          appBar: new AppBar(
            title: new Row(
              children: <Widget>[
                new CircleAvatar(
                  backgroundImage: new NetworkImage(data.avatarUrl),
                ),
                new Text(data.name)
              ],
            ),
          ),
          body: new Center(
            child: new Text(data.message),
          ),
        )
    );
  }

}