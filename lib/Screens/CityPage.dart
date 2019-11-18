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
   bool isLoading=false;

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCities();
     print("jp");
    //  print(global.now.weekday);

    //  global.DayAfter=global.now.day+2;
    //  print(global.DayAfter);

  
  }

  
 
getCities() async
{
  setState(() async{

                isLoading=true;
  });
    var response =await http.get("http://34.93.104.9:3000/api/account/getcities",headers:{"Content-type": "application/x-www-form-urlencoded","token":global.token} );
            print("hitted");
            if(response.statusCode==200)
              {
                 jsonResponse = json.decode(response.body);
                print(jsonResponse);
                global.City=jsonResponse;
                print(global.City);
                // global.SelectedId=global.SelectedCity['_id'].toString();
                print(global.City['cities']);
                print(global.City['cities'].length);
              }
              setState(() async{

                isLoading=false;
  });
  
}

  @override
  Widget build(BuildContext context) {
    return  new Scaffold(
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
      body:
      WillPopScope(
      onWillPop: (){
        Navigator.popAndPushNamed(context,"HomeScreen");
      },
   child:ListView(
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
    
            child: global.City==null?Center(
           child: RaisedButton(
              
              child: Text("Refresh"),
              onPressed: (){
                // Navigator.pushNamed(context, "CitiesPage");
                City();
              },)
            ): ListView.builder(
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
  
      ),
      isLoading
            ? Container(
              child: Text("Loading"),
                // width: MediaQuery.of(context).size.width,
                // padding: EdgeInsets.all(5),
                // color: Colors.yellowAccent,
                // child: Text(
                //   'Loading',
                //   textAlign: TextAlign.center,
                //   style: TextStyle(
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
              )
            : Container()
       ],
      ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
        onPressed: () async{
          // getCenters();
          Navigator.pushNamed(context, "HomeScreen");
        },

      )
      
      );

    // );
  }
}
     