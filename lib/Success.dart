import 'package:dooit/Arrangements/SizeModification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Success extends StatefulWidget{
  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // TODO: implement build
     return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
      appBar: AppBar(
        title: Text("Success's Screens"),
      ),
      body: Container(
        child: Center(
        //  child:Text("You are successssfully Logged in",style: TextStyle(color: Colors.green,fontSize: SizeConfig.blockSizeVertical *3.0,),),
          child: RaisedButton(
            child: Text("click"),
            onPressed: (){
              Navigator.pushNamed(context, "HomeScreen");
            },
          ),
        ) ),
    )
    );
  }
}