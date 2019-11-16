import 'dart:convert';
import 'package:dooit/Arrangements/SizeModification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:http/http.dart' as http;
import '../Info/variables.dart' as global;  
import '../Arrangements/ShowImage.dart';


class NumberEntry extends StatefulWidget{
  @override
  _NumberEntryState createState() => _NumberEntryState();
}

class _NumberEntryState extends State<NumberEntry> {
   final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  void callSnackBar(String me)
  {
    print(me);
    // print("called me for snack bar");
    final SnackBar =new prefix0.SnackBar(
      content: new Text(me),
      duration: new Duration(seconds: 1),
    );
    _scaffoldkey.currentState.showSnackBar(SnackBar);
  }
  final JsonDecoder _decoder = new JsonDecoder(); 
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: _scaffoldkey,
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.red),
          onPressed: (){
            Navigator.pushNamed(context, "LogoScreen");
          },
        ),
        
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding:  EdgeInsets.only(top:SizeConfig.blockSizeHorizontal* 5,),
            child: Column(
              children: <Widget>[
            Padding(
            padding: EdgeInsets.only(top: 44.0,bottom: 10.0),
              child:Text(
                  "Please enter your mobile number",
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                ),
            ),
              ],
            ),
          ),
          new Container(
              padding:EdgeInsets.only(left:SizeConfig.blockSizeVertical* 5,top: SizeConfig.blockSizeHorizontal* 5,right: SizeConfig.blockSizeVertical* 10),
              child: new Column(

                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                  SizedBox(
                  height: 90.0,
                  width:SizeConfig.blockSizeHorizontal* 30,
                  child:Container(
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          height: 40.0,
                          width: 50.0,
                          child: ShowImage("india"),
                        ),



                        Text("  +91 ",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )
                        ),
                      ],
                    ),
                  ),
                ),


                SizedBox(
     height: 60.0,
     width:SizeConfig.blockSizeHorizontal* 38.5,
     child:   TextFormField(
       controller: global.MobileNumber,
       maxLength: 10,
       decoration: new InputDecoration(

          hintStyle: null,
         hintText: "enter your number"
       ),
       keyboardType: TextInputType.number,
     ),
 ),
                  ],
                ),

                ],
              )),
          Container(
            padding: EdgeInsets.only(top: SizeConfig.blockSizeHorizontal* 105, left: SizeConfig.blockSizeVertical* 5, right: SizeConfig.blockSizeVertical* 5,),

            //  width:282.0,
            //  height:44.0,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
    SizedBox(
      height: MediaQuery.of(context).size.height*0.07,
      width: MediaQuery.of(context).size.width*0.6,
    child:Text(

                  "By continuing you may receive an SMS for verification. Message and data rates may apply.",
                  style: TextStyle(fontSize: 16.0, color: Colors.black38),
                ),),
               FloatingActionButton(
                    onPressed: () async{
                      callSnackBar("OTP is sending to your Number....");
                      // Post newPost = new Post(
                      //                     phone: _numbercontroller.text
                      //                 );//contrycode taken ans var datatype
                      // Post p = await GetOtp(body: newPost.toMap());
                      //  callSnackBar("before");
                      //  post();
                      await   http.post(
                        "http://34.93.104.9:3000/api/signup",
                        body: json.encode({
                          "phone": global.MobileNumber.text
                        }),
                        headers: {"Accept": "application/json","Content-type": "application/json",},
                      ).then((http.Response response) {
                        // callSnackBar("after response");
                        // final String res = response.body;
                        var jsonResponse;
                        int statusCode = response.statusCode;
                        jsonResponse = json.decode(response.body);
                        if (statusCode ==200){
                          if(jsonResponse['success']==true)
                          {
                            callSnackBar("Otp is sent to your number");
                            Navigator.pushNamed(context, "OtpPage");
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => OtpEnter(
                            //             global.MobileNumber)));

                          }
                          else if(jsonResponse['success']==false){
                            callSnackBar("Failed to send Otp,Please Try again");
                          }
                        }
                      });
                    },

                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.red,

//  FloatingActionButtonLocation.centerFloat,
                  ),


              ],
            ),
          ),

        ],
      ),

    );
  }
}