import 'package:dooit/Arrangements/SizeModification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LaxmaHome extends StatefulWidget{
  @override
  _LaxmaHomeState createState() => _LaxmaHomeState();
}

class _LaxmaHomeState extends State<LaxmaHome> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      appBar: AppBar(
        title: Text("Laxma's Screens"),
      ),
      body: Container(
        child: Center(
         child:Text("Start coding here  ALL THE BEST!!!",style: TextStyle(color: Colors.green,fontSize: SizeConfig.blockSizeVertical *3.0,),),
        ) ),
    ),
    );
  }
}