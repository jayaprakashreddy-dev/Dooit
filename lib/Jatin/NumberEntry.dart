import 'dart:convert';

import 'package:dooit/Arrangements/SizeModification.dart';
import 'package:dooit/Jatin/OtpEnter.dart';
import 'package:dooit/apis/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:http/http.dart' as http;


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
  final JsonDecoder _decoder = new JsonDecoder(); 
  // Future<dynamic> post() {
  //   print("in post");
  //   return http.post(
  //     "http://34.93.104.9:3000/api/signup",
  //     body: json.encode({
  //       "phone": MobileNumber
  //     }),
  //     headers: {"Accept": "application/json","Content-type": "application/json",},
  //   ).then((http.Response response) {
  //     print("after response");
  //     // final String res = response.body;
  //     final int statusCode = response.statusCode;

  //     if (statusCode < 200 || statusCode > 400 || json == null) {
  //       throw new Exception("Error while fetching data");
  //     }
  //     return _decoder.convert(response.body);

  
  //           // Map data={
  //           //   "phone":MobileNumber.text
  //           // };
  //           // var jsonResponse=null;
  //           // var response =await http.post("http://34.93.104.9:3000/api/signup",body: data);
  //           // callSnackBar("await completed");
  //           // print("after");
  //           // if(response.statusCode==200)
  //           // {
  //           //   callSnackBar("In respnse with 200");
  //           //    jsonResponse = json.decode(response.body);
  //           //   // jsonData=json
  //           //   print(
  //           //   "s");

  //           //   print(jsonResponse);
  //           //   if(jsonResponse['success']==true)
  //           //   {
  //           //     callSnackBar("Otp sent to your mobile");
  //           //     print("true");
  //           //     // OtpEnter(MobileNumber);
  //           //     // Navigator.pushNamed(context, "OtpPage");
                
  //           //      Navigator.push(
  //           //               context,
  //           //               MaterialPageRoute(
  //           //                   builder: (context) => OtpEnter(
  //           //                       MobileNumber)));
    

  //   });
  // }

  final TextEditingController MobileNumber =new TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: _scaffoldkey,
      appBar: new AppBar(
        backgroundColor: Colors.white,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.red),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding:  EdgeInsets.only(top:SizeConfig.blockSizeHorizontal* 5,),
            child: Column(
              children: <Widget>[
                Text(
                  "Please enter your mobile number",
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          new Container(
              padding:EdgeInsets.only(left:SizeConfig.blockSizeVertical* 5,top: SizeConfig.blockSizeHorizontal* 5,right: SizeConfig.blockSizeVertical* 10),
              child: new Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new TextFormField(
                    controller: MobileNumber,
                    maxLength: 10,
                    decoration: new InputDecoration(
                      labelText: "Enter your number",
                      hintStyle: null,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ],
              )),
          Container(
            padding: EdgeInsets.only(top: SizeConfig.blockSizeHorizontal* 80, left: SizeConfig.blockSizeVertical* 5, right: SizeConfig.blockSizeVertical* 5,),

            //  width:282.0,
            //  height:44.0,

            child: Column(
              children: <Widget>[
                Text(
                  "By continuing you may receive an SMS for verification. Message and data rates may apply.",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(top: 630.0, left: 22.5, right: 150.0),

            //  width:282.0,
            //  height:44.0,

            // child: Column(
            //   children: <Widget>[
            //     Text(
            //       "Edit my mobile number",
            //       style: TextStyle(
            //           color: Colors.red,
            //           fontSize: 20.0,
            //           fontWeight: FontWeight.w300),
            //     ),
            //   ],
            // ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
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
        "phone": MobileNumber.text
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
         Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OtpEnter(
                                  MobileNumber)));

      }
      else if(jsonResponse['success']==false){
        callSnackBar("Failed to send Otp,Please Try again");
      }
      }
      // else{
      //   callSnackBar("after");
      //    Navigator.push(
      //                     context,
      //                     MaterialPageRoute(
      //                         builder: (context) => OtpEnter(
      //                             MobileNumber)));
    
      // }
         
    });
            // Map data={
            //   "phone":MobileNumber.text
            // };
            // var jsonResponse=null;
            // var response =await http.post("http://34.93.104.9:3000/api/signup",body: data);
            // callSnackBar("await completed");
            // print("after");
            // if(response.statusCode==200)
            // {
            //   callSnackBar("In respnse with 200");
            //    jsonResponse = json.decode(response.body);
            //   // jsonData=json
            //   print(
            //   "s");

            //   print(jsonResponse);
            //   if(jsonResponse['success']==true)
            //   {
            //     callSnackBar("Otp sent to your mobile");
            //     print("true");
            //     // OtpEnter(MobileNumber);
            //     // Navigator.pushNamed(context, "OtpPage");
                
                
            //   }
            //   else{
            //     callSnackBar("Otp failed to send  Retry");
            //   }
            // } 
          

          // Navigator.pushNamed(context, "OtpPage");
        },

        child: Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
//  FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}