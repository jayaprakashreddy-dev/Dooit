import 'package:dooit/Jatin/Logo.dart';
import 'package:dooit/Jatin/NumberEntry.dart';
import 'package:dooit/Jatin/OtpEnter.dart';
import 'package:dooit/Success.dart';
import 'package:flutter/material.dart';
import './Jatin/JHome.dart';
// import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'DevelopersIndex.dart';
import 'Laxma/LHome.dart';
import 'Sanketh/SHome.dart';
import 'Vamshi/VHome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Index Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

 

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Logo(),
      debugShowCheckedModeBanner: false,
      routes: <String,WidgetBuilder>{
          'JatinHome':(BuildContext context) => new JatinHome(),
          'VamshiHome':(BuildContext context) => new VamshiHome(),
          'LaxmaHome':(BuildContext context) => new LaxmaHome(),
          // 'VamshiHome':(BuildContext context) => new Home(),
          'SankethHome':(BuildContext context) => new SankethHome(),
          'OtpPage':(BuildContext context) => new OtpEnter(),
           'NumberEntry':(BuildContext context) => new NumberEntry(),
           
           'Success':(BuildContext context) => new Success(),

      },
    );
  }
}