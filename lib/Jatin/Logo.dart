import 'package:dooit/Arrangements/ShowImage.dart';
import 'package:dooit/Arrangements/SizeModification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Logo extends StatefulWidget{
  @override
  _LogoState createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      body:Column(
          children: <Widget>[
            Container(
            height: MediaQuery.of(context).size.height*0.6,
              width: MediaQuery.of(context).size.width*1,
              child:Padding(
                padding: EdgeInsets.only(top: 50.0),
                child:ShowImage("logo"),),
            ),
           Container(
            height: MediaQuery.of(context).size.height*0.4,
            width: MediaQuery.of(context).size.height*1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 100.0),
                child: Text(
                  "Start DOOing with DOO.it",
                  style: TextStyle(
                    fontSize: 28.0,
                    color: Colors.black,
                    fontWeight:FontWeight.bold,
                    )
                ),
              ),
              Row(
                children: <Widget>[
                 Padding(
                  padding: EdgeInsets.only(top: 44.0,bottom: 10.0),
                  child: SizedBox(
                  height: 60.0,
                 width: MediaQuery.of(context).size.width*1,
                 child :Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 25.0),
                      child:SizedBox(
                        height: 30.0,
                        width: 50.0,
                        child: ShowImage("india"),
                      ),
                    ),
                    Text("    "), 
                      Text("   +91  ",
                      style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )),
                  InkWell(
                  child:Text("Enter your mobile number",
                  style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black38,)
                  ),
                  onTap: (){
                    Navigator.pushNamed(context, "NumberEntry");
                  },
                ),
                   ],
                 )
              ),
              )
                ],
              )
            ],
          ),
      ),
          ],
      )
      )
    );
  }
}