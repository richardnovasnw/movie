import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movieapp/model/app_state.dart';
import 'package:movieapp/model/movie.dart';
import 'package:movieapp/provider/app_state_notifier.dart';
import 'package:movieapp/views/info_page.dart';
import 'package:provider/provider.dart';

class NowPlaying extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  final String imageUrl = 'https://image.tmdb.org/t/p/w500/';

  @override
  void initState() {
    super.initState();
    context.read<AppStateNotifier>().now();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppState state = context.watch<AppState>();

    return Scaffold(
        backgroundColor: Colors.black,
        body: state.movies == null
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: GridView.builder(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.6),
                  itemBuilder: (BuildContext context, int index) {
                    final Movie movie = state.movies[index];
                    return GestureDetector(
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 9,
                            child: Hero(
                              tag: 'grid$imageUrl${movie.posterPath}',
                              child: Image.network(
                                  '$imageUrl${movie.posterPath}',
                                  fit: BoxFit.fill, loadingBuilder:
                                      (BuildContext context, Widget child,
                                          ImageChunkEvent? progress) {
                                return progress == null
                                    ? child
                                    : const LinearProgressIndicator(
                                        backgroundColor: Colors.black,
                                        minHeight: 80,
                                        color: Colors.white12,
                                      );
                              }),
                            ),
                          ),
                          Expanded(
                              child: GridTileBar(
                            title: Text(
                              movie.name!,
                              style: const TextStyle(fontSize: 11),
                            ),
                          ))
                        ],
                      ),
                      onTap: () {
                        Navigator.push<void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                InfoPage(detail: movie),
                          ),
                        );
                      },
                    );
                  },
                  itemCount: state.movies.length,
                ),
              ));
  }
}
