class MostPopular {
  List<MostPopularDetail>? items;
  String? errorMessage;

  MostPopular({this.items, this.errorMessage});

  MostPopular.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <MostPopularDetail>[];
      json['items'].forEach((v) {
        items!.add(MostPopularDetail.fromJson(v));
      });
    }
    errorMessage = json['errorMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['errorMessage'] = errorMessage;
    return data;
  }
}

class MostPopularDetail {
  String? id;
  String? rank;
  String? rankUpDown;
  String? title;
  String? fullTitle;
  String? year;
  String? image;
  String? crew;
  String? imDbRating;
  String? imDbRatingCount;

  MostPopularDetail(
      {this.id,
      this.rank,
      this.rankUpDown,
      this.title,
      this.fullTitle,
      this.year,
      this.image,
      this.crew,
      this.imDbRating,
      this.imDbRatingCount});

  MostPopularDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rank = json['rank'];
    rankUpDown = json['rankUpDown'];
    title = json['title'];
    fullTitle = json['fullTitle'];
    year = json['year'];
    image = json['image'];
    crew = json['crew'];
    imDbRating = json['imDbRating'];
    imDbRatingCount = json['imDbRatingCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['rank'] = rank;
    data['rankUpDown'] = rankUpDown;
    data['title'] = title;
    data['fullTitle'] = fullTitle;
    data['year'] = year;
    data['image'] = image;
    data['crew'] = crew;
    data['imDbRating'] = imDbRating;
    data['imDbRatingCount'] = imDbRatingCount;
    return data;
  }
}
