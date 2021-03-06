import 'package:flutter/material.dart';
import 'package:whatsapp/models/chat_model.dart';
import 'package:whatsapp/pages/singleChatScreen.dart';

class ChatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView.builder(
        itemCount: dummyData.length,
        itemBuilder: (context, index) {
          return new Column(
            children: <Widget>[
              new Divider(height: 10),
              new GestureDetector(
                child: new ListTile(
                  leading: new CircleAvatar(
                    backgroundImage: new NetworkImage(dummyData[index].avatarUrl),
                    backgroundColor: Colors.green,
                  ),
                  title: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text(dummyData[index].name, style: new TextStyle(fontWeight: FontWeight.bold)),
                      new Text(dummyData[index].time, style: new TextStyle(fontSize: 14,color: Colors.grey))
                    ],
                  ),
                  subtitle: new Container(
                    padding: const EdgeInsets.only(top: 5),
                    child: new Text(dummyData[index].message, style: new TextStyle(color: Colors.grey)),
                  ),
                ),
                onTap: () => Navigator.push(
                    context,
                    new MaterialPageRoute(builder: (context) => new SingleChatScreen(data: dummyData[index]))
                ),
              )
            ],
          );
        }
    );
  }

}