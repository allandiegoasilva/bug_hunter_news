import 'package:bug_hunter_news/constants/api_route.dart';
import 'package:bug_hunter_news/constants/auth.request.dart';

class UserPlatform {
  var request = AuthRequest();

  Future<Map> apiToken(int? platform_id) async {
    var results = await request.get(
        ApiRoute.base_url + ApiRoute.user_platform + platform_id.toString());

    print(results);

    return {};
  }
}
