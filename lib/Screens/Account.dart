import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dooit/Arrangements/SizeModification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import '../Info/variables.dart' as global;
import 'package:url_launcher/url_launcher.dart';

class AccountDetails extends StatefulWidget {
  AccountDetails({Key key}) : super(key: key);

  @override
  _AccountDetailsState createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CallForDetails();
  }
  CallForDetails()async{
    var jsonResponse;
    var response =await http.get("http://34.93.104.9:3000/api/account/getaccountdetails",headers:{"Content-type": "application/x-www-form-urlencoded","token":global.token} );
            print("hitted for account details");
            if(response.statusCode==200)
              {
                print("success");
                 jsonResponse = json.decode(response.body);
                print(jsonResponse);
                global.UserName=jsonResponse['account']['name'];
                global.EmailId=jsonResponse['account']['email'];
                global.MobileNumber.text=jsonResponse['account']['phone'];
                print(global.UserName);
                print(global.EmailId);
                
                // global.City=jsonResponse;
                // print(global.City);
                // print(global.City['cities']);
                // print(global.City['cities'].length);
              }
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
    onWillPop: (){
      Navigator.pushNamed(context,"HomeScreen");
    },
    child:Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: new IconButton(
          
          icon: new Icon(Icons.arrow_back,
          color:Colors.red),
          
          onPressed: (){
            Navigator.pushNamed(context,"HomeScreen");
          },
        ),
        
      ),
      body:Container(
        child: Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width * 0.95,
          child: Padding(
            padding: EdgeInsets.only(top: 10.0, left: 30.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Account Details',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 30.0,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.edit,
                        size: 26.0,
                      ),
                      tooltip: 'Edit Profile',
                      onPressed: () {
                        Navigator.pushNamed(context,"ProfileEdit");
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 1.0,
          child: Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Row(
              children: <Widget>[
                SizedBox(
                  height: 120.0,
                  width: 120.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(110.0),
                    child: Image.asset("images/userimg.png")
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text(
                          global.UserName,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontSize: 25.0,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Divider(
                        thickness: 4.0,
                        endIndent: 4.0,
                        color: Colors.redAccent,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text(
                        global.EmailId,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontSize: 25.0,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(
          thickness: 3.0,
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.98,
            child: Padding(
              padding: EdgeInsets.only(left: 35.0, right: 35.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Mobile Number',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Referral Code',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'DoDo Coins',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500),
                        ),
                      ]),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          global.MobileNumber.text,
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          global.ReferralCode,
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w400),
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                                height: 25.0,
                                width: 25.0,
                                child: Image.asset('images/account_dodo.png')),
                            Padding(
                              padding: EdgeInsets.only(left: 30.0),
                              child: Text(
                                global.coins,
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        )
                      ])
                ],
              ),
            )),
        Divider(
          thickness: 3.0,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.98,
          child: Padding(
            padding: EdgeInsets.only(left: 35.0, right: 35.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'Share and refer',
                      textDirection: TextDirection.ltr,
                      style: TextStyle(fontSize: 20.0),
                    ),
                    Text(
                      'Contact Us',
                      textDirection: TextDirection.ltr,
                      style: TextStyle(fontSize: 20.0),
                    ),
                    InkWell(
                      child:                     Text(
                      'Sign out',
                      textDirection: TextDirection.ltr,
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onTap: (){
                       global.token=null;
                                Navigator.pushNamed(context,"NumberEntry");
                                
                    },
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.share,
                        size: 26.0,
                      ),
                      tooltip: 'Share App',
                      onPressed: () {
                        // setState(() {
                        //      });
                         Share.share("meet me on LinkedIN https://in.linkedin.com/in/jaya-prakash-veldanda-756b48179");
                    
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.phone,
                        size: 26.0,
                      ),
                      tooltip: 'Contact us',
                      onPressed: ()async {
                        print("clicked for call");
                        // setState(() {});
                        if (await canLaunch("tel:919010590693")) {
                       await launch("tel:919010590693");
                        }
                      },
                    ),
                    IconButton(
                              icon: Icon(
                                Icons.power_settings_new,
                                size: 26.0,
                              ),
                              tooltip: 'Sign Out',
                              onPressed: () async {
                                print("jp   clicked for Sign_Out");
                                global.token=null;
                                Navigator.pushNamed(context,"NumberEntry");
                                // setState(() {});
                                // if (await canLaunch("tel:919010590693")) {
                                //   await launch("tel:919010590693");
                                // }
                              },
                            ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    ))
    )
    );
  }
}
