import 'package:flutter/material.dart';

class CreateChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Directionality(
        textDirection: TextDirection.rtl,
        child: new Scaffold(
          appBar: new AppBar(
            title: new Text('ایجاد چت'),
          ),
          body: new Center(
            child: new Text('ایجاد چت'),
          ),
        )
    );
  }

}