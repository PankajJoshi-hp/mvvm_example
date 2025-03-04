class SuperHero {
  final String? name;
  final String? realName;
  final String? imageUrl;

  SuperHero({this.name, this.realName, this.imageUrl});

  factory SuperHero.fromJson(Map<String, dynamic> json) => SuperHero(
        name: json["name"],
        realName: json["realname"],
        imageUrl: json["imageurl"],
      );
}
