class Program {
  int? id;
  String? title;
  String? image;
  String? launch;
  String? link;
  String? avarage_bounty;
  String? description;
  String? low_min;
  String? medium_min;
  String? high_min;

  bool? private;
  int? platform_id;
  int? id_program;
  String? platform_name;
  bool? favorite;
  List<dynamic> scopes = [];

  Program({
    required this.id,
    required this.title,
    required this.image,
    required this.launch,
    required this.link,
    required this.avarage_bounty,
    required this.description,
    required this.low_min,
    required this.medium_min,
    required this.high_min,
    required this.private,
    required this.platform_id,
    required this.id_program,
    required this.platform_name,
    required this.favorite,
    this.scopes = const [],
  });
}
