
import 'dart:convert';

import 'package:e_pustakalay/Model/api_response.dart';
import 'package:e_pustakalay/constatnt.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/User.dart';
//login
Future<ApiResponse> loginUser(String email,String password) async{
  ApiResponse apiResponse=ApiResponse();
  try{
    final response= await http.post(
      Uri.parse(loginURL),
      headers: {'Accept' :'application/json'},
      body: {
        'email':email,
        'password':password
      }
    );

    switch(response.statusCode){
      case 200:
        apiResponse.data=User.fromJson(jsonDecode(response.body));
        break;
      case 422:
        final errors=jsonDecode(response.body)['data']['errors'];
        apiResponse.error=errors[errors.keys.elementAt(0)][0];
        break;
      case 500:
        apiResponse.error=jsonDecode(response.body)['msg'];
        break;
      default:
        apiResponse.error=somethingwrong;
        break;
    }
  }catch(e){
    apiResponse.error=serverERR;
  }

  return apiResponse;
}


//register
Future<ApiResponse> registerUser(String first_name,String last_name,String phone_no,String email,String password) async{
  ApiResponse apiResponse=ApiResponse();
  try{
    final response= await http.post(
        Uri.parse(registerURL),
        headers: {'Accept' :'application/json'},
        body: {
          'first_name':first_name,
          'last_name':last_name,
          'phone_no':phone_no,
          'email':email,
          'password':password,
          'password_confirmation':password
        }
    );

    switch(response.statusCode){
      case 200:
        print(jsonDecode(response.body));
        // apiResponse.data=User.fromJson(jsonDecode(response.body));
        break;
      case 422:
        final errors=jsonDecode(response.body)['data']['errors'];
        apiResponse.error=errors[errors.keys.elementAt(0)][0];
        break;
      case 500:
        apiResponse.error=jsonDecode(response.body)['msg'];
        break;
      default:
        apiResponse.error=somethingwrong;
        break;
    }
  }catch(e){
    apiResponse.error=serverERR;
  }
  return apiResponse;
}


//get_user
Future<ApiResponse> getuserDetail() async{
  ApiResponse apiResponse=ApiResponse();
  try{
    String token=await getToken();
    final response= await http.get(
        Uri.parse(userURL),
        headers: {
          'Accept' :'application/json',
          'Authorization':'Bearer $token'
        });

    switch(response.statusCode){
      case 200:
        apiResponse.data=User.fromJson(jsonDecode(response.body));
        break;
      // case 422:
      //   final errors=jsonDecode(response.body)['data']['errors'];
      //   apiResponse.error=errors[errors.keys.elementAt(0)][0];
      //   break;
      case 500:
        apiResponse.error=unauthorized;
        // apiResponse.error=jsonDecode(response.body)['msg'];
        break;
      default:
        apiResponse.error=somethingwrong;
        break;
    }
  }catch(e){
    apiResponse.error=serverERR;
  }
  return apiResponse;
}

//get token
Future<String> getToken() async{
  SharedPreferences pref=await SharedPreferences.getInstance();
  return pref.getString('token') ?? "";
}

// get user id
Future<int> getUserId() async{
  SharedPreferences pref =await SharedPreferences.getInstance();
  return pref.getInt('userid') ?? 0;
}

// logout
Future<bool> logout() async{
  SharedPreferences pref =await SharedPreferences.getInstance();
  return await pref.remove('token');
}