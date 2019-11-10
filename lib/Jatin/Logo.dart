import 'package:dooit/Arrangements/ShowImage.dart';
import 'package:dooit/Arrangements/SizeModification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      body: Container(
        child: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              // Padding(

              
              //     padding: EdgeInsets.only(top:SizeConfig.blockSizeVertical * 5.09,bottom: SizeConfig.blockSizeVertical * 5.24),
              SizedBox(
                height: MediaQuery.of(context).size.height/20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height/2.16,
                width: MediaQuery.of(context).size.width/1,
                              child:ShowImage("logo"),
                ),
                 Padding(

                  padding: EdgeInsets.only(top:SizeConfig.blockSizeVertical * 20,bottom:15.4,left: 9.6),
                  child: Text("Start DOOing with DOO.it",style:TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontSize: SizeConfig.blockSizeVertical * 3)),
                 ),
                 SizedBox(
                   height: MediaQuery.of(context).size.height/20,
                   child: RaisedButton(
                     child: Text("Enter your mobile number"),
                     onPressed: (){
                       Navigator.pushNamed(context, "NumberEntry");
                     },
                   ),
                 )
                //  Padding(

                //   padding: EdgeInsets.only(top:SizeConfig.blockSizeVertical * 0,bottom:5.4,left: 9.6),
                //   child:,
                //  )

            ],
          )
        ],
        ),
      ),
    ),
    );
  }
}