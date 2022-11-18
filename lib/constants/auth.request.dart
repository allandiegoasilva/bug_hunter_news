import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

class AuthRequest {
  Future<http.Response> get(String uri, [Map body = const {}]) async {
    var url = Uri.parse(uri);
    var header = await getHeader();
    var response = await http.get(url, headers: header);
    return response;
  }

  Future<http.Response> post(String uri, [Map body = const {}]) async {
    var url = Uri.parse(uri);

    var header = await getHeader();
    var resp = http.post(url, headers: header, body: jsonEncode(body));

    return resp;
  }

  Future<http.Response> put(String uri, [Map body = const {}]) async {
    var url = Uri.parse(uri);
    var header = await getHeader();
    var resp = http.put(url, headers: header, body: jsonEncode(body));
    return resp;
  }

  Future<http.Response> delete(String uri, [Map body = const {}]) async {
    var url = Uri.parse(uri);
    var header = await getHeader();
    var resp = http.delete(url, headers: header, body: jsonEncode(body));

    return resp;
  }

  Future<Map<String, String>> getHeader() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");

    return {
      HttpHeaders.authorizationHeader: "Bearer $token",
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }
}
