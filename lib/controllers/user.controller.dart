import 'dart:convert';

import 'package:bug_hunter_news/constants/api_route.dart';
import 'package:bug_hunter_news/constants/status.code.dart';
import 'package:bug_hunter_news/model/User.dart';
import 'package:http/http.dart' as http;

class UserController {
  Future<Map> auth(User user) async {
    bool validCredentials = false;

    var url = Uri.parse(ApiRoute.base_url + ApiRoute.authenticate);
    final response = await http.post(url, body: {
      "email": user.email,
      "password": user.password,
      "accept_terms": 'true'
    });
    var body = jsonDecode(response.body);

    return {
      "authenticated": response.statusCode == StatusCode.Ok,
      "data": body["data"],
      "message": body["message"]
    };
  }

  Future<Map<String, dynamic>> register(User user) async {
    var uri = Uri.parse(ApiRoute.base_url + ApiRoute.register);

    var response = await http.post(uri, body: {
      "email": user.email,
      "password": user.password,
      "accept_terms": true.toString()
    });

    var data = jsonDecode(response.body);

    var registered = response.statusCode == StatusCode.Created;
    return {
      "registered": registered,
      "message": data["message"],
      "token": registered ? data["data"]["token"] : null
    };
  }
}
