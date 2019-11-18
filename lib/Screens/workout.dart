// import 'package:./ASizeModification.dart';
import '../Arrangements/SizeModification.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import '../icon/my_flutter_app_icons.dart';
// import '../image.dart';
import 'package:flutter/rendering.dart';
// import '../jatin/mQuery.dart';
import '../Info/variables.dart' as global;

class Workout extends StatefulWidget {
  @override
  _WorkoutState createState() => _WorkoutState();
}

class _WorkoutState extends State<Workout> {
  int photoIndex = 1;

  List<String> photos = [
    'images/gym_pic2.png',
    'images/gym_pic1.png',
  ];

  bool day = false;
  bool night = false;
  bool l = true;
  bool b = false, c = false, f = false;
 
 void  _l() {
    setState(() {
      l = c == true ? false : true;
      c = l == false ? false : true;
      // l = true;
      // c = false;
      //       b = false;

      // f = false;
    });
  }
   void _c() {
    setState(() {
      l = c==false ? true : false;
      c = l == true ? true : false;
      // c = true;
      //       b = false;

      // f = false;
    });
  }
 
  // void _b() {
  //   setState(() {
  //     l = false;
  //     b = true;
  //     c = false;
  //     f = false;
  //   });
  // }
  //  void _f () {
  //   setState(() {
  //     l = false;
  //     b = false;
  //     c = false;
  //     f = true;
  //   });
  // }


  void _previousImage() {
    setState(() {
      photoIndex = 0;
      // night = !day;
      night = day == false ? true : false;
      day = night == true ? true : false;
      night = photoIndex == 0 ? true : false;
      day = photoIndex == 1 ? false : true;
    });
  }

