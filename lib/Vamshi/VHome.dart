import 'package:dooit/Arrangements/ShowImage.dart';
import 'package:dooit/Arrangements/SizeModification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


// class VamshiVamshiHome extends StatefulWidget{
//   @override
//   _VamshiVamshiHomeState createState() => _VamshiVamshiHomeState();
// }

// class _VamshiVamshiHomeState extends State<VamshiVamshiHome> {
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     // TODO: implement build
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       VamshiHome:Scaffold(
//       appBar: AppBar(
//         title: Text("Vamshi's Screens"),
//       ),
//       body: Container(
//         child: Center(
//          child:Text("Start coding here  ALL THE BEST!!!",style: TextStyle(color: Colors.green,fontSize: SizeConfig.blockSizeVertical *3.0,),),
//         ) ),
//     ),
//     );
//   }
// }

// // import 'package:./ASizeModification.dart';
// import 'Arrangements/SizeModification.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'icon/my_flutter_app_icons.dart';
// import 'Arrangements/ShowImage.dart';



class VamshiHome extends StatefulWidget {
  @override
  _VamshiHomeState createState() => _VamshiHomeState();
}

class _VamshiHomeState extends State<VamshiHome> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    textStyle() {
      return new TextStyle(
          color: Colors.black,
          fontSize: MediaQuery.of(context).size.height / 31.0);
    }

    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.white, accentColor: Colors.red),
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primaryColor: Colors.green,
      //   accentColor: Colors.orange,
      // ),

        home: new DefaultTabController(
        length: 2,
        child: new Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(MediaQuery.of(context).size.height /
                6.5), // here the desired height
            child: AppBar(
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
                          child: Text("                   Delhi Ncr",
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height / 45,
                                fontWeight: FontWeight.w400,
                              )),
                        ),
                        // new Align(
                        //   alignment: Alignment.centerRight,
                        //   child: Icon(
                        //     MyFlutterApp.circle,
                        //     color: Colors.cyanAccent,
                        //     size: SizeConfig.blockSizeHorizontal * 2.5,
                        //   ),
                        // ),
                        SizedBox(
                          height: SizeConfig.blockSizeHorizontal * 20.5,
                          width: MediaQuery.of(context).size.width / 7.0,
                          // height:MediaQuery.of(context).size.height*20.0,
                          child: ShowImage("userimg"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              backgroundColor: Colors.white,
              bottom: TabBar(
                tabs: <Widget>[
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
              Packages(),
            ],
          ),
        ),
      ),
    );
  }
}

class Workout extends StatelessWidget {
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // VamshiHome:
    return new Scaffold(
      body:
    ListView(
      children: <Widget>[
        new Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 38,
            left: MediaQuery.of(context).size.width / 20,
            right: MediaQuery.of(context).size.width / 80,
          ),

          //    child:
          // new Container(
          //   width:MediaQuery.of(context).size.width/50,
          //   padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 14,
          //   left: MediaQuery.of(context).size.width/5,),
          //   decoration: new BoxDecoration(
          //     borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
          //     color: Colors.purple,gradient: new LinearGradient(
          //       colors: [Colors.purple[300], Colors.purple[900]],begin: Alignment.centerRight,
          //       end: Alignment.centerLeft,
          //     ),
          //   ),
          child: Row(
            children: <Widget>[
              new Container(
                height: MediaQuery.of(context).size.height / 12,
                width: MediaQuery.of(context).size.width / 2.2,
                //   padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 14,
                //   left: MediaQuery.of(context).size.width/5,),
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                  color: Colors.purple,
                ),

                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 60,
                  left: MediaQuery.of(context).size.width / 27,
                ),
                child: Text('ACTIVE PACKS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height / 35,
                    )),
              ),
              new Container(
                height: MediaQuery.of(context).size.height / 12,
                width: MediaQuery.of(context).size.width / 2.2,
                //   padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 14,
                //   left: MediaQuery.of(context).size.width/5,),
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                  color: Colors.purple,
                ),

                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 60,
                  left: MediaQuery.of(context).size.width / 27,
                ),
                child: Text('5 silver  Traine Packs',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height / 35,
                    )),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height/10,
        ),
        RaisedButton(
          color: Colors.pink,
          child: Text("Profile"),
          onPressed: (){
            Navigator.pushNamed(context,"AccountPage");
          },
        )
      ],
    )
    );
  }
}

