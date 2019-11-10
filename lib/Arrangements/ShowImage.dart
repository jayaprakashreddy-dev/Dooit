import 'package:dooit/Arrangements/SizeModification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
class ShowImage extends StatelessWidget{
  String img;
  ShowImage(this.img);
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage=AssetImage("images/$img.png");
    Image image=Image(
      image: assetImage,
        // width: 5.0,
        // height: 5.0,
      // width:  SizeConfig.blockSizeVertical * 35,
      // height: SizeConfig.blockSizeVertical * 25,
    );
    return Container(child:image);
  }
  
}