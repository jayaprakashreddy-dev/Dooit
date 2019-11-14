
// // import 'dart:convert';

// // import 'package:http/http.dart' as http;
// // import 'package:http/http.dart';


// // class urls{
// //   static const Api_Url="http://34.93.104.9:3000/api";
// // }



// import 'dart:convert';
// import '../Info/variables.dart' as global;
// import 'package:http/http.dart' as http;
// // import 'package:flutter/cupertino.dart';


// // class ApiService{
// //   // static Future<List<dynamic>> getUser() async{

// //   //   final response= await http.get("${urls.Api_Url}/signup");

// //   //   if(response.statusCode==200)
// //   //   {
// //   //     return json.decode(response.body);
// //   //   }
// //   //   else{
// //   //     return null;
// //   //   }

// //   // }

// //   Future GetOtp (Map data)async {

// //             var jsonResponse;
// //             var response =await http.post("http://34.93.104.9:3000/api/signup",body: data);
// //             print("aftrer");
// //             if(response.statusCode==200)
// //             {
// //                jsonResponse = json.decode(response.body);
// //               // jsonData=json
// //               print(
// //               "s");

// //               print(jsonResponse);
// //               if(jsonResponse['success']==true)
// //               {
// //                 print("true");
// //                 return jsonResponse;
// //               }
// //               else{
// //                 print("smtg fishy");
// //               }
// //             }

          
// //   }

// // }


// class ApiService {


//                 Future CallPost()async{
//                     await   http.post(
//                                   "${global.url}/signup",
//                                   // "http://34.93.104.9:3000/api/signup",
//                                   body: json.encode({
//                                     "phone": global.MobileNumber.text
//                                   }),
//                               headers: {"Accept": "application/json","Content-type": "application/json",},
//                                ).then((http.Response response) {
//                                           return response;
//                                       }
//                                   );
//                         }
// }





import 'dart:convert';

import 'package:http/http.dart' as http;
import '../Info/variables.dart' as global;

class ApiService {

        static getCities() async {
          try {
            final response = await http.get('${global.url}/api/account/getcities',headers:{"Content-Type":"application/x-www-form-urlencoded","token":global.token});
            if (response.statusCode == 200) {
              print(response.body);
              return json.decode(response.body);
            } else {
              return null;
            }
          } catch (ex) {
            return null;
          }
        }

}