class Packages extends StatelessWidget {
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    VamshiHome:
    return ListView(
      children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "GOLD TRAINER PACKS",
                          style: TextStyle(
                            color: Colors.black,
                            height: 22.0,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: 5.0,
                          ),
                        ),
                        Text(
                          "Cult Galleria",
                          style: TextStyle(
                            color: Colors.black,
                            height: 18.0,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    Tab(
                      text: "ALL CENTERS",
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height/2.5,
              //   width: MediaQuery.of(context).size.width/3.0,
              //   child: Row(

              //     children: const <Widget>[
              //       Card(child: ListTile(

              //         title: Text("5 Sessions"),

              //       ),),
              //     ],
              //   ),

              // )

              // SizedBox(
              //   height: MediaQuery.of(context).size.height/2.5,

              //  child: Row(
              //    children: <Widget>[
              //      Column(
              //        crossAxisAlignment: CrossAxisAlignment.start,
              //        children: <Widget>[

              //          Text("5 Sessions",style:TextStyle(color: Colors.black,fontSize:18.0,),
              //          textAlign: TextAlign.left,
              //          ),
              //         Padding(
              //            padding: EdgeInsets.only(bottom: 10.0,),
              //          ),
              //          Text("₹ 7990", style:TextStyle(color: Colors.grey, decoration: TextDecoration.lineThrough,fontSize: 15.0,),

              //          ),
              //          Padding(
              //            padding: EdgeInsets.only(bottom: 5.0,),
              //          ),
              //          Text("₹ 6990", style: TextStyle(color: Colors.black, fontSize: 36.0,fontWeight: FontWeight.bold,),

              //          ),
              //          Padding(
              //            padding: EdgeInsets.only(bottom: 5.0,),
              //          ),
              //          Text("₹ 1398/session", style: TextStyle(color: Colors.grey, fontSize:12.0,),

              //          ),
              //          Padding(
              //            padding: EdgeInsets.only(bottom: 5.0,),
              //          ),

              //         ],
              //         ),

              //        ],

              //  ),
              //),
              Wrap(
                spacing: 5.0,
                children: <Widget>[
                  Chip(
                    label: RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                            text: '5 Sessions \n',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                            ),
                          ),
                          TextSpan(
                            text: '₹ 7490 \n',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              decoration: TextDecoration.lineThrough,
                              fontSize: 15.0,
                            ),
                          ),
                          TextSpan(
                            text: "₹ 6990 \n",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 36.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: "₹ 1398/session",
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.4),
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Chip(
                    label: RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                            text: '11 Sessions \n',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                            ),
                          ),
                          TextSpan(
                            text: '₹ 7490 \n',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              decoration: TextDecoration.lineThrough,
                              fontSize: 15.0,
                            ),
                          ),
                          TextSpan(
                            text: "₹ 1990 \n",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 36.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: "₹ 1354/session",
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.4),
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Chip(
                    label: RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                            text: '25 Sessions \n',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                            ),
                          ),
                          TextSpan(
                            text: '₹ 7490 \n',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              decoration: TextDecoration.lineThrough,
                              fontSize: 15.0,
                            ),
                          ),
                          TextSpan(
                            text: "₹ 8990 \n",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 36.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: "₹ 1354/session",
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.4),
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "SILVER TRAINER PACKS",
                          style: TextStyle(
                            color: Colors.black,
                            height: 22.0,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: 5.0,
                          ),
                        ),
                        Text(
                          "Cult Galleria",
                          style: TextStyle(
                            color: Colors.black,
                            height: 18.0,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    Tab(
                      text: "ALL CENTERS",
                    ),
                  ],
                ),
              ),

              Wrap(
                spacing: 5.0,
                children: <Widget>[
                  Chip(
                    label: RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                            text: '5 Sessions \n',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                            ),
                          ),
                          TextSpan(
                            text: '₹ 7490 \n',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              decoration: TextDecoration.lineThrough,
                              fontSize: 15.0,
                            ),
                          ),
                          TextSpan(
                            text: "₹ 6990 \n",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 36.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: "₹ 1398/session",
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.4),
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Chip(
                    label: RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                            text: '11 Sessions \n',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                            ),
                          ),
                          TextSpan(
                            text: '₹ 7490 \n',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              decoration: TextDecoration.lineThrough,
                              fontSize: 15.0,
                            ),
                          ),
                          TextSpan(
                            text: "₹ 1990 \n",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 36.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: "₹ 1354/session",
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.4),
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Chip(
                    label: RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                            text: '25 Sessions \n',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                            ),
                          ),
                          TextSpan(
                            text: '₹ 7490 \n',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              decoration: TextDecoration.lineThrough,
                              fontSize: 15.0,
                            ),
                          ),
                          TextSpan(
                            text: "₹ 8990 \n",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 36.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: "₹ 1354/session",
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.4),
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// class Workout extends StatefulWidget {
//   @override
//   _WorkoutState createState() => _WorkoutState();
// }

// class _WorkoutState extends State<JatinVamshiHome> {
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     VamshiHome:
//     return ListView(
//       children: <Widget>[
//         Text("to be done"),
//       ],
//     );
//   }
// }

// class Packages extends StatefulWidget {
//   @override
//   _PackagesState createState() => _PackagesState();
// }

// class _PackagesState extends State<JatinVamshiHome> {
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     VamshiHome:
//     return ListView(
//       children: <Widget>[
//         Text("to be done"),
//       ],
//     );
//   }
// }
