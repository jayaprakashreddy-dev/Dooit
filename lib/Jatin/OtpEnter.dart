import 'dart:convert';

import 'package:dooit/Arrangements/SizeModification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:http/http.dart' as http;

// class OtpEnter extends StatefulWidget{
//   @override
//   _OtpEnterState createState() => _OtpEnterState();
// }

class OtpEnter extends StatelessWidget {
   final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  void callSnackBar(String me)
  {
    print("called me for scnack bar");
    final SnackBar =new prefix0.SnackBar(
      content: new Text(me),
      duration: new Duration(seconds: 3),
      // action: new SnackBarAction(
      //   label: "OK",onPressed: (){
      //     // Navigator.pushNamed(context, ;
      //     // exit(0);
      //   },
      // ),
      // backgroundColor: Colors.blue,
    );
    _scaffoldkey.currentState.showSnackBar(SnackBar);
  }

  // Widget OtpError(){

  //   return ListView(
  //     children: <Widget>[
  //       Text("Please Enter correct OTP"),
  //     ],
  //   );
  // }

  OtpEnter(this.MobileEntered);
  final MobileEntered;
  
  final TextEditingController OtpEntered =new TextEditingController();
  @override
   Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      // key: _scaffoldkey,
       resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
     automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        leading: new IconButton(
          onPressed: (){

          },
          icon: new Icon(Icons.arrow_back, color: Colors.red),
        ),
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical*2.0,left: SizeConfig.blockSizeHorizontal*10, right: SizeConfig.blockSizeHorizontal*5.0),

            //  width:282.0,
            //  height:44.0,

            child: Column(
              children: <Widget>[
                Text(
                  "Please enter 6-digit Otp sent to  your mobile number",
                  style: TextStyle(fontSize: SizeConfig.blockSizeVertical*2.6, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          new Container(
              padding:
                  EdgeInsets.only(left: SizeConfig.blockSizeHorizontal* 12.5, right: SizeConfig.blockSizeHorizontal* 20.5, top: SizeConfig.blockSizeVertical* 1.0),
              child: new Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new TextFormField(
                    maxLength: 6,
                    decoration: new InputDecoration(
                      labelText: "Enter your number",
                      hintStyle: null,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ],
              )),
          Container(
            padding:
               EdgeInsets.only(top: SizeConfig.blockSizeVertical* 56.0, left: SizeConfig.blockSizeHorizontal* 9.5, right: SizeConfig.blockSizeHorizontal* 7.0),

            //  width:282.0,
            //  height:44.0,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
               new Column(
                   children: <Widget>[
               new Text(
                  "Resend Code in 00:05      ",
                  style: TextStyle(fontSize:SizeConfig.blockSizeVertical* 2.2, fontWeight: FontWeight.w300),
                ),
             
              new Text(
                  "  Edit my mobile number",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: SizeConfig.blockSizeVertical* 2.5,
                      fontWeight: FontWeight.w400),
                ),
                ],
                ),
           
                SizedBox( 
                  height:48.0,
                  width:50.0,  
                  child: new  FloatingActionButton(
        onPressed: () {},

        child: Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
//  FloatingActionButtonLocation.centerFloat,
      ),
                ),

                  
          
          // Container(
          //   padding:
          //      EdgeInsets.only(top: SizeConfig.blockSizeVertical* 0.0, left: SizeConfig.blockSizeHorizontal* 8.5, right: SizeConfig.blockSizeHorizontal* 8.0),

            //  width:282.0,
            //  height:44.0,

           
             ],
            ),
          ),
        ],
      ),
      // floatingActionButton:
    );
   }
}
