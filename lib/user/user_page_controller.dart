import 'dart:async';
import 'dart:convert' as convert;

import 'package:get/get.dart';
import 'package:github/model/user.dart';
import 'package:http/http.dart' as http;

class UserPageController extends GetxController {
  Future<List<User>> getUsers() async {
    var url = Uri.https('api.github.com', '/users');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      List responseJson = convert.jsonDecode(response.body);
      return responseJson.map((value) => User.fromJson(value)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<User> getUser() async {
    var url = Uri.https('api.github.com', '/users/mvssba');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return User.fromJson(
          convert.jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load album');
    }
  }
}
