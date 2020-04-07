import 'package:flutter/material.dart';
import 'package:whatsapp/pages/homePage.dart';
import 'package:whatsapp/pages/splashPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp',
      theme: ThemeData(
        fontFamily: 'Vazir',
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        //primarySwatch: new Color(0xff075e54),
        primaryColor: new Color(0xff075e54)
      ),
      routes: {
        '/': (context) => new Directionality(textDirection: TextDirection.rtl, child: new HomePage()),
        '/splashPage': (context) => new SplashPage()
      },
      initialRoute: '/splashPage'
    );
  }
}