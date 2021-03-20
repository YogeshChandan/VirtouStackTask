import 'dart:async';

import 'package:flutter/material.dart';
import 'package:task/FacebookLogin.dart';
import 'package:task/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VirtouStack Task',
      theme: ThemeData(
        primaryColor: Colors.grey[700],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "asset/image.gif",
              height: 150.0,
              width: 150.0,
            ),
            Padding(padding: const EdgeInsets.only(top: 10,bottom: 5),
            child: Text(
              "Dog's Path",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 24),
            )),
            Padding(padding: const EdgeInsets.only(top: 5,bottom: 5),
                child: Text(
                  "by",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14),
                )),
            Padding(padding: const EdgeInsets.only(top: 5,bottom: 10),
                child: Text(
                  "VirtouStack Softwares Pvt. Ltd.",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),
                )),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => FacebookScreen())));
  }
}
