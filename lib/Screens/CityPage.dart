

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
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
   var c;

 


getCenters() async
{
 
    print("in get centers");
    print(global.token);
    var response =await http.get("http://34.93.104.9:3000/api/account/getcenters?city=${global.SelectedCity.toString()}",
    headers:{
      // "Content-type": "application/x-www-form-urlencoded",
      // "city":global.City.toString(),
    "token":global.token} 
    );
            print("hitted for center");
            if(response.statusCode==200)
              {
                print("response success");
                 jsonResponse = json.decode(response.body);
                print(jsonResponse);
                global.centers=jsonResponse;
                print(global.centers);
                print(global.centers.length);
                // SharedPreferences prefs = await SharedPreferences.getInstance();
                // prefs.setString('centers',global.centers.toString());
                GetPackages();
              }
              else if(response.statusCode==404)
              {
                print("response unsucess");
              }
  
  
}

  GetPackages()async{
    
       Map data={
       "workplaceid":global.SelectedId.toString(),
       "category":"silver",
       "ptype":"standard"
     };
            print("get packages");
            var response =await http.post("http://34.93.104.9:3000/api/account/getpackages",body: data,headers:{
              // "Content-type": "application/x-www-form-urlencoded",
              "token":global.token});
            print("aftrer");
            if(response.statusCode==200)
            {
               jsonResponse = json.decode(response.body);
              // jsonData=json
              print(
              "s");
              print(global.token);
              print(jsonResponse);
              if(jsonResponse['success']==true)
              {
                print("true");
                // global.token=jsonResponse['packages'];
                // print(global.token);
                global.Packages=jsonResponse['packages'];
                print(global.Packages.length);
                // SharedPreferences prefs = await SharedPreferences.getInstance();
                // prefs.setStringList('packages',global.Packages);
              }

            }
  

    
    
  }


  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  
     print("jp");
     print(global.now.weekday);

     global.DayAfter=global.now.day+2;
     print(global.DayAfter);
      // GetPackages();
      // getCities();
       getCenters();
      
  
  
  }

// getCities() async
// {
//   setState(() async{
//     var response =await http.get("http://34.93.104.9:3000/api/account/getcities",headers:{"Content-type": "application/x-www-form-urlencoded","token":global.token} );
//             print("hitted");
//             if(response.statusCode==200)
//               {
//                  jsonResponse = json.decode(response.body);
//                 print(jsonResponse);
//                 global.City=jsonResponse;
//                 print(global.City);
//                 // global.SelectedId=global.SelectedCity['_id'].toString();
//                 print(global.City['cities']);
//                 print(global.City['cities'].length);
//               }
//   });
  
// }

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
                    return Card(
                      // color: Colors.redAccent,
                      child:ListTile(
                      
                      leading: CircleAvatar(
                        // backgroundColor:
                        // foregroundColor: ,
                        child:Image.asset("images/cityLogo.png"),
                        // NetworkImage("url"),
                      ),
                      contentPadding: EdgeInsets.all(5),
                      title: Text(global.City['cities'][index].toString()),
                      selected: global.City['cities'][index]==global.SelectedCity,
                      // subtitle:
                      onLongPress: (){
                        //  global.CityData(index);
                        // Navigator.pushNamed(context, "ContactForm");
                      },
                      onTap: (){
                        
                        print(global.City['cities'][index].toString());
                        global.SelectedCity=global.City['cities'][index].toString();
                        setState(() {
                          // Colors c=Colors.redAccent;
                          // Color()
                          c=1;
                        });
                        
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
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
        onPressed: () async{
          getCenters();
          Navigator.pushNamed(context, "HomeScreen");
        },

      )
      
      )

    );
  }
}
     