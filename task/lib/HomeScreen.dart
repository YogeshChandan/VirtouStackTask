

import 'package:flutter/material.dart';
import 'package:task/PathsListView.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => HomeScreenDesign();
}

class HomeScreenDesign extends State<HomeScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Dog's Path",
          style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: PathsListView(),
      ),
    );
  }
}