  void _nextImage() {
    setState(() {
      // day = !night;
      //  night=true;
      photoIndex = 1;
      day = night == true ? false : true;
      night = day == false ? false : true;
      day = photoIndex == 1 ? false : true;
      night = photoIndex == 0 ? true : false;
    });
  }

  
  time(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return new Container(
            height: MediaQuery.of(context).size.height * 0.49,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.012,
            ),
            child: Column(
              children: <Widget>[
                new Container(
                  height: MediaQuery.of(context).size.height * 0.09,
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.0,
                    left: MediaQuery.of(context).size.width * 0.03,
                  ),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Gold Trainer Sessions',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.height * 0.03,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Wed 30 Oct 6:00 A.M-6:50 A.M ',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontSize:
                                MediaQuery.of(context).size.height * 0.022,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                           global.SelectedIdName!=null?global.SelectedIdName:"Select Active center",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontSize:
                                MediaQuery.of(context).size.height * 0.022,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                new Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.012,
                    left: MediaQuery.of(context).size.width * 0.05,
                  ),
                  color: Colors.grey.withOpacity(0.2),
                  height: MediaQuery.of(context).size.height * 0.09,
                  width: MediaQuery.of(context).size.width * 1.0,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Address:                                                           ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.height * 0.025,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '2nd Floor, Galleria Market, DLF Phase 4, Sector 28, Gurugram - 122002 ',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                        ),
                      ),
                    ],
                  ),
                ),
                new Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.008,
                    left: MediaQuery.of(context).size.width * 0.05,
                  ),
                  color: Colors.grey.withOpacity(0.2),
                  height: MediaQuery.of(context).size.height * 0.26,
                  width: MediaQuery.of(context).size.width * 1.0,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Select Preferences                                                           ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.height * 0.025,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            OutlineButton(
                              borderSide: BorderSide(
                                color: l
                                      ? Colors.red
                                      : Colors.black,
                              ),
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(10.0)),
                              child: Text(
                                "LEGS",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.022,
                                ),
                              ),
                              onPressed:  (){},
                            ),
                            OutlineButton(
                              borderSide: BorderSide(
                                color: c
                                      ? Colors.red
                                      : Colors.black,
                              ),
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(10.0)),
                              child: Text(
                                "CHEST",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.022,
                                ),
                              ),
                              onPressed: (){}
                            ),
                            OutlineButton(
                              borderSide: BorderSide(
                                color: b
                                      ? Colors.red
                                      : Colors.black,
                              ),
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(10.0)),
                              child: Text(
                                "BACK BODY",
                                style: TextStyle(
                                  color:Colors.black,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.022,
                                ),
                              ),
                              onPressed: (){},
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 4.9),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              child: OutlineButton(
                                borderSide: BorderSide(
                                  color: f
                                      ? Colors.red
                                      : Colors.black,
                                ),
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(10.0)),
                                child: Text(
                                  "BICEPS",
                                  style: TextStyle(
                                    color:Colors.black,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.022,
                                  ),
                                ),
                                onPressed:(){},
                              ),
                            ),
                          ],
                        ),
                      ),
                      RaisedButton(
                        color: Colors.red,
                        padding: EdgeInsets.only(
                          // top:MediaQuery.of(context).size.height*0.3,
                          left: MediaQuery.of(context).size.width * 0.1,
                          right: MediaQuery.of(context).size.width * 0.1,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(27.0),
                        ),
                        child: Text(
                          'BOOK NOW',
                          style: TextStyle(
                            fontSize: SizeConfig.blockSizeVertical * 2.4,
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

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    home:
    return ListView(
      children: <Widget>[
        new Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 38,
            left: MediaQuery.of(context).size.width / 20,
            right: MediaQuery.of(context).size.width / 80,
          ),
          child: Row(
            children: <Widget>[
              new Container(
                height: MediaQuery.of(context).size.height / 12,
                width: MediaQuery.of(context).size.width / 2.2,
                //   padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 14,
                //   left: MediaQuery.of(context).size.width/5,),
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.only(
                    topLeft: new Radius.circular(10.0),
                    bottomLeft: new Radius.circular(10.0),
                  ),
                  color: Colors.deepPurple[600],
                ),

                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 39,
                  left: MediaQuery.of(context).size.width / 17,
                ),
                child: Text('ACTIVE PACKS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height / 43,
                    )),
              ),
              new Container(
                height: MediaQuery.of(context).size.height / 12,
                width: MediaQuery.of(context).size.width / 2.2,
                //   padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 14,
                //   left: MediaQuery.of(context).size.width/5,),
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.only(
                    topRight: new Radius.circular(10.0),
                    bottomRight: new Radius.circular(10.0),
                  ),
                  color: Colors.deepPurple[400],
                ),

                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 70,
                  left: MediaQuery.of(context).size.width / 27,
                ),
                child: Text('5 sliver Trainer Session(ST)',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height / 40,
                    )),
              ),
            ],
          ),
        ),
        new Container(
          height: MediaQuery.of(context).size.height * 0.08,
          width: MediaQuery.of(context).size.width * 0.98,
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 45,

            // left: MediaQuery.of(context).size.width / 40,
            // right: MediaQuery.of(context).size.width / 90,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Container(
                height: SizeConfig.blockSizeVertical * 8,
                width: SizeConfig.blockSizeHorizontal * 49.5,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('PREFERED CENTER',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: SizeConfig.blockSizeVertical * 2.6,
                          fontWeight: FontWeight.w600,
                        )),
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
              ),
              new Container(
                height: SizeConfig.blockSizeVertical * 8,
                width: SizeConfig.blockSizeHorizontal * 39,
                // padding: EdgeInsets.only(
                //   left: SizeConfig.blockSizeHorizontal * 0.98,
                // ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    InkWell(
                      child: 
                    Text('      All CENTERS',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          fontSize: SizeConfig.blockSizeVertical * 2.6,
                        )),
                        onTap: (){
                          Navigator.pushNamed(context, "Centers");
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        new Divider(),
        new Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    padding: EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal * 5.6,
                      right: SizeConfig.blockSizeHorizontal * 5.6,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                    ),
                    child: Text('Today',
                        style: TextStyle(
                            color: day ? Colors.deepPurple[300] : Colors.white,
                            fontSize: SizeConfig.blockSizeVertical * 2.6)),
                    onPressed: _nextImage,
                    elevation: 5.0,
                    color: day ? Colors.white : Colors.purple,
                    disabledColor: Colors.white,
                  ),
                  RaisedButton(
                    padding: EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal * 5.6,
                      right: SizeConfig.blockSizeHorizontal * 5.6,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                    ),
                    child: Text('Tommorow',
                        style: TextStyle(
                            color: day ? Colors.white : Colors.deepPurple[300],
                            fontSize: SizeConfig.blockSizeVertical * 2.6)),
                    onPressed: _previousImage,
                    elevation: 5.0,
                    color: night ? Colors.purple : Colors.white,
                  ),
                  RaisedButton(
                    padding: EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal * 5.6,
                      right: SizeConfig.blockSizeHorizontal * 5.6,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                    ),
                    child: Text('Friday',
                        style: TextStyle(
                            color: Colors.deepPurple[300],
                            fontSize: SizeConfig.blockSizeVertical * 2.6)),
                    color: Colors.white,
                    disabledColor: Colors.white,
                  )
                ],
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      image: DecorationImage(
                          image: AssetImage(photos[photoIndex]),
                          fit: BoxFit.fill)),
                  height: SizeConfig.blockSizeVertical * 25.0,
                  width: SizeConfig.blockSizeHorizontal * 80.0,
                ),
              ),
              new Container(
                  padding: EdgeInsets.only(
                    // top: MediaQuery.of(context).size.height / 38,
                    left: MediaQuery.of(context).size.width / 20,
                    right: MediaQuery.of(context).size.width / 80,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                        padding: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 1,
                          left: SizeConfig.blockSizeHorizontal * 2.6,
                          right: SizeConfig.blockSizeHorizontal * 2.6,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(9.0),
                        ),
                        onPressed: () =>
                         time(context),
                        child: Text('7:00Am',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: SizeConfig.blockSizeVertical * 1.9)),
                        color: Colors.white,
                        disabledColor: Colors.white,
                        elevation: 4.0,
                      ),
                      RaisedButton(
                        padding: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 1,
                          left: SizeConfig.blockSizeHorizontal * 2.6,
                          right: SizeConfig.blockSizeHorizontal * 2.6,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(9.0),
                        ),
                        onPressed: () => 
                        time(context),
                        child: Text('6:00Am',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: SizeConfig.blockSizeVertical * 1.9)),
                        color: Colors.white,
                        // disabledColor: Colors.white,
                        elevation: 4.0,
                      ),
                      RaisedButton(
                        padding: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 1,
                          left: SizeConfig.blockSizeHorizontal * 2.6,
                          right: SizeConfig.blockSizeHorizontal * 2.6,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(9.0),
                        ),
                        child: Text('more',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: SizeConfig.blockSizeVertical * 1.9)),
                        color: Colors.white,
                        disabledColor: Colors.white,
                        elevation: 5.0,
                      ),
                      RaisedButton(
                        padding: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 1,
                          left: SizeConfig.blockSizeHorizontal * 2.6,
                          right: SizeConfig.blockSizeHorizontal * 2.6,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(9.0),
                        ),
                        onPressed: () => time(context),
                        child: Text('6:00Am',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: SizeConfig.blockSizeVertical * 1.9)),
                        color: Colors.white,
                        disabledColor: Colors.white,
                        elevation: 4.0,
                      ),
                    ],
                  ))
            ],
          ),
        ),
        new Divider(),
        new Container(
          height: MediaQuery.of(context).size.height * 0.07,
          width: MediaQuery.of(context).size.width * 0.98,
          child: Row(
            children: <Widget>[
              new Container(
                height: SizeConfig.blockSizeVertical * 6,
                width: SizeConfig.blockSizeHorizontal * 47,
                child: Column(
                  children: <Widget>[
                    Text(
                      'UPCOMING',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: SizeConfig.blockSizeVertical * 2.6,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        new Container(
          height: MediaQuery.of(context).size.height * 0.14,
          width: MediaQuery.of(context).size.width * 0.100,
          child: Row(
            children: <Widget>[
              new Container(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.06,
                ),
                height: MediaQuery.of(context).size.height * 0.11,
                // width: MediaQuery.of(context).size.width*0.3,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset('images/gym_pic2.png'),
                  ],
                ),
              ),
              new Container(
                height: MediaQuery.of(context).size.height * 0.22,
                // width: MediaQuery.of(context).size.width*0.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '   Gold Trainer Sessions  ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: SizeConfig.blockSizeVertical * 2.6,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '    Wed 10 Oct,8:00 A.M ',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.blockSizeVertical * 2.1,
                      ),
                    ),
                    Text(
                       global.SelectedIdName!=null?"     "+global.SelectedIdName:"Select Active center",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.blockSizeVertical * 2.1,
                      ),
                    ),
                    FlatButton(
                      onPressed: () => cancel(context),
                      child: Text(
                        '    CANCEL ',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: SizeConfig.blockSizeVertical * 2.1,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        new Container(
          height: MediaQuery.of(context).size.height * 0.07,
          width: MediaQuery.of(context).size.width * 0.100,
          child: Row(
            children: <Widget>[
              new Container(
                height: SizeConfig.blockSizeVertical * 5,
                width: SizeConfig.blockSizeHorizontal * 47,
                child: Column(
                  children: <Widget>[
                    Text(
                      'COMPLETED',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: SizeConfig.blockSizeVertical * 2.6,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        new Container(
          height: MediaQuery.of(context).size.height * 0.12,
          width: MediaQuery.of(context).size.width * 0.100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Container(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.06,
                ),
                height: MediaQuery.of(context).size.height * 0.09,
                width: MediaQuery.of(context).size.width * 0.35,
                child: Row(
                  children: <Widget>[
                    Image.asset('images/gym_pic2.png'),
                  ],
                ),
              ),
              new Container(
                // padding: EdgeInsets.only(
                //   right: MediaQuery.of(context).size.width * 0.5,
                // ),
                height: MediaQuery.of(context).size.height * 0.09,
                // width: MediaQuery.of(context).size.width*0.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '  Gold Trainer Sessions ',
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: SizeConfig.blockSizeVertical * 2.6,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    Text(
                      '  Sun 27 Oct,8:00 A.M ',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.blockSizeVertical * 2.1,
                      ),
                    ),

                    Text(
                      '  Fusion Gym ',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.blockSizeVertical * 2.1,
                      ),
                    ),

                    // Text('    0/10 left                                 ',

                    // style:TextStyle(
                    //   color: Colors.red,
                    //   fontSize: SizeConfig.blockSizeVertical * 2.4,
                    //   fontWeight: FontWeight.w700,
                    // ),),
                  ],
                ),
              ),
            ],
          ),
        ),
        new Container(
          height: MediaQuery.of(context).size.height * 0.12,
          width: MediaQuery.of(context).size.width * 0.100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Container(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.06,
                ),
                height: MediaQuery.of(context).size.height * 0.09,
                // width: MediaQuery.of(context).size.width*0.3,

                child: Row(
                  children: <Widget>[
                    Image.asset('images/gym_pic2.png'),
                  ],
                ),
              ),
              new Container(
                height: MediaQuery.of(context).size.height * 0.09,
                // width: MediaQuery.of(context).size.width*0.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '  Gold Trainer Sessions',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: SizeConfig.blockSizeVertical * 2.6,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '  Tue 29 Nov,8:00 A.M',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.blockSizeVertical * 2.1,
                      ),
                    ),

                    Text(
                      '  Fusion Gym ',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.blockSizeVertical * 2.1,
                      ),
                    ),
                    // Text('    0/10 left                                 ',

                    // style:TextStyle(
                    //   color: Colors.red,
                    //   fontSize: SizeConfig.blockSizeVertical * 2.4,
                    //   fontWeight: FontWeight.w700,
                    // ),),
                  ],
                ),
              ),
            ],
          ),
        ),
        new Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height * 0.03,
          ),
          child: RaisedButton(
            elevation: 1.0,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Text('Show more +'),
              ],
            ),
            onPressed: () {},
          ),
        ),
        Center(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                image: DecorationImage(
                    image: AssetImage('images/how_it_works.png'),
                    fit: BoxFit.fill)),
            height: SizeConfig.blockSizeVertical * 35.0,
            width: SizeConfig.blockSizeHorizontal * 100.0,
          ),
        ),
      ],
    );
  }

  cancel(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return new Container(
            height: MediaQuery.of(context).size.height * 0.38,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.02,
            ),
            child: Column(
              children: <Widget>[
                new Container(
                  height: MediaQuery.of(context).size.height * 0.10,
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.0,
                    left: MediaQuery.of(context).size.width * 0.03,
                  ),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Gold Trainer Sessions',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.height * 0.03,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Wed 30 Oct 6:00 A.M-6:50 A.M ',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontSize:
                                MediaQuery.of(context).size.height * 0.025,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Cult galleria ',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontSize:
                                MediaQuery.of(context).size.height * 0.025,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                new Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.04,
                    left: MediaQuery.of(context).size.width * 0.05,
                  ),
                  color: Colors.grey.withOpacity(0.2),
                  height: MediaQuery.of(context).size.height * 0.24,
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
                        '2nd Floor, Galleria Market, DLF Phase 4, Sector 28, Gurugram - 122002 ',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                        ),
                      ),
                      RaisedButton(
                        color: Colors.red,
                        padding: EdgeInsets.only(
                          // top:MediaQuery.of(context).size.height*0.3,
                          left: MediaQuery.of(context).size.width * 0.1,
                          right: MediaQuery.of(context).size.width * 0.1,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(27.0),
                        ),
                        child: Text(
                          'CONFIRM CANCEL',
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
  

  time(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return new Container(
            height: MediaQuery.of(context).size.height * 0.49,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.012,
            ),
            child: Column(
              children: <Widget>[
                new Container(
                  height: MediaQuery.of(context).size.height * 0.09,
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.0,
                    left: MediaQuery.of(context).size.width * 0.03,
                  ),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Gold Trainer Sessions',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.height * 0.03,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Wed 30 Oct 6:00 A.M-6:50 A.M ',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontSize:
                                MediaQuery.of(context).size.height * 0.022,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Cult galleria ',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontSize:
                                MediaQuery.of(context).size.height * 0.022,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                new Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.012,
                    left: MediaQuery.of(context).size.width * 0.05,
                  ),
                  color: Colors.grey.withOpacity(0.2),
                  height: MediaQuery.of(context).size.height * 0.09,
                  width: MediaQuery.of(context).size.width * 1.0,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Address:                                                           ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.height * 0.025,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '2nd Floor, Galleria Market, DLF Phase 4, Sector 28, Gurugram - 122002 ',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                        ),
                      ),
                    ],
                  ),
                ),
                new Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.008,
                    left: MediaQuery.of(context).size.width * 0.05,
                  ),
                  color: Colors.grey.withOpacity(0.2),
                  height: MediaQuery.of(context).size.height * 0.26,
                  width: MediaQuery.of(context).size.width * 1.0,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Select Preferences                                                           ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.height * 0.025,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            OutlineButton(
                              borderSide: BorderSide(
                                color: l
                                      ? Colors.red
                                      : Colors.black,
                              ),
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(10.0)),
                              child: Text(
                                "LEGS",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.022,
                                ),
                              ),
                              onPressed:  (){},
                            ),
                            OutlineButton(
                              borderSide: BorderSide(
                                color: c
                                      ? Colors.red
                                      : Colors.black,
                              ),
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(10.0)),
                              child: Text(
                                "CHEST",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.022,
                                ),
                              ),
                              onPressed: (){}
                            ),
                            OutlineButton(
                              borderSide: BorderSide(
                                color: b
                                      ? Colors.red
                                      : Colors.black,
                              ),
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(10.0)),
                              child: Text(
                                "BACK BODY",
                                style: TextStyle(
                                  color:Colors.black,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.022,
                                ),
                              ),
                              onPressed: (){},
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 4.9),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              child: OutlineButton(
                                borderSide: BorderSide(
                                  color: f
                                      ? Colors.red
                                      : Colors.black,
                                ),
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(10.0)),
                                child: Text(
                                  "BICEPS",
                                  style: TextStyle(
                                    color:Colors.black,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.022,
                                  ),
                                ),
                                onPressed:(){},
                              ),
                            ),
                          ],
                        ),
                      ),
                      RaisedButton(
                        color: Colors.red,
                        padding: EdgeInsets.only(
                          // top:MediaQuery.of(context).size.height*0.3,
                          left: MediaQuery.of(context).size.width * 0.1,
                          right: MediaQuery.of(context).size.width * 0.1,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(27.0),
                        ),
                        child: Text(
                          'BOOK NOW',
                          style: TextStyle(
                            fontSize: SizeConfig.blockSizeVertical * 2.4,
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
  }}
