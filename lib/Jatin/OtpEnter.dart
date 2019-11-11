import 'dart:convert';

import 'package:dooit/Arrangements/SizeModification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Info/variables.dart' as global;
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

  @override
   Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      // key: _scaffoldkey,
      appBar: new AppBar(
        backgroundColor: Colors.white,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.red),
        ),
      ),
      body: ListView(children: <Widget>[
      Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical*2.0,left: SizeConfig.blockSizeHorizontal*10, right: SizeConfig.blockSizeHorizontal*5.0),

            //  width:282.0,
            //  height:44.0,

             child:   Text(
                  "Please enter 6-digit Otp sent to  your mobile number",
                  style: TextStyle(fontSize: SizeConfig.blockSizeVertical*2.6, fontWeight: FontWeight.bold),
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
                    controller: global.OtpEntered,
                    decoration: new InputDecoration(
                      labelText: "Enter your OTP",
                      hintStyle: null,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ],
              )),
          Container(
            padding:
               EdgeInsets.only(top: SizeConfig.blockSizeVertical* 57.0, left: SizeConfig.blockSizeHorizontal* 1.2, right: SizeConfig.blockSizeHorizontal* 39.0),

            //  width:282.0,
            //  height:44.0,

            child: Column(
              children: <Widget>[
                Text(
                  "Resend Code in 00:05",
                  style: TextStyle(fontSize:SizeConfig.blockSizeVertical* 2.3, fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
          Container(
            padding:
               EdgeInsets.only(top: SizeConfig.blockSizeVertical* 1.0, left: SizeConfig.blockSizeHorizontal* 3.0, right: SizeConfig.blockSizeHorizontal* 34.0),

            //  width:282.0,
            //  height:44.0,

            child: Column(
              children: <Widget>[
                Text(
                  "Edit my mobile number",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: SizeConfig.blockSizeVertical* 2.5,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ],
      ),
      ],),
      floatingActionButton: FloatingActionButton(
        

        child: Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
        onPressed: ()async {
          print("befoe");
         
            Map data={
              "phone":global.MobileNumber.text,
              "otp":global.OtpEntered.text
            };
            var jsonResponse;
            var response =await http.post("http://34.93.104.9:3000/api/login",body: data);
            print("aftrer");
            if(response.statusCode==200)
            {
               jsonResponse = json.decode(response.body);
              // jsonData=json
              print(
              "s");

              print(jsonResponse);
              if(jsonResponse['success']==true)
              {
                print("true");
                Navigator.pushNamed(context, "Success");
              }
              else{
                // OtpError();
                // callSnackBar("Please Enter correct OTP");
              }
            }
          


        },
//  FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
