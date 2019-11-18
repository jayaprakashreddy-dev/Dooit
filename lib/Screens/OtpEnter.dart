import 'dart:convert';

import 'package:dooit/Arrangements/SizeModification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Info/variables.dart' as global;
import 'package:flutter/material.dart' as prefix0;
import 'package:http/http.dart' as http;
import 'package:share/share.dart';

// class OtpEnter extends StatefulWidget{
//   @override
//   _OtpEnterState createState() => _OtpEnterState();
// }

class OtpEnter extends StatefulWidget {
  @override
  _OtpEnterState createState() => _OtpEnterState();
}

class _OtpEnterState extends State<OtpEnter> {
    var jsonResponse;

   final GlobalKey<ScaffoldState> _scaffoldkey2 = new GlobalKey<ScaffoldState>();

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
    _scaffoldkey2.currentState.showSnackBar(SnackBar);
  }



  
getCities() async
{
  
  
    print("in cities");
    var response =await http.get("http://34.93.104.9:3000/api/account/getcities",headers:{"Content-type": "application/x-www-form-urlencoded","token":global.token} );
            print("hitted for city");
            if(response.statusCode==200)
              {
                 jsonResponse = json.decode(response.body);
                print(jsonResponse);
                global.City=jsonResponse;
                print(global.City);
                print(global.City['cities']);
                print(global.City['cities'].length);
                 
              //  getCenters();
              }

  
}

  

  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   setState(() {
     print("jp");
     print(global.now.weekday);

     global.DayAfter=global.now.day+2;
     print(global.DayAfter);
      // GetPackages();
      
      //  getCenters();
      
   });
  
  }


  @override
   Widget build(BuildContext context) {
    SizeConfig().init(context);
    return 
     Scaffold(
      key: _scaffoldkey2,
      appBar: new AppBar(
        backgroundColor: Colors.white,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.red),
          onPressed: (){
            print("going back from otp page");
            Navigator.pushNamed(context,"NumberEntry");
          },
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
                  "Please enter 4-digit Otp sent to  your mobile number",
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
                    maxLength: 4,
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
                InkWell(
                  child:                 Text(
                  "Edit my mobile number",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: SizeConfig.blockSizeVertical* 2.5,
                      fontWeight: FontWeight.w400),
                ),
                onTap:(){ Navigator.pushNamed(context, "NumberEntry");
                }
                )

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
                global.token=jsonResponse['token'];
                print(global.token);
                print("object");
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString('token',global.token);
                // global.isLogged=true;
                getCities();
                if(jsonResponse['active']==true)
                {
                  print("active user");
                  // getCities();
                // Navigator.pushNamed(context, "HomeScreen");
                // Navigator.pushNamed(context,"AccountPage");
                Navigator.pushNamed(context,"CitiesPage");
                }
                else if(jsonResponse['active']==false)
                {
                  // getCities();
                  print("new user");
                Navigator.pushNamed(context, "SignUpPage");
                // Navigator.pushNamed(context, );
                }
                
              }
              else{
                // OtpError();
                callSnackBar("Please Enter correct OTP");
              }
            }
          


        },
//  FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
