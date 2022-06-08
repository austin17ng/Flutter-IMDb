class NewMovie {
  List<NewMovieDetail>? items;
  String? errorMessage;

  NewMovie({this.items, this.errorMessage});

  NewMovie.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <NewMovieDetail>[];
      json['items'].forEach((v) {
        items!.add(NewMovieDetail.fromJson(v));
      });
    }
    errorMessage = json['errorMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['errorMessage'] = errorMessage;
    return data;
  }
}

class NewMovieDetail {
  String? id;
  String? title;
  String? fullTitle;
  String? year;
  String? releaseState;
  String? image;
  String? runtimeMins;
  String? runtimeStr;
  String? contentRating;
  String? imDbRating;
  String? imDbRatingCount;
  String? metacriticRating;
  String? genres;
  String? directors;
  String? stars;

  NewMovieDetail({
    this.id,
    this.title,
    this.fullTitle,
    this.year,
    this.releaseState,
    this.image,
    this.runtimeMins,
    this.contentRating,
    this.imDbRating,
    this.imDbRatingCount,
    this.metacriticRating,
    this.genres,
    this.directors,
    this.stars,
  });

  NewMovieDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    fullTitle = json['fullTitle'];
    year = json['year'];
    releaseState = json['releaseState'];
    image = json['image'];
    runtimeMins = json['runtimeMins'];
    runtimeStr = json['runtimeStr'];
    contentRating = json['contentRating'];
    imDbRating = json['imDbRating'];
    imDbRatingCount = json['imDbRatingCount'];
    metacriticRating = json['metacriticRating'];
    genres = json['genres'];
    directors = json['directors'];
    stars = json['stars'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['fullTitle'] = fullTitle;
    data['year'] = year;
    data['releaseState'] = releaseState;
    data['image'] = image;
    data['runtimeMins'] = runtimeMins;
    data['runtimeStr'] = runtimeStr;
    data['contentRating'] = contentRating;
    data['imDbRating'] = imDbRating;
    data['imDbRatingCount'] = imDbRatingCount;
    data['metacriticRating'] = metacriticRating;
    data['genres'] = genres;
    data['directors'] = directors;
    data['stars'] = stars;
    return data;
  }
}
