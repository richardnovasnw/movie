library serializer;


import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:movieapp/model/app_state.dart';
import 'package:movieapp/model/movie.dart';
import 'package:movieapp/model/cast.dart';
import 'package:movieapp/model/movie_list.dart';

part 'serializer.g.dart';

@SerializersFor(<Type>[AppState, MovieList, Movie])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
