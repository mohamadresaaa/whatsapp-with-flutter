import 'package:flutter/material.dart';
import 'package:whatsapp/pages/cameraPage.dart';
import 'package:whatsapp/pages/chatsPage.dart';
import 'package:whatsapp/pages/statusPage.dart';
import 'package:whatsapp/pages/callsPage.dart';
import 'package:whatsapp/pages/createChatScreen.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomePageState();

}

class HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  TabController tabController;

  Map<String, SliverAppBar> appBarList;

  String currentAppBar = 'mainAppBar';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    tabController = new TabController(initialIndex: 1, length: 4, vsync: this);

    SliverAppBar mainAppBar = new SliverAppBar(
      elevation: 5,
      pinned: true,
      floating: true,
      title: new Text('واتساپ'),
      actions: <Widget>[
        new GestureDetector(
          child: new Icon(Icons.search),
          onTap: () => setState(() => currentAppBar = 'searchAppBar'),
        ),
        new Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: new PopupMenuButton<String>(
              onSelected: (String selected) => print(selected),
              itemBuilder: (BuildContext context) {
                return [
                  new PopupMenuItem(
                      value: 'settings',
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          new Text('تنظیمات',style: new TextStyle(fontFamily: 'Vazir'))
                        ],
                      )
                  ),
                  new PopupMenuItem(
                      value: 'profile',
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          new Text('پروفایل',style: new TextStyle(fontFamily: 'Vazir'))
                        ],
                      )
                  )
                ];
              }
          ),
        )
      ],
      bottom: new TabBar(
          controller: tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.camera_alt)),
            new Tab(text: 'پیام ها'),
            new Tab(text: 'وضعیت'),
            new Tab(text: 'تماس ها')
          ]
      ),
    );

    SliverAppBar searchAppBar = new SliverAppBar(
      elevation: 5,
      pinned: true,
      leading: GestureDetector(
        child: new Padding(
            padding: const EdgeInsets.only(right: 12),
            child: new Icon(Icons.arrow_back,color: Colors.black),
        ),
        onTap: () => setState(() => currentAppBar = 'mainAppBar'),
      ),
      backgroundColor: Colors.white,
      title: new TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'search...'
        ),
      ),
    );

    appBarList = <String, SliverAppBar>{
      'mainAppBar': mainAppBar,
      'searchAppBar': searchAppBar
    };
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              appBarList[currentAppBar]
            ];
          },
          body: new TabBarView(
              controller: tabController,
              children: <Widget>[
                new CameraPage(),
                new ChatsPage(),
                new StatusPage(),
                new CallsPage()
              ]
            )
          ),
      floatingActionButton: new FloatingActionButton(
          backgroundColor: new Color(0xff25d366),
          child: new Icon(Icons.message,color: Colors.white),
          onPressed: () => Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => CreateChatScreen())
          )
      ),
    );
  }

}