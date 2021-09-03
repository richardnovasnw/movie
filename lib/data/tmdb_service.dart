import 'dart:convert';

import 'package:built_collection/src/list.dart';
import 'package:movieapp/core/services/movie_service.dart';
import 'package:http/http.dart' as http;
import 'package:movieapp/model/movie.dart';
import 'package:movieapp/model/cast.dart';
import 'package:movieapp/model/movie_list.dart';

class TmdbService implements MovieService {
  final String _url = 'https://api.themoviedb.org/3/movie';
  final String _urlPerson = 'https://api.themoviedb.org/3/person';

  final String _apiKey = '/?api_key=f4911b48dc62efbac89cf460adc3eeea';
  final String _language = 'language=en-US';
  final String _topRated = 'top_rated';
  final String _upComing = 'upcoming';
  final String _popular = 'popular';
  @override
  Future<void> dispose() {
    throw UnimplementedError();
  }

  @override
  Future<void> init() {
    throw UnimplementedError();
  }

  @override
  Future<BuiltList<Movie>> getRatedMovies(String page) {
    final String request = '$_url/$_topRated$_apiKey&$_language&page=$page';

    return getMovies(request);
  }

  @override
  Future<BuiltList<Movie>> getMovies(String requestUrl) async {
    final String request = requestUrl;
    final http.Response response = await http.get(Uri.parse(request));
    final Map<String, dynamic> jsonBody =
        json.decode(response.body) as Map<String, dynamic>;
    print(jsonBody);
    final MovieList? movieResponse = MovieList.fromJson(jsonBody);
    print(movieResponse);
    return movieResponse!.results;
  }

  //  final List results = jsonBody['results'] as List;
  //   List<Movie> movies = [];
  //   for (final d in results) {
  //     movies.add(Movie.fromJson(d as Map<String, dynamic>)!);
  //   }
  //   return movies.toBuiltList();
  // }

  @override
  Future<BuiltList<Movie>> getUpcomingMovies(String page) {
    final String request = '$_url/$_upComing$_apiKey&$_language&page=$page';

    return getMovies(request);
  }

  @override
  Future<BuiltList<Movie>> getNowPlayingMovies(String page) {
    final String request = '$_url/$_popular$_apiKey&$_language&page=$page';

    return getMovies(request);
  }

  @override
  Future<BuiltList<Cast>> cast(String id) async {
    final String request =
        '$_url/$id/credits?api_key=f4911b48dc62efbac89cf460adc3eeea';
    final http.Response response = await http.get(Uri.parse(request));
    print(response);
    final Map<String, dynamic> jsonBody =
        json.decode(response.body) as Map<String, dynamic>;
    print(jsonBody);
    final MovieList? movieResponse = MovieList.fromJson(jsonBody);
    print(movieResponse);
    return movieResponse!.cast;
  }

  @override
  Future<BuiltList<Movie>> recommend(int id) {
    final String request =
        '$_url/$id/recommendations?api_key=f4911b48dc62efbac89cf460adc3eeea&$_language&page=1';
    print(request);
    return getMovies(request);
  }

  @override
  Future<BuiltList<Cast>> castDetailMovie(int id) async {
    final String request =
        '$_urlPerson/$id/movie_credits?api_key=f4911b48dc62efbac89cf460adc3eeea&$_language';
    print(request);
    final http.Response response = await http.get(Uri.parse(request));
    print(response);
    final Map jsonBody = json.decode(response.body) as Map;
    print(jsonBody);
    final MovieList? movieResponse = MovieList.fromJson(jsonBody);
    print(movieResponse!.cast);
    return movieResponse.cast;
  }

  @override
  Future<BuiltList<Cast>> castDetailTv(int id) async {
    final String request =
        '$_urlPerson/$id/tv_credits?api_key=f4911b48dc62efbac89cf460adc3eeea&$_language';
    final http.Response response = await http.get(Uri.parse(request));
    final Map jsonBody = json.decode(response.body) as Map;
    print(jsonBody);
    final MovieList? movieResponse = MovieList.fromJson(jsonBody);
    print(movieResponse!.cast);
    return movieResponse.cast;
  }
}
