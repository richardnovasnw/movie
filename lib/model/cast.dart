library cast;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:movieapp/model/serializer.dart';

part 'cast.g.dart';

abstract class Cast implements Built<Cast, CastBuilder> {
  factory Cast([Function(CastBuilder b) updates]) = _$Cast;
  Cast._();
  String toJson() {
    return json.encode(serializers.serializeWith(Cast.serializer, this));
  }

  static Cast? fromJson(dynamic jsonString) {
    return serializers.deserializeWith(Cast.serializer, json.decode);
  }

  @BuiltValueField(wireName: 'backdrop_path')
  String? get backdropPath;
  @BuiltValueField(wireName: 'vote_average')
  double? get voteAverage;
  @BuiltValueField(wireName: 'release_date')
  String? get releaseDate;
  @BuiltValueField(wireName: 'genre_ids')
  BuiltList<int>? get genreIds;

  String? get name;
  String? get title;
  int? get id;

  @BuiltValueField(wireName: 'original_name')
  String? get originalName;
  double? get popularity;
  @BuiltValueField(wireName: 'known_for_department')
  String? get knownForDepartmant;
  int? get order;
  String? get character;

  @BuiltValueField(wireName: 'profile_path')
  String? get profilePath;
  String? get biography;
  String? get homepage;

  static Serializer<Cast> get serializer => _$castSerializer;
}
