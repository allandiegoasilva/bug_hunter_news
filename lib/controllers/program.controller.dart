import 'dart:convert';

import 'package:bug_hunter_news/constants/api_route.dart';
import 'package:bug_hunter_news/constants/auth.request.dart';
import 'package:bug_hunter_news/constants/program.type.dart';
import 'package:bug_hunter_news/constants/status.code.dart';

import '../model/program.dart';

class ProgramController {
  var request = AuthRequest();

  Future<List<Program>> read({int? platformId = null}) async {
    var response = await request.get(
        ApiRoute.base_url + ApiRoute.program + (platformId ?? "").toString());
    var data = jsonDecode(response.body);

    List<Program> programs = [];

    data["data"].forEach((item) {
      var program = Program(
        id: item["id"],
        title: item["title"],
        image: item["image"],
        launch: item["launch"],
        link: item["link"],
        avarage_bounty: item["avarage_bounty"],
        description: item["description"],
        low_min: item["low_min"],
        medium_min: item["medium_min"],
        high_min: item["high_min"],
        private: item["private"] == ProgramStatus.PRIVATE,
        platform_id: item["platform_id"],
        id_program: item["id_program"],
        platform_name: item["platform_name"],
        favorite: item["favorite"] == ProgramStatus.FAVORITE,
        scopes: item["scopes"],
      );

      programs.add(program);
    });

    return programs;
  }

  Future<void> favorite(int programId) async {
    await request.post(
        ApiRoute.base_url + ApiRoute.program_favorite + programId.toString());
  }

  Future<void> unfavorite(int programId) async {
    await request.delete(ApiRoute.base_url +
        ApiRoute.remove_program_favorite +
        programId.toString());
  }
}
