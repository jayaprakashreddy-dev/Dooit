

import 'dart:convert';

import 'package:dooit/Arrangements/ShowImage.dart';
import 'package:http/http.dart' as http;
import 'package:dooit/apis/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Info/variables.dart' as global;

class City extends StatefulWidget {
  @override
  _CityState createState() => _CityState();
}

class _CityState extends State<City> {
   var jsonResponse;

 @override
void initState(){
            super.initState();
            getCities();
  }
getCities() async
{
  var response =await http.get("http://34.93.104.9:3000/api/account/getcities",headers:{"Content-type": "application/x-www-form-urlencoded","token":global.token} );
            print("hitted");
            if(response.statusCode==200)
              {
                 jsonResponse = json.decode(response.body);
                print(jsonResponse);
                global.City=jsonResponse;
                print(global.City);
                print(global.City['cities']);
                print(global.City['cities'].length);
              }
}

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        Navigator.popAndPushNamed(context,"HomeScreen");
      },
   child: new Scaffold(
      appBar: new AppBar(
        
        // title:
        backgroundColor: Colors.white,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.red),
          onPressed: (){
            print("going back from otp page");
            Navigator.pushNamed(context,"HomeScreen");
          },
        ),
      ),
      body:ListView(
        children: <Widget>[
           SizedBox(
            height: MediaQuery.of(context).size.height/10,
           child:Container(
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Change your city",
                    style: TextStyle(
                    fontSize: 24.0,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold),
    )
                  ],
                )
            ) ,
          ),
          // Container(
          //       child:
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         children: <Widget>[
          //           Text("INDIA",
          //             style: TextStyle(
          //                 fontSize: 18.0,
          //                 fontFamily: 'Montserrat',
          //                 fontWeight: FontWeight.w500),
          //           )
          //         ],
          //       ),

          //   ) ,

     SizedBox(
            height: MediaQuery.of(context).size.height/10,
           child:Container(
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("    INDIA",
                    style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold),
                      )
                  ],
                )
            ) ,
          ),
    Divider(thickness: 1.0,color: Colors.black26,),
     SizedBox(
       height: MediaQuery.of(context).size.height*8/10,
    
            child:  ListView.builder(
                  // controller: _scrollController,
                  itemCount: global.City['cities'].length,
                  itemBuilder: (context, index) {
                    return Card(child:ListTile(
                      leading: CircleAvatar(
                        // backgroundImage: ,
                        child:Image.asset("images/cityLogo.png"),
                        // NetworkImage("url"),
                      ),
                      contentPadding: EdgeInsets.all(5),
                      title: Text(global.City['cities'][index].toString()),
                    
                      // subtitle:
                      onLongPress: (){
                        //  global.CityData(index);
                        // Navigator.pushNamed(context, "ContactForm");
                      },
                      onTap: (){
                        
                        print(global.City['cities'][index].toString());
                        
                      },
                      // onTap:(){
                      //   print("clicked"+global.City[index].data['a']);
                      //   msg=global.City[index].data['a'];
                      //   // Subglobal.City(msg
                      //   //   );

                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => Subglobal.City(msg
                      //             )
                      //             )
                      //             );
                       
                      //   },
                      // e=global.City[index].data['a'],
                      // onTap: Subglobal.City(global.City[index].data['a'],index),
                      // subtitle: Text(global.City[index].data['short_desc']),
                    ));
                  },
                ),
        
    // // ListView.separated(
    // //           itemCount: global.City['cities'].length,
    // //           separatorBuilder: (context, index) {
    // //             return Divider(height: 10,);
    // //           },
    // //           itemBuilder: (context, index) {
    // //             return RaisedButton(
    // //               color: Colors.white,
    // //               child:  ListTile(
    // //               leading: ShowImage("cityLogo"),
    // //               title: Text(
    // //                 global.City['cities'][index].toString(),
    // //                 style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    // //               ),
    // //               // subtitle: Text(global.City['cities'].toString()),
                 
    // //             ),
    // //             shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
    // //             onPressed: (){
    // //               global.UserCity=global.City['cities'][index].toString();
    // //               print("user's city is "+global.City['cities'][index].toString());
    // //               Navigator.pushNamed(context,"HomeScreen");

    // //             },
    // //             );
    // //           },
              
    // //         )  
      )
       ],
      ))
    );
  }
}
     