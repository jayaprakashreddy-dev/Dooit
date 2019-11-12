// class Data {
//   main() {
//     gl
//   }
// }


import 'package:flutter/cupertino.dart';

final TextEditingController OtpEntered =new TextEditingController();
final TextEditingController MobileNumber =new TextEditingController();
bool isLogged=false;
String token="r";
var UserName="";
var EmailId="j";
var ReferralCode="j";
var coins="0";


TextEditingController UserNameController =new TextEditingController();
TextEditingController EmailIdController =new TextEditingController();
TextEditingController ReferralCodeController =new TextEditingController();
const url="http://34.93.104.9:3000/api";