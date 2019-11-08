// import 'package:./ASizeModification.dart';
import '../Arrangements/SizeModification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class JatinHome extends StatefulWidget{
  @override
  _JatinHomeState createState() => _JatinHomeState();
}

class _JatinHomeState extends State<JatinHome> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      home:Scaffold(
      appBar: AppBar(
        title: Text("Jatin's Screens"),
      ),
      body: Container(
        child: Center(
         child:Text("Start coding here  ALL THE BEST!!!",style: TextStyle(color: Colors.green,fontSize: SizeConfig.blockSizeVertical *3.0,),),
        )
        
      ),
      ),
    );
  }
}