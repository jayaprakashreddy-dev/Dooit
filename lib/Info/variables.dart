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
var EmailId="No Emal";
var ReferralCode="No Code";
var coins="0";
var City;
var UserCity;



TextEditingController UserNameController =new TextEditingController();
TextEditingController EmailIdController =new TextEditingController();
TextEditingController ReferralCodeController =new TextEditingController();
const url="http://34.93.104.9:3000/api";