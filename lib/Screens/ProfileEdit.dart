import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Info/variables.dart' as global;
import 'package:http/http.dart' as http;

class ProfileEdit extends StatefulWidget {
  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        Navigator.pushNamed(context,"AccountPage");
      },
    child:Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: new IconButton(
          
          icon: new Icon(Icons.arrow_back,
          color:Colors.red),
          
          onPressed: (){
            Navigator.pushNamed(context,"AccountPage");
          },
        ),
        
      ),
      body:ListView(
        children: <Widget>[
    Container(
      height: MediaQuery.of(context).size.height *1.0,
      width: MediaQuery.of(context).size.width * 1.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.20,
            width: MediaQuery.of(context).size.width * 0.28,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(110.0),
                child:  Image.asset("images/userimg.png"),
                // Image(

                //   image: NetworkImage(
                //       'https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg'),
                // ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.09,
                    width: MediaQuery.of(context).size.width * 0.92,
                    child: TextFormField(
                      controller: global.UserNameController,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        labelText: 'Name',
                        hintText: global.UserName,
                      ),
                    ),
                  ),
                  SizedBox(
                    height:MediaQuery.of(context).size.height/30 ,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.09,
                    width: MediaQuery.of(context).size.width * 0.92,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: global.MobileNumber,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        hintText: global.MobileNumber.text,
                      ),
                    ),
                  ),
                  SizedBox(
                    height:MediaQuery.of(context).size.height/30 ,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.09,
                    width: MediaQuery.of(context).size.width * 0.92,
                    child: TextFormField(
                      controller: global.EmailIdController,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.fiber_new,
                        ),
                        labelText: 'Primary Email',
                        hintText: global.EmailId
                      ),
                    ),
                  ),
                  SizedBox(
                    height:MediaQuery.of(context).size.height/ 5,
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.92,
                      child: RaisedButton(
                        color: Colors.red,
                        child: Text(
                          'Update',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'Mantserrat',
                              fontWeight: FontWeight.w500),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red)
                           ),
                        elevation: 2.0,
                       onPressed: ()async{
          global.UserName=global.UserNameController.text;
          // global.UserName=global.MobileNumber.text;
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
                
                Navigator.pushNamed(context, "SignUpPage");
                }
                else{
                  print("no referral status");
                   print(global.UserName);
                print(global.EmailId);
                print(global.UserName);
                print(global.ReferralCode);
                print(global.EmailIdController.text);
                  global.ReferralCode="No";
                   Navigator.pushNamed(context, "AccountPage");

                }
              }
              else{
                // OtpError();
                // callSnackBar("Please Enter correct OTP");
              }
            }
          

        },
                      ))
                ]),
          ),
        ],
      ),
    ),
        ],
      ),
    )
    );
  }
}
