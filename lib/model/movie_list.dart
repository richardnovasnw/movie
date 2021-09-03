library movie_list;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:movieapp/model/movie.dart';
import 'package:movieapp/model/cast.dart';
import 'package:movieapp/model/serializer.dart';

part 'movie_list.g.dart';

abstract class MovieList implements Built<MovieList, MovieListBuilder> {
  MovieList._();

  factory MovieList([Function(MovieListBuilder b) updates]) = _$MovieList;

  String toJson() {
    return json.encode(serializers.serializeWith(MovieList.serializer, this));
  }

  static MovieList? fromJson(dynamic jsonString) {
    return serializers.deserializeWith(MovieList.serializer, jsonString);
  }

  BuiltList<Movie> get results;
  BuiltList<Cast> get cast;
  static Serializer<MovieList> get serializer => _$movieListSerializer;
}
