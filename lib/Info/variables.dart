// class Data {
//   main() {
//     gl
//   }
// }


import 'package:flutter/cupertino.dart';

final TextEditingController OtpEntered =new TextEditingController();
final TextEditingController MobileNumber =new TextEditingController();
// bool isLogged=false;
var token=null;
var UserName="No User Name";
var EmailId="No Email";
var ReferralCode="No Code";
var coins="0";
var City;
var UserCity;
bool login=false;
var SelectedCity="Mumbai";
var now=DateTime.now();
var DayAfter;
var SelectedId="5dcaebb32fadc609ce3254cb";
var centers;
var SelectedCenter;
var SelectedIdAddress;
var SelectedIdName;
var Packages;
int temp;



TextEditingController UserNameController =new TextEditingController();
TextEditingController EmailIdController =new TextEditingController();
TextEditingController ReferralCodeController =new TextEditingController();
const url="http://34.93.104.9:3000/api";