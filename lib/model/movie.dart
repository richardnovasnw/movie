library movie;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:movieapp/model/serializer.dart';

part 'movie.g.dart';

abstract class Movie implements Built<Movie, MovieBuilder> {
  factory Movie([Function(MovieBuilder b) updates]) = _$Movie;
  Movie._();
  String toJson() {
    return json.encode(serializers.serializeWith(Movie.serializer, this));
  }

  static Movie? fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(Movie.serializer, json.decode);
  }

  @BuiltValueField(wireName: 'poster_path')
  String? get posterPath;
  int? get id;
  String? get title;
  @BuiltValueField(wireName: 'vote_average')
  double? get voteAverage;
  String? get overview;
  @BuiltValueField(wireName: 'original_title')
  String? get name;
  @BuiltValueField(wireName: 'backdrop_path')
  String? get profilePath;
  int? get revenue;
  int? get runtime;
  String? get status;
  bool? get adult;
  int? get budget;
  @BuiltValueField(wireName: 'release_date')
  String? get releaseDate;
  @BuiltValueField(wireName: 'original_language')
  String? get originalLanguage;
  double? get popularity;
  @BuiltValueField(wireName: 'vote_count')
  int? get voteCount;

  static Serializer<Movie> get serializer => _$movieSerializer;
}
