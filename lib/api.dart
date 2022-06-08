import 'package:imdb/constants.dart';
import 'package:imdb/model/most_popular.dart';
import 'package:imdb/model/new_movie.dart';
import 'package:imdb/model/search_data.dart';

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:imdb/model/title_data.dart';

class Api {
  static final Api _instance = Api._internal();
  factory Api() {
    return _instance;
  }
  Api._internal();

  Future<SearchData> search(String expression) async {
    final response = await http
        .get(Uri.parse("https://imdb-api.com/API/Search/$apiKey/$expression"));
    if (response.statusCode == 200) {
      return SearchData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load search data");
    }
  }

  Future<TitleData> getMovieInformation(String id) async {
    final response = await http
        .get(Uri.parse("https://imdb-api.com/en/API/Title/$apiKey/$id"));
    if (response.statusCode == 200) {
      print("ok2000");
      return TitleData.fromJson(jsonDecode(response.body));
    } else {
      print("KO");
      throw Exception("Failed to load movie information");
    }
  }

  Future<MostPopular> getMostPopularMovies() async {
    print('get most pop movies');
    final response = await http.get(
        Uri.parse("https://imdb-api.com/en/API/MostPopularMovies/$apiKey"));
    if (response.statusCode == 200) {
      return MostPopular.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load most popular movies");
    }
  }

  Future<MostPopular> getMostPopularTVs() async {
    print('get most pop tvs');
    final response = await http
        .get(Uri.parse("https://imdb-api.com/en/API/MostPopularTVs/$apiKey"));
    if (response.statusCode == 200) {
      return MostPopular.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load most popular TVs");
    }
  }

  Future<NewMovie> getInTheatersMovies() async {
    final response = await http
        .get(Uri.parse("https://imdb-api.com/en/API/InTheaters/$apiKey"));
    if (response.statusCode == 200) {
      return NewMovie.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load in theaters movies");
    }
  }

  Future<NewMovie> getComingSoonMovies() async {
    final response = await http
        .get(Uri.parse("https://imdb-api.com/en/API/ComingSoon/$apiKey"));
    if (response.statusCode == 200) {
      return NewMovie.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load coming soon movies");
    }
  }
}
