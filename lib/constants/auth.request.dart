import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

class AuthRequest {
  var header;
  var token;
  AuthRequest() {
    _setToken();

    header = {'Authorization': "Bearer $token"};
  }

  Future<http.Response> get(String uri, [Map body = const {}]) {
    var url = Uri.parse(uri);

    return http.get(url, headers: header);
  }

  Future<http.Response> post(String uri, [Map body = const {}]) {
    var url = Uri.parse(uri);

    return http.post(url, headers: header);
  }

  Future<http.Response> put(String uri, [Map body = const {}]) {
    var url = Uri.parse(uri);

    return http.put(url, headers: header);
  }

  Future<http.Response> delete(String uri, [Map body = const {}]) {
    var url = Uri.parse(uri);

    return http.delete(url, headers: header);
  }

  void _setToken() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    this.token = sharedPreferences.getString("token");
  }
}
