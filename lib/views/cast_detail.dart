import 'package:built_collection/src/list.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/model/app_state.dart';
import 'package:movieapp/model/cast.dart';
import 'package:movieapp/model/movie.dart';
import 'package:movieapp/provider/app_state_notifier.dart';
import 'package:provider/provider.dart';

class CastDetail extends StatefulWidget {
  Cast castDetail;

  CastDetail({required this.castDetail}) : super();
  @override
  _CastDetailState createState() => _CastDetailState();
}

class _CastDetailState extends State<CastDetail> {
  @override
  void initState() {
    context.read<AppStateNotifier>().castMovie(widget.castDetail.id!);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final String imageUrl = 'https://image.tmdb.org/t/p/w500';

  @override
  Widget build(BuildContext context) {
    final AppState state = context.watch<AppState>();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 210,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Hero(
                          tag: 'cast$imageUrl${widget.castDetail.profilePath}',
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(
                              '$imageUrl${widget.castDetail.profilePath}',
                            ),
                          ),
                        ),
                        Text(
                          widget.castDetail.name!,
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                    decoration: const BoxDecoration(
                        gradient:
                            LinearGradient(colors: [Colors.red, Colors.blue])),
                  ),
                  centerTitle: true,
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(8),
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    isScrollable: true,
                    indicatorColor: Colors.teal,
                    tabs: <Widget>[
                      Tab(
                          child: Container(
                              width: MediaQuery.of(context).size.width / 3,
                              child: Icon(Icons.movie))),
                      Tab(
                          // ignore: sized_box_for_whitespace
                          child: Container(
                              width: MediaQuery.of(context).size.width / 3,
                              child: Icon(Icons.tv))),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: <Widget>[
              CastMovie(
                movie: state,
              ),
              CastTvshow()
            ],
          ),
        ),
      ),
    );
  }
}

class CastMovie extends StatefulWidget {
  AppState movie;

  CastMovie({required this.movie}) : super();

  @override
  _CastMovieState createState() => _CastMovieState();
}

class _CastMovieState extends State<CastMovie> {
  @override
  final String imageUrl = 'https://image.tmdb.org/t/p/w500/';

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          final Cast tvList = widget.movie.cast[index];
          if (widget.movie.cast == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Column(
              children: [
                Container(
                    color: Colors.grey[900],
                    child: Column(children: [
                      if (tvList.backdropPath == null)
                        Image.network(
                          'https://cdn.iconscout.com/icon/free/png-256/no-image-1771002-1505134.png',
                          fit: BoxFit.fill,
                        )
                      else
                        Image.network('$imageUrl${tvList.backdropPath}'),
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              tvList.title!,
                              style: TextStyle(color: Colors.white),
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      tvList.voteAverage!.toStringAsFixed(1),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                    Icon(Icons.star,
                                        size: 12, color: Colors.white)
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      tvList.releaseDate!.substring(0, 4),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                    Icon(Icons.calendar_today_outlined,
                                        size: 12, color: Colors.white)
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        subtitle: Text(
                          'Action, Adventure, Thriller',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ])),
              ],
            );
          }
        },
        shrinkWrap: true,
        itemCount: 10);
  }
}

class CastTvshow extends StatefulWidget {
  @override
  _CastTvshowState createState() => _CastTvshowState();
}

class _CastTvshowState extends State<CastTvshow> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
