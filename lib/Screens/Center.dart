import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Info/variables.dart' as global;
import 'package:http/http.dart' as http;


class Centers extends StatefulWidget{
  @override
  _CentersState createState() => _CentersState();
}

class _CentersState extends State<Centers> {
  var jsonResponse;

//   getCenters() async
// {
//   setState(() async{
//     print("in get centers");
//     print(global.token);
//     var response =await http.get("http://34.93.104.9:3000/api/account/getcenters?city=${global.SelectedCity.toString()}",
//     headers:{
//       // "Content-type": "application/x-www-form-urlencoded",
//       // "city":global.City.toString(),
//     "token":global.token} 
//     );
//             print("hitted for center");
//             if(response.statusCode==200)
//               {
//                 print("response success");
//                  jsonResponse = json.decode(response.body);
//                 print(jsonResponse);
//                 global.centers=jsonResponse;
//                 print(global.centers);
//                 print(global.centers.length);
//                 GetPackages();
//               }
//               else if(response.statusCode==404)
//               {
//                 print("response unsucess");
//               }
//   });
  
// }

  GetPackages()async{
    // setState(() async{
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
              }

            }
  

    // });
    
  }





  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
            print("going back from Centers");
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
                    Text("Change your center",
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
                  itemCount: global.centers['centers'].length,
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
                      title: Text(global.centers['centers'][index]['name'].toString()),
                      selected: global.centers['centers'][index]['_id']==global.SelectedId,
                      subtitle:Text(global.centers['centers'][index]['address'].toString()),
                      
                      onLongPress: (){
                        //  global.CityData(index);
                        // Navigator.pushNamed(context, "ContactForm");
                      },
                      onTap: (){
                        // GetPackages();
                        print(global.centers['centers'][index].toString());
                        global.SelectedCenter=global.centers['centers'][index].toString();
                        global.SelectedId=global.centers['centers'][index]['_id'].toString();
                        print(global.SelectedId);
                         global.SelectedIdName=global.centers['centers'][index]['name'].toString();
                         print(global.SelectedIdName);
                         global.SelectedIdAddress=global.centers['centers'][index]['address'].toString();
                         print(global.SelectedIdAddress);
                          GetPackages();

                        setState(() {
                          // Colors c=Colors.redAccent;
                          // Color()
                          // c=1;
                        });
                        
                      },
                     
                    ));
                  },
                ),
        
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

           GetPackages();
          Navigator.pushNamed(context, "HomeScreen");
        },

      )
      
      )

    );;
  }
}