import 'dart:async';

import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new SplashPageState();

}

class SplashPageState extends State<SplashPage> {

  timer () {
    Duration duration = new Duration(seconds: 5);
    return new Timer(duration, navigationPage);
  }

  navigationPage() {
    Navigator.of(context).pushNamed('/');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: new Color(0xff075e54),
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                width: 125,
                height: 125,
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: new AssetImage('assets/images/icon.png')
                  )
                ),
              ),
              new Text('واتساپ', style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white))
            ],
          ),
          new Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: new Align(
                alignment: Alignment.bottomCenter,
                child: new CircularProgressIndicator(),
              ),
          )
        ],
      ),
    );
  }

}
