library app_state;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:movieapp/model/movie.dart';
import 'package:movieapp/model/cast.dart';
import 'package:movieapp/model/serializer.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  AppState._();

  factory AppState([Function(AppStateBuilder b) updates]) = _$AppState;

  String toJson() {
    return json.encode(serializers.serializeWith(AppState.serializer, this));
  }

  static AppState? fromJson(dynamic jsonString) {
    return serializers.deserializeWith(AppState.serializer, jsonString);
  }

  BuiltList<Movie> get movies;
  BuiltList<Cast> get cast;

  static Serializer<AppState> get serializer => _$appStateSerializer;
}
