import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:ketulrastogidemo/models/movie_model.dart';

enum MovieType {
  NOW_PLAYING,
  TOP_RATED,
}

abstract class ServiceClass {
  Future<List<Movie>> getMovies(MovieType movieType);
  Future<List<Movie>> getNowPlayingMovies();
  Future<List<Movie>> getTopRatedMovies();
}

class MovieService extends ServiceClass with ChangeNotifier {
  String nowPlayingUrl =
      'https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed';
  String topRatedUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed';

  @override
  Future<List<Movie>> getMovies(MovieType movieType) async {
    http.Response response;
    if (movieType != null && movieType == MovieType.NOW_PLAYING) {
      response = await http.get(nowPlayingUrl);
    } else {
      response = await http.get(topRatedUrl);
    }
    Map<String, dynamic> data = json.decode(response.body);
    List<Movie> movieList =
        [...data['results']].map((item) => Movie.fromMap(item)).toList();
    return movieList;
  }

  @override
  Future<List<Movie>> getNowPlayingMovies() async {
    http.Response response = await http.get(nowPlayingUrl);
    Map<String, dynamic> data = json.decode(response.body);
    List<Movie> nowPlayingMovieList =
        [...data['results']].map((item) => Movie.fromMap(item)).toList();
    return nowPlayingMovieList;
  }

  @override
  Future<List<Movie>> getTopRatedMovies() async {
    http.Response response = await http.get(topRatedUrl);
    Map<String, dynamic> data = json.decode(response.body);
    List<Movie> topRatedMovieList =
        data['results'].map((item) => Movie.fromMap(item)).toList();
    return topRatedMovieList;
  }
}
