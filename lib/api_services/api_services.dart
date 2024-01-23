import 'dart:convert';

import 'package:bloc_api_practice/models/login_model.dart';
import 'package:bloc_api_practice/models/users_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  String baseUrl = "https://reqres.in";

  Future<LoginModel?> userLogin(String email, String pass) async {
    var responce = await http.post(Uri.parse("$baseUrl/api/login"),
        body: {"email": email, "password": pass});

    if (responce.statusCode == 200) {
      LoginModel loginModel = LoginModel.fromJson(jsonDecode(responce.body));
      return loginModel;
    }
    return null;
  }

  static Future<UsersModel?> getUsers() async {
    var responce = await http.get(Uri.parse("https://dummyjson.com/users"));

    if (responce.statusCode == 200) {
      UsersModel usersModel = UsersModel.fromJson(jsonDecode(responce.body));
      return usersModel;
    }
    return null;
  }
}
