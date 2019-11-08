import 'package:dooit/Arrangements/SizeModification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SankethHome extends StatefulWidget{
  @override
  _SankethHomeState createState() => _SankethHomeState();
}

class _SankethHomeState extends State<SankethHome> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // TODO: implement build
     return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
      appBar: AppBar(
        title: Text("Sanketh's Screens"),
      ),
      body: Container(
        child: Center(
         child:Text("Start coding here  ALL THE BEST!!!",style: TextStyle(color: Colors.green,fontSize: SizeConfig.blockSizeVertical *3.0,),),
        ) ),
    )
    );
  }
}