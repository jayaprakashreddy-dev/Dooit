
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Info/variables.dart'as global;
import 'package:dooit/Arrangements/SizeModification.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget{
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: new IconButton(
          
          icon: new Icon(Icons.arrow_back,
          color:Colors.red),
          
          onPressed: (){
            Navigator.pushNamed(context,"LogoScreen");
          },
        ),
        
      ),
      body:ListView(
        children: <Widget>[
      Container(
        child: Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width *0.95,
          child: Padding(
            padding: EdgeInsets.only(top: 10.0, left: 30.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Let us know you better!',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            width:MediaQuery.of(context).size.width* 0.98 ,
            child: Padding(
              padding: EdgeInsets.only(left: 35.0, right: 35.0),
              child: TextFormField(
                onChanged: (Str){
                  global.EmailId=Str;
                },
                validator: (str){
                  !str.contains('@')? "Not a valid email id":null;
                },
                controller: global.UserNameController,
                decoration:new InputDecoration(
                  hintText: "Enter Your Name",
                  labelText: "Name",
                  labelStyle: TextStyle(fontSize: 20.0,
                      fontFamily: 'Regular',
                      fontWeight: FontWeight.w500),
                ) ,
                

              ),
            )),

             SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            width:MediaQuery.of(context).size.width* 0.98 ,
            child: Padding(
              padding: EdgeInsets.only(left: 35.0, right: 35.0),
              child: TextFormField(
                controller: global.EmailIdController,
                onChanged: (Str){
                  global.UserName=Str;
                },
                validator: (str){
                  !str.contains('a')? "Not a valid Name":null;
                },
                decoration:new InputDecoration(
                  hintText: "Enter Your Email id",
                  labelText: "Email id",
                  labelStyle: TextStyle(fontSize: 20.0,
                      fontFamily: 'Regular',
                      fontWeight: FontWeight.w500),
                ) ,

              ),
            )),

            SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            width:MediaQuery.of(context).size.width* 0.98 ,
            child: Padding(
              padding: EdgeInsets.only(left: 35.0, right: 35.0),
              child: TextFormField(
                onSaved: (Str){
                  global.ReferralCode=Str;
                },
                // validator: (str){
                //   !str.contains('@')? "Not a valid email id":null;
                // },
                controller: global.ReferralCodeController,
                decoration:new InputDecoration(
                  hintText: "Enter Your Referral Code",
                  labelText: "Referral Code (Optional)",
                  labelStyle: TextStyle(fontSize: 20.0,
                      fontFamily: 'Regular',
                      fontWeight: FontWeight.w500),
                ) ,

              ),
            )),

        
        ],
      )
      ),
      ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.arrow_forward,
          color:Colors.white
        ),
        backgroundColor: Colors.red,
        onPressed: ()async{
          global.UserName=global.UserNameController.text;
          global.EmailId=global.EmailIdController.text;
          global.ReferralCode=global.ReferralCodeController.text;


          
          Map data={
            "name":global.UserName,
            "email":global.EmailId,
            "referalid":global.ReferralCode,
              
            };
            var jsonResponse;
            var response =await http.post("http://34.93.104.9:3000/api/account/firstlogin",body: data,headers:{"Content-type": "application/x-www-form-urlencoded","token":global.token} );
            print("hitted");
            if(response.statusCode==200)
              {
               jsonResponse = json.decode(response.body);
              // jsonData=json
              print("got response");
              print(jsonResponse);
              if(jsonResponse['success']==true)
              {
                if(jsonResponse["referalstatus"]==true)
                {
                print("true");
                // print(jsonResponse['token']);
                // print("object");
                // global.isLogged=true;
                print(global.UserName);
                print(global.EmailId);
                print(global.EmailIdController.text);
                
                Navigator.pushNamed(context, "CitiesPage");
                }
                else{
                  print("no referral status");
                   print(global.UserName);
                print(global.EmailId);
                print(global.UserName);
                print(global.ReferralCode);
                print(global.EmailIdController.text);
                  global.ReferralCode="No";
                   Navigator.pushNamed(context, "CitiesPage");

                }
              }
              else{
                // OtpError();
                // callSnackBar("Please Enter correct OTP");
              }
            }
          

        },
      ),


          );
  }
}