import 'dart:convert';

import 'package:bloc_api_practice/models/users_model.dart';
import 'package:http/http.dart'as http;

class ApiServices {

  static Future<UsersModel?> getUsers ()async{
    var responce = await http.get(Uri.parse("https://dummyjson.com/users"));

    if (responce.statusCode == 200){
      UsersModel usersModel =UsersModel.fromJson(jsonDecode(responce.body));
      return usersModel ;

    }
    return null ;

  }
} 