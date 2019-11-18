import 'dart:convert';
import 'dart:io';
import 'package:dooit/Arrangements/ShowImage.dart';
// import 'package:dooit/Screens/Center.dart';
import 'package:dooit/Screens/CityPage.dart';
import 'package:flutter/material.dart' as prefix0;
import '../Arrangements/SizeModification.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../Arrangements/my_flutter_app_icons.dart';
import 'package:flutter/rendering.dart';
import '../Screens/workout.dart';
import '../Info/variables.dart' as global;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var jsonResponse;
  bool Loading=false;
  
  final GlobalKey<ScaffoldState> _scaffoldKey=GlobalKey<ScaffoldState>();

  void callSnackBar(String msg,[int er])
  {
    
      // msg="There is no record with this user, please register first by clicking Register or check the user mail id or Password";
      final SnackBar=new prefix0.SnackBar(
      content: new Text(msg),
      duration: new Duration(seconds: 5),
      action: new SnackBarAction(label: "Exit",
      onPressed: (){
        // Navigator.pushNamed(context, "Register");
        exit(0);
      },),
    );
     _scaffoldKey.currentState.showSnackBar(SnackBar);
    
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     getCities();
    print("jp");
     print(global.now.weekday);

     global.DayAfter=global.now.day+2;
     print(global.DayAfter);
    
    // global.City=getCities();
    // // await Future.delayed(const Duration(seconds: 1));
    //  global.centers= getCenters();
    // // await Future.delayed(const Duration(seconds: 1));
    //  global.Packages=GetPackages();
    // // await Future.delayed(const Duration(seconds: 1));

   setState(() {
     
      // GetPackages();
     
      //  getCenters();
      
   });
  
  }


 getCities() async
{
  setState(() {
    Loading=true;
  });
  // setState(() async{
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
               getCenters();
              }

            // setState(() {
            //   Loading=false;
            // });
              // return jsonResponse;
  // });
  
}

 getCenters() async
{
  // setState(() {
  //   Loading=true;
  // });
  // setState(() async{
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
                GetPackages();
              }
              else if(response.statusCode==404)
              {
                print("response unsucess");
              }
              // setState(() {
              //   Loading=false;
              // });
  // });
  // return jsonResponse;
  
}

   GetPackages()async{
    // setState(() async{
      // setState(() {
      //   Loading=true;
      // });
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
            // setState(() {
            //   Loading=false;
            // });
            // return jsonResponse;
  

    // });
    
  }


  
  

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //  setState(() {
  //    print("jp");
  //    print(global.now.weekday);

  //    global.DayAfter=global.now.day+2;
  //    print(global.DayAfter);
  //     // GetPackages();
  //     // getCities();
  //     //  getCenters();
      
  //  });
  
  // }



  @override
  Widget build(BuildContext context) {
    getCities();
    SizeConfig().init(context);
    textStyle() {
      return new TextStyle(
          color: Colors.black,
          fontSize: MediaQuery.of(context).size.height / 31.0);
    }
    getCities();
    return WillPopScope(
      
    onWillPop: (){
      callSnackBar("Click Exit to leave app");
    },
    child:MaterialApp(
      theme: ThemeData(primaryColor: Colors.white, accentColor: Colors.red),
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primaryColor: Colors.green,
      //   accentColor: Colors.orange,
      // ),

      home:new DefaultTabController(
        length: 2,
        child: new Scaffold(
          key: _scaffoldKey,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(MediaQuery.of(context).size.height /
                6.5), // here the desired height
            child: AppBar(
              elevation: 0.0,
              actions: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width / 35.0,
                      left: MediaQuery.of(context).size.width / 20,
                      right: MediaQuery.of(context).size.width / 20,
                    ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      // verticalDirection: VerticalDirection.down,
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.width / 20.3333,
                          width: MediaQuery.of(context).size.width / 3.3333,
                          child: ShowImage("2ndscreenlogo"),
                        ),
                        new Align(
                          alignment: Alignment.centerRight,
                          heightFactor:
                              MediaQuery.of(context).size.height / 400,
                          widthFactor: MediaQuery.of(context).size.width / 380,
                          child: InkWell(
                          child:global.SelectedCity==null ?Text("                   "):Text("                   "+global.SelectedCity,
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height / 45,
                                fontWeight: FontWeight.w400,
                              )),
                               onTap: (){
                                City();
                                // prefix0.Navigator.popAndPushNamed(context,"CitiesPage");
                                Navigator.pushNamed(context, "CitiesPage");
                              },
                        ),
                        ),
                        new Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            MyFlutterApp.circle,
                            color: Colors.cyanAccent,
                            size: SizeConfig.blockSizeHorizontal * 2.5,
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeHorizontal * 20.5,
                          width: MediaQuery.of(context).size.width / 7.0,
                          // height:MediaQuery.of(context).size.height*20.0,
                          child: InkWell(
                            child:ShowImage("userimg"),
                             onTap: (){
                          //  Navigator.pushNamed(context,"LogoScreen");
                          Navigator.pushNamed(context,"AccountPage");
                          // Navigator.pushNamed(context,"Centers");

                         },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              backgroundColor: Colors.white,
              bottom: TabBar(
                tabs: <Widget>[
                  // new Container(
                  //   width: SizeConfig.blockSizeHorizontal * 30.5,
                  Tab(
                    child: Text("Workout", style: textStyle()),
                  ),
                  Tab(
                    child: Text("Packages", style: textStyle()),
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Workout(),
              Packages(context),
            ],
          ),
        ),
      ),
    )
    );
  }
}



// class Packages extends StatefulWidget {
//   Packages({Key key}) : super(key: key);

//   _PackagesState createState() => _PackagesState();
// }

// class _PackagesState extends State<Packages> {
//   List<bool> isSelected;
//   @override
//   void initState(){
//     isSelected = [true, false];
//   }
//   @override
  Widget Packages(BuildContext context) {
    return ListView(children: <Widget>[
      Container(
          padding: EdgeInsets.only(top: 15),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.height * 0.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'GOLD TRAINER PACKS',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.blockSizeVertical * 2.6,
                          ),
                        ),
                       Text(
                          global.SelectedIdName!=null?global.SelectedIdName:"City",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: SizeConfig.blockSizeVertical * 1.7,
                          ),
                        ), 
                      ],
                    ),
                    Column(
                      children: <Widget>[
                       InkWell(
                      child:  Text(
                          'All CENTERS',
                          style: TextStyle(
                            fontSize: SizeConfig.blockSizeVertical * 2.6,
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onTap: (){
                          Navigator.pushNamed(context, "Centers");
                        },
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.13,
                width: MediaQuery.of(context).size.width * 0.90,
                 child: global.Packages==null?Text("Select Active Center"):
                    ListView.builder(
                      scrollDirection: Axis.horizontal,
                      
                  // controller: _scrollController,
                  itemCount: global.Packages.length,
                  itemBuilder: (context, index) {

                   return RaisedButton(
                      // onPressed: () =>modal(context),
                      // child:new Text('modal'),
                      color: Colors.white,
                      elevation: 4.0,
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            global.Packages[index]['total_sessions'].toString()==null?null:global.Packages[index]['total_sessions'].toString()+" Sessions",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              //fontSize:SizeConfig.blockSizeVertical*2.5,
                            ),
                          ),
                          Text(
                            "₹ " +global.Packages[index]['total_cost'].toString()==null?null:global.Packages[index]['total_cost'].toString(),
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              decoration: TextDecoration.lineThrough,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.022,
                            ),
                          ),
                          // CallForDiscount(global.Packages[index]['total_cost'].toString()),
                          // global.Packages[index]['total_cost'].toString().,
                          Text(
                            "₹ "+global.Packages[index]['total_cost'].toString()==null?null:global.Packages[index]['total_cost'].toString(),
                            style: TextStyle(
                              color: Colors.black.withOpacity(1.0),
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.035,
                            ),
                          ),
                          
                          Text(
                            "₹ "+global.Packages[index]['total_cost'].toString()==null?null:global.Packages[index]['total_cost'].toString()+"/session ",
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.016,
                            ),
                          ),
                        ],
                      ),
                      onPressed: () => gym(context),
                    );

                   },
                ),
              ),

                
          
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.09,
                width: MediaQuery.of(context).size.height * 0.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'SILVER TRAINER PACKS',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.blockSizeVertical * 2.6,
                          ),
                        ),
                        Text(
                            global.SelectedIdName!=null?global.SelectedIdName:"Select Active center",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: SizeConfig.blockSizeVertical * 1.7,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                        child:Text(
                          'All CENTERS',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.blockSizeVertical * 2.6,
                          ),
                        ),
                        onTap: (){

                          // Navigator.pushReplacement(context,"Centers");
                          Navigator.pushNamed(context,"Centers");
                        },
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.13,
                width: MediaQuery.of(context).size.width * 0.90,
                 child: global.Packages==null?Text("Select Active Center"):
                    ListView.builder(
                      scrollDirection: Axis.horizontal,
                      
                  // controller: _scrollController,
                  itemCount: global.Packages.length,
                  itemBuilder: (context, index) {

                   return RaisedButton(
                      // onPressed: () =>modal(context),
                      // child:new Text('modal'),
                      color: Colors.white,
                      elevation: 4.0,
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            global.Packages[index]['total_sessions'].toString()==null?"": global.Packages[index]['total_sessions'].toString()+" Sessions",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              //fontSize:SizeConfig.blockSizeVertical*2.5,
                            ),
                          ),
                          Text(
                            "₹ " +global.Packages[index]['total_cost'].toString()==null?"":global.Packages[index]['total_cost'].toString(),
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              decoration: TextDecoration.lineThrough,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.022,
                            ),
                          ),
                          // CallForDiscount(global.Packages[index]['total_cost'].toString()),
                          // global.Packages[index]['total_cost'].toString().,
                          Text(
                            "₹ "+global.Packages[index]['total_cost'].toString()==null?"":global.Packages[index]['total_cost'].toString(),
                            style: TextStyle(
                              color: Colors.black.withOpacity(1.0),
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.035,
                            ),
                          ),
                          
                          Text(
                            "₹ "+global.Packages[index]['total_cost'].toString()+"/session ",
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.016,
                            ),
                          ),
                        ],
                      ),
                      onPressed: () => gym(context),
                    );

                   },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.30,
                width: MediaQuery.of(context).size.width * 0.95,
                child: Image.asset('images/poster.png'),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.86,
                child: Text(
                  'ACTIVE PACKAGES',
                  style: TextStyle(
                      fontSize: SizeConfig.blockSizeVertical * 2.6,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.12,
                width: MediaQuery.of(context).size.width * 0.90,
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 1.0,
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Image.asset('images/row3image.png'),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '          Gold Trainer 5 Sessions',
                          style: TextStyle(
                            color: Colors.black,
                            // fontSize:  SizeConfig.blockSizeVertical * 2.6,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                         global.SelectedCity==null?"":"          "+global.SelectedCity,
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontWeight: FontWeight.w400,
                            //fontSize: SizeConfig.blockSizeVertical * 2.1,
                          ),
                        ),
                        Text(
                          '          4/5 Left',
                          style: TextStyle(
                            color: Colors.red,
                            //fontSize: SizeConfig.blockSizeVertical * 2.6,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.12,
                width: MediaQuery.of(context).size.width * 0.90,
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 1.0,
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Image.asset('images/row3image.png'),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '          Gold Trainer 10 Sessions',
                          style: TextStyle(
                            color: Colors.black,
                            // fontSize:  SizeConfig.blockSizeVertical * 2.6,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          global.SelectedCity==null?"":"          " +global.SelectedCity,
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontWeight: FontWeight.w400,
                            //fontSize: SizeConfig.blockSizeVertical * 2.1,
                          ),
                        ),
                        Text(
                          '          Awaiting',
                          style: TextStyle(
                            color: Colors.red,
                            //fontSize: SizeConfig.blockSizeVertical * 2.6,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width * 0.90,
                // child: Image.asset('images/poster.png'),
                child: RaisedButton(
                  color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Share & earn',
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                          Text(
                            '100 DoDo \n   Coins',
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          )
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.50,
                        width: MediaQuery.of(context).size.width * 0.50,
                        child: Image.asset('images/share&earn.png'),
                      )
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.86,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'REDEEM DoDo coins',
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeVertical * 2.6,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        Text(
                           global.SelectedIdName!=null?global.SelectedIdName:"Select Active center",
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeVertical * 1.7,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        )
                      ],
                    ),
                    InkWell(child: 
                    Text(
                      'All CENTERS',
                      style: TextStyle(
                        fontSize: SizeConfig.blockSizeVertical * 2.6,
                        color: Colors.red,
                        fontWeight: FontWeight.w700,
                      ),
                    
                    ),
                    onTap: (){
                      Navigator.pushNamed(context,"Centers");
                    },
                    ),
                  ],
                ),
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.86,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Balance                                                  ',
                        style: TextStyle(
                          fontSize: SizeConfig.blockSizeVertical * 2.5,
                          color: Colors.red,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                        width: MediaQuery.of(context).size.width * 0.10,
                        child: Image.asset('images/account_dodo.png'),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            '120',
                            style: TextStyle(
                              fontSize: SizeConfig.blockSizeVertical * 2.5,
                              color: Colors.red,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.86,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    
                    RaisedButton(
                      color: Colors.white,
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('1 Gold Session'),
                          Divider(
                            indent: 2.0,
                            thickness: 2.0,
                            color: Colors.black.withOpacity(0.7),
                          ),
                          Row(
                            children: <Widget>[
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                                width: MediaQuery.of(context).size.width * 0.10,
                                child: Image.asset('images/account_dodo.png'),
                              ),
                              Text(
                                '150',
                                style: TextStyle(
                                  fontSize: SizeConfig.blockSizeVertical * 2.5,
                                  color: Colors.black.withOpacity(0.7),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),

                      onPressed: () => redeem(context),
                    ),
                    RaisedButton(
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('1 Group Session'),
                          Divider(
                            thickness: 1.0,
                            color: Colors.black,
                          ),
                          Row(
                            children: <Widget>[
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                                width: MediaQuery.of(context).size.width * 0.10,
                                child: Image.asset('images/account_dodo.png'),
                              ),
                              Text(
                                '100',
                                style: TextStyle(
                                  fontSize: SizeConfig.blockSizeVertical * 2.5,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      onPressed: () => redeem(context),
                    )
                  ],
                ),
              ),
                    // ToggleButtons(
                    //   borderColor: Colors.black,
                    //   fillColor: Colors.grey,
                    //   borderWidth: 2,
                    //   selectedBorderColor: Colors.black,
                    //   selectedColor: Colors.white,
                    //   borderRadius: BorderRadius.circular(0),
                    //   children: <Widget>[
                    //     Padding(
                    //       padding: const EdgeInsets.all(8.0),
                    //       child: Text(
                    //         'Open 24 Hours',
                    //         style: TextStyle(fontSize: 16),
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: const EdgeInsets.all(8.0),
                    //       child: Text(
                    //         'Custom Hours',
                    //         style: TextStyle(fontSize: 16),
                    //       ),
                    //     ),
                    //   ],
                    //   onPressed: (int index) {
                    //     setState(() {
                    //       for (int i = 0; i < isSelected.length; i++) {
                    //         if (i == index) {
                    //           isSelected[i] = true;
                    //         } else {
                    //           isSelected[i] = false;
                    //         }
                    //       }
                    //     });
                    //   },
                    //   isSelected: isSelected,
                    // ),

                    // ToggleButtons(
                    //   color: Colors.white,
                    //   fillColor: Colors.white,
                    //   borderWidth: 2,
                    //   selectedColor: Colors.grey,
                    //   disabledColor: Colors.blueGrey,
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: <Widget>[
                    //       Text('1 Gold Session'),
                    //       Divider(
                    //         indent: 2.0,
                    //         thickness: 2.0,
                    //         color: Colors.black.withOpacity(0.7),
                    //       ),
                    //       Row(
                    //         children: <Widget>[
                    //           SizedBox(
                    //             height:
                    //                 MediaQuery.of(context).size.height * 0.03,
                    //             width: MediaQuery.of(context).size.width * 0.10,
                    //             child: Image.asset('image/account_dodo.png'),
                    //           ),
                    //           Text(
                    //             '150',
                    //             style: TextStyle(
                    //               fontSize: SizeConfig.blockSizeVertical * 2.5,
                    //               color: Colors.black.withOpacity(0.7),
                    //               fontWeight: FontWeight.w700,
                    //             ),
                    //           ),
                    //         ],
                    //       )
                    //     ],
                    //   ),
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: <Widget>[
                    //       Text('1 Group Session'),
                    //       Divider(
                    //         thickness: 1.0,
                    //         color: Colors.black,
                    //       ),
                    //       Row(
                    //         children: <Widget>[
                    //           SizedBox(
                    //             height:
                    //                 MediaQuery.of(context).size.height * 0.03,
                    //             width: MediaQuery.of(context).size.width * 0.10,
                    //             child: Image.asset('image/account_dodo.png'),
                    //           ),
                    //           Text(
                    //             '100',
                    //             style: TextStyle(
                    //               fontSize: SizeConfig.blockSizeVertical * 2.5,
                    //               color: Colors.red,
                    //               fontWeight: FontWeight.w700,
                    //             ),
                    //           ),
                    //         ],
                    //       )
                    //     ],
                    //   ),
                    //   onPressed: (int index){
                    //     setState(() {
                    //       for(int i = 0; i < isSelected.length; i++)
                    //       {
                    //       if (i == index) {
                    //         isSelected[i] = true;
                    //       }
                    //       else{
                    //         isSelected[i] = false;
                    //       }
                    //     }
                    //     });
                    //   },
                    //   isSelected: isSelected,
                    // ),
              //     ],
              //   ),
              // ),
                
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.03),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.86,
                  child: Text(
                    'INACTIVE PACKAGES',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: SizeConfig.blockSizeVertical * 2.6,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.12,
                width: MediaQuery.of(context).size.width * 0.90,
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 1.0,
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Image.asset('images/row3image.png'),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '          Gold Trainer 5 Sessions',
                          style: TextStyle(
                            color: Colors.black,
                            // fontSize:  SizeConfig.blockSizeVertical * 2.6,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          global.SelectedCity==null?"":"           "+global.SelectedCity,
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontWeight: FontWeight.w400,
                            //fontSize: SizeConfig.blockSizeVertical * 2.1,
                          ),
                        ),
                        Text(
                          '          4/5 Left',
                          style: TextStyle(
                            color: Colors.red,
                            //fontSize: SizeConfig.blockSizeVertical * 2.6,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.12,
                width: MediaQuery.of(context).size.width * 0.90,
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 1.0,
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Image.asset('images/row3image.png'),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '          Gold Trainer 5 Sessions',
                          style: TextStyle(
                            color: Colors.black,
                            // fontSize:  SizeConfig.blockSizeVertical * 2.6,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                         global.SelectedCity==null?"":"           "+global.SelectedCity,
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontWeight: FontWeight.w400,
                            //fontSize: SizeConfig.blockSizeVertical * 2.1,
                          ),
                        ),
                        Text(
                          '          0/10 Left',
                          style: TextStyle(
                            color: Colors.red,
                            //fontSize: SizeConfig.blockSizeVertical * 2.6,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.10,
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Center(
                    child: RaisedButton(
                      color: Colors.white,
                      child: Text('Show More +'),
                      onPressed: () {},
                    ),
                  )),
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Divider(
                  color: Colors.black38,
                  thickness: 1.5,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
                width: MediaQuery.of(context).size.width * 0.85,
                child: Image.asset('images/why_buy_pack.png'),
              )
            ],
          )),
    ]);
  }

// Widget CallForDiscount(String string) {
//   CallForDiscount(string);
//   // CallForDiscount(this.string)
//   var tmp=int.parse(string);
//   print("jp"+tmp.toString());
//   global.temp=tmp-50;
  
// }
  






  gym(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return new Container(
            height: MediaQuery.of(context).size.height * 0.4,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.02,
            ),
            child: Column(
              children: <Widget>[
                new Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.0,
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Gold Trainer 5 Sessions Pack                   ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.height * 0.03,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${global.SelectedIdName!=null?global.SelectedIdName:""}                                                   ',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                          fontSize: MediaQuery.of(context).size.height * 0.03,
                        ),
                      ),
                    ],
                  ),
                ),
                new Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02,
                    left: MediaQuery.of(context).size.width * 0.05,
                  ),
                  color: Colors.grey.withOpacity(0.2),
                  height: MediaQuery.of(context).size.height * 0.27,
                  width: MediaQuery.of(context).size.width * 1.0,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Address:                                                           ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.height * 0.03,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        global.SelectedIdAddress==null?"":global.SelectedIdAddress,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                        ),
                      ),
                      Text(
                        'Instruction:                                                         ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.height * 0.03,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Pay the amount at Gym center and we will confirm your status as soon as payment is received ',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                        ),
                      ),
                      RaisedButton(
                        color: Colors.red,
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.1,
                          right: MediaQuery.of(context).size.width * 0.1,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(27.0),
                        ),
                        child: Text(
                          'PAY AT GYM',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {

                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
  redeem(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return new Container(
            height: MediaQuery.of(context).size.height * 0.4,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.02,
            ),
            child: Column(
              children: <Widget>[
                new Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.0,
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Redeem Gold Trainer 1 Session                   ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.height * 0.03,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${global.SelectedIdName==null?'':global.SelectedIdName}                                                       ',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                          fontSize: MediaQuery.of(context).size.height * 0.03,
                        ),
                      ),
                    ],
                  ),
                ),
                new Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02,
                    left: MediaQuery.of(context).size.width * 0.05,
                  ),
                  color: Colors.grey.withOpacity(0.2),
                  height: MediaQuery.of(context).size.height * 0.27,
                  width: MediaQuery.of(context).size.width * 1.0,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Address:                                                                                                      ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${global.SelectedIdAddress} \n',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                        ),
                      ),
                      Text(
                        'DODo coins burnt:                                                                                      ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                   Row(
                      children: <Widget>[
                        Text('                                        '),
                        SizedBox(
                                height:MediaQuery.of(context).size.height * 0.03,
                                width: MediaQuery.of(context).size.width * 0.10,
                                child: Image.asset('images/account_dodo.png'),
                              ),
                           Text(
                                '100',
                                style: TextStyle(
                                  fontSize: SizeConfig.blockSizeVertical * 2.5,
                                  color: Colors.black.withOpacity(0.7),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                      RaisedButton(
                        color: Colors.red,
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.1,
                          right: MediaQuery.of(context).size.width * 0.1,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(27.0),
                        ),
                        child: Text(
                          'CONFIRM',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
