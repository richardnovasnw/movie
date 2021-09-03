import 'package:built_collection/built_collection.dart';
import 'package:movieapp/data/tmdb_service.dart';
import 'package:movieapp/model/app_state.dart';
import 'package:movieapp/model/movie.dart';
import 'package:movieapp/model/cast.dart';
import 'package:movieapp/views/cast_detail.dart';
import 'package:state_notifier/state_notifier.dart';

class AppStateNotifier extends StateNotifier<AppState> {
  AppStateNotifier() : super(AppState());
  void init() {
    print('initializing');
    // state = state.rebuild((b) => b.movies = <Movie>[].toBuiltList().toBuilder());
  }

  Future<void> now() async {
    final BuiltList<Movie> n = await TmdbService().getNowPlayingMovies('1');
    state = state.rebuild((AppStateBuilder b) => b..movies = n.toBuilder());
  }

  Future<void> upComingMovie() async {
    final BuiltList<Movie> n = await TmdbService().getUpcomingMovies('1');
    state = state.rebuild((AppStateBuilder b) => b..movies = n.toBuilder());
  }

  Future<void> top() async {
    final BuiltList<Movie> n = await TmdbService().getRatedMovies('1');
    state = state.rebuild((AppStateBuilder b) => b..movies = n.toBuilder());
  }

  Future<void> cast(String i) async {
    final BuiltList<Cast> n = await TmdbService().cast(i);
    state = state.rebuild((AppStateBuilder b) => b..cast = n.toBuilder());
  }

 
   Future<void> recommendation(int i) async {
    final BuiltList<Movie> n = await TmdbService().recommend(i);
    state = state.rebuild((AppStateBuilder b) => b..movies = n.toBuilder());
  }

   Future<void> castMovie(int i) async {
    final BuiltList<Cast> n = await TmdbService().castDetailMovie(i);
    state = state.rebuild((AppStateBuilder b) => b..cast = n.toBuilder());
  }
  Future<void> castTv(int i) async {
    final BuiltList<Cast> n = await TmdbService().castDetailTv(i);
    state = state.rebuild((AppStateBuilder b) => b..cast = n.toBuilder());
  }
}
































