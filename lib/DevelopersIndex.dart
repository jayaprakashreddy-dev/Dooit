import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class DevelopersIndex extends StatefulWidget{
  @override
  _DevelopersIndexState createState() => _DevelopersIndexState();
}

class _DevelopersIndexState extends State<DevelopersIndex> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
    Scaffold(
      
      appBar: AppBar(
        title: Text("Developers Index"),
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                Text("\n\n\n"),
                RaisedButton(
                  child: Text("Sanketh"),
                  onPressed: (){
                    Navigator.pushNamed(context, "SankethHome");
                  },
                ),
                RaisedButton(
                  child: Text("Laxma"),
                  onPressed: (){
                    Navigator.pushNamed(context, "LaxmaHome");
                  },
                ),
                RaisedButton(
                  child: Text("Jatin"),
                  onPressed: (){
                    Navigator.pushNamed(context, "JatinHome");
                  },
                ),
                RaisedButton(
                  child: Text("Vamshi"),
                  onPressed: (){
                    Navigator.pushNamed(context, "VamshiHome");
                  },
                ),
              ],
            ),
          )
        ],
  
      ),
      
    )
    );
  }
}