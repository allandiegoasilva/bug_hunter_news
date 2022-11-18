import 'dart:convert';
import 'dart:io';

import 'package:bug_hunter_news/constants/api_route.dart';
import 'package:bug_hunter_news/constants/auth.request.dart';
import 'package:bug_hunter_news/constants/status.code.dart';

class UserPlatform {
  var request = AuthRequest();

  Future<Map<dynamic, dynamic>> create(int platformId, String token) async {
    var body = {
      "platform_id": platformId,
      "token": token,
    };

    var response = await request.post(
        ApiRoute.base_url + ApiRoute.user_platform_create, body);

    var responseBody = jsonDecode(response.body);

    return {
      "created": responseBody["statusCode"] != StatusCode.Unauthorized,
      "message": responseBody["message"]
    };
  }

  Future<Map> update(int platformId, String token) async {
    var data = {
      "platform_id": platformId,
      "token": token,
    };

    var response = await request.put(
        ApiRoute.base_url + ApiRoute.user_platform_upate, data);

    var responseBody = jsonDecode(response.body);
    return {
      "updated": responseBody["statusCode"] != StatusCode.Unauthorized,
      "message": responseBody["message"]
    };
  }

  Future<Map> read(int? platformId) async {
    var response = await request.get(ApiRoute.base_url +
        ApiRoute.user_platform +
        (platformId ?? "").toString());

    var data = jsonDecode(response.body);
    return data;
  }
}
