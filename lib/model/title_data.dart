class TitleData {
  final String id;
  final String title;
  final String originalTitle;
  final String fullTitle;
  final String year;
  final String releaseDate;
  final String runtimeMins;
  final String? runtimeStr;
  final String plot;
  final String awards;
  final String image;
  final String type;
  final String directors;
  final String writers;
  final String genres;
  final String companies;
  final String languages;
  final String contentRating;
  final String imDbRating;
  final String imDbRatingVotes;
  final List<ActorShort>? actorList;
  //similars

  TitleData(
      {required this.id,
      required this.title,
      required this.originalTitle,
      required this.fullTitle,
      required this.year,
      required this.releaseDate,
      required this.runtimeMins,
      required this.runtimeStr,
      required this.plot,
      required this.awards,
      required this.image,
      required this.type,
      required this.directors,
      required this.writers,
      required this.genres,
      required this.companies,
      required this.languages,
      required this.contentRating,
      required this.imDbRating,
      required this.imDbRatingVotes,
      required this.actorList});

  factory TitleData.fromJson(Map<String, dynamic> json) {
    List<ActorShort> actorList = <ActorShort>[];
    if (json["actorList"] != null) {
      json["actorList"].forEach((v) {
        actorList.add(ActorShort.fromJson(v));
      });
    }
    return TitleData(
      id: json["id"],
      title: json["title"],
      originalTitle: json["originalTitle"],
      fullTitle: json["fullTitle"],
      year: json["year"],
      releaseDate: json["releaseDate"],
      runtimeMins: json["runtimeMins"],
      runtimeStr: json["runtimeStr"],
      plot: json["plot"],
      awards: json["awards"],
      image: json["image"],
      type: json["type"],
      directors: json["directors"],
      writers: json["writers"],
      genres: json["genres"],
      companies: json["companies"],
      languages: json["languages"],
      contentRating: json["contentRating"],
      imDbRating: json["imDbRating"],
      imDbRatingVotes: json["imDbRatingVotes"],
      actorList: actorList,
    );
  }
}

class ActorShort {
  final String id;
  final String image;
  final String name;
  final String asCharacter;

  ActorShort(
      {required this.id,
      required this.image,
      required this.name,
      required this.asCharacter});

  factory ActorShort.fromJson(Map<String, dynamic> json) {
    return ActorShort(
      id: json["id"],
      image: json["image"],
      name: json["name"],
      asCharacter: json["asCharacter"],
    );
  }
}

