class SearchData {
  final String searchType;
  final String expression;
  final List<SearchResult> results;
  final String errorMessage;

  List<SearchResult> get searchResults {
    return results;
  }

  SearchData(
      {required this.searchType,
      required this.expression,
      required this.results,
      required this.errorMessage});

  factory SearchData.fromJson(Map<String, dynamic> json) {
    List<SearchResult> results = <SearchResult>[];
    if (json['results'] != null) {
      json['results'].forEach((v) {
        results.add(SearchResult.fromJson(v));
      });
    }
    return SearchData(
        searchType: json['searchType'],
        expression: json['expression'],
        results: results,
        errorMessage: json['errorMessage']);
  }

  @override
  String toString() {
    String resultStr = "";
    for (var element in results) {
      resultStr += "{$element} ";
    }
    return "$searchType $expression $errorMessage $resultStr";
  }
}

class SearchResult {
  final String id;
  final String resultType;
  final String image;
  final String title;
  final String description;

  SearchResult(
      {required this.id,
      required this.resultType,
      required this.image,
      required this.title,
      required this.description});

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    return SearchResult(
      id: json['id'],
      resultType: json['resultType'],
      image: json['image'],
      title: json['title'],
      description: json['description'],
    );
  }

  @override
  String toString() {
    return "$id $resultType $image $title $description";
  }
}

