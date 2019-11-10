
// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';


// class urls{
//   static const Api_Url="http://34.93.104.9:3000/api";
// }



import 'package:flutter/cupertino.dart';

class Controllers {

  String MobileNumberInput;
    
  // final TextEditingController MobileNumberInput=new TextEditingController();
  final TextEditingController OtpEnteredInput =new TextEditingController();
}


// class ApiService{
//   // static Future<List<dynamic>> getUser() async{

//   //   final response= await http.get("${urls.Api_Url}/signup");

//   //   if(response.statusCode==200)
//   //   {
//   //     return json.decode(response.body);
//   //   }
//   //   else{
//   //     return null;
//   //   }

//   // }

//   Future GetOtp (Map data)async {

//             var jsonResponse;
//             var response =await http.post("http://34.93.104.9:3000/api/signup",body: data);
//             print("aftrer");
//             if(response.statusCode==200)
//             {
//                jsonResponse = json.decode(response.body);
//               // jsonData=json
//               print(
//               "s");

//               print(jsonResponse);
//               if(jsonResponse['success']==true)
//               {
//                 print("true");
//                 return jsonResponse;
//               }
//               else{
//                 print("smtg fishy");
//               }
//             }
          
//   }

// }