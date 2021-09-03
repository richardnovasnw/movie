import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movieapp/model/app_state.dart';
import 'package:movieapp/model/movie.dart';
import 'package:movieapp/model/cast.dart';
import 'package:movieapp/provider/app_state_notifier.dart';
import 'package:movieapp/views/cast_detail.dart';
import 'package:movieapp/views/ticket/booking.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class InfoPage extends StatefulWidget {
  Movie detail;

  InfoPage({required this.detail}) : super();
  @override
  State<StatefulWidget> createState() => _InfoPageState(detail);
}

class _InfoPageState extends State<InfoPage> {
  final String imageUrl = 'https://image.tmdb.org/t/p/w500/';

  Movie detail;

  _InfoPageState(this.detail);

  @override
  void initState() {
    context.read<AppStateNotifier>().cast(detail.id.toString());
    context.read<AppStateNotifier>().recommendation(detail.id!);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size media = MediaQuery.of(context).size;
    final AppState state = context.watch<AppState>();
    return Scaffold(
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        body: detail == null
            ? const Center(child: CircularProgressIndicator())
            : NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                        leading: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(Icons.arrow_back)),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            TextButton(
                              child: const Text('Book Ticket',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              onPressed: () {
                                showModalBottomSheet<void>(
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        height: 250,
                                        color: Colors.grey[800],
                                        child: Center(
                                          child: Column(
                                            children: <Widget>[
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  const Text('How many seats',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      )),
                                                  DropdownButton<String>(
                                                    items: <String>[
                                                      '1',
                                                      '2',
                                                      '3',
                                                      '4'
                                                    ].map((String value) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: value,
                                                        child: Text(value),
                                                      );
                                                    }).toList(),
                                                    onChanged: (context) {},
                                                  )
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 30,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                // ignore: prefer_const_literals_to_create_immutables
                                                children: <Widget>[
                                                  const Text(
                                                    'Balcony\nRs 150.0\nAvailable',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  const SizedBox(
                                                    width: 30,
                                                  ),
                                                  const Text(
                                                    'First Class\nRs 120.0\nAvailable',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 30,
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.push<void>(
                                                          context,
                                                          MaterialPageRoute<void>(
                                                            builder: (BuildContext
                                                                    context) =>
                                                                BuyTicket(),
                                                          ))
                                                      .then((value) =>
                                                          Navigator.of(context)
                                                              .pop());
                                                },
                                                child: const Text(
                                                  'Select Seats',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
                            ),
                          ],
                        ),
                        automaticallyImplyLeading: false,
                        backgroundColor: Colors.transparent,
                        expandedHeight: 200,
                        elevation: 0,
                        pinned: true,
                        floating: false,
                        flexibleSpace: FlexibleSpaceBar(
                            centerTitle: false,
                            background: Stack(
                              children: [
                                Image.network(
                                  '$imageUrl${detail.profilePath}',
                                  width: MediaQuery.of(context).size.width,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12, bottom: 40),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Container(
                                              height: 20,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Colors.deepOrange),
                                              child: Center(
                                                child: Text(
                                                  detail.releaseDate!
                                                      .substring(0, 4),
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Container(
                                              height: 20,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Colors.deepOrange),
                                              child: Center(
                                                child: Text(
                                                  detail.voteAverage!
                                                      .toStringAsFixed(1),
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        detail.title!,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )))
                  ];
                },
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Hero(
                            tag: 'grid$imageUrl${detail.posterPath}',
                            child: Image.network(
                                '$imageUrl${detail.posterPath}',
                                height: 180,
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
                        Column(
                          children: <Widget>[
                            const SizedBox(height: 30),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'SYNOPSIS',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    fontFamily: 'Arvo'),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(detail.overview!,
                                style: const TextStyle(
                                    color: Colors.white, fontFamily: 'Arvo')),
                            const SizedBox(height: 40),
                            Container(
                              color: Colors.grey[900],
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const Align(
                                      alignment: Alignment.topLeft,
                                      child: Text('Cast',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ))),
                                  const SizedBox(height: 20),
                                  SizedBox(
                                      height: (media.height - 50) / 5,
                                      child: state.cast == null
                                          ? Text('Loading...')
                                          : ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              shrinkWrap: true,
                                              itemCount: state.cast.length,
                                              itemBuilder:
                                                  (context, int index) {
                                                final Cast actor =
                                                    state.cast[index];
                                                return GestureDetector(
                                                  onTap: () {
                                                    Navigator.push<void>(
                                                      context,
                                                      MaterialPageRoute<void>(
                                                        builder: (BuildContext
                                                                context) =>
                                                            CastDetail(
                                                                castDetail:
                                                                    actor),
                                                      ),
                                                    );
                                                  },
                                                  child: (actor.profilePath ==
                                                          null)
                                                      ? Stack(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(5.0),
                                                              child:
                                                                  Image.network(
                                                                'https://cdn.iconscout.com/icon/free/png-256/profile-3904165-3236880.png',
                                                                width: 100,
                                                                fit:
                                                                    BoxFit.fill,
                                                              ),
                                                            ),
                                                            Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              alignment: Alignment
                                                                  .bottomCenter,
                                                              child: Text(
                                                                '${actor.name}',
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        11),
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      : Stack(
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      5),
                                                              child: Hero(
                                                                tag:
                                                                    'cast$imageUrl${actor.profilePath}',
                                                                child: Image.network(
                                                                    '$imageUrl${actor.profilePath}',
                                                                    loadingBuilder: (BuildContext
                                                                            context,
                                                                        Widget
                                                                            child,
                                                                        ImageChunkEvent?
                                                                            progress) {
                                                                  if (progress ==
                                                                      null) {
                                                                    return child;
                                                                  } else {
                                                                    return const Text(
                                                                        'loading...');
                                                                  }
                                                                }),
                                                              ),
                                                            ),
                                                            Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              alignment: Alignment
                                                                  .bottomCenter,
                                                              child: Text(
                                                                actor.name!,
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        11),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                );
                                              })),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Text('About',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Arvo',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: <Widget>[
                                        const Text(
                                          'Original Title :',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: 'Arvo'),
                                        ),
                                        const Text(
                                          'Language :',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: 'Arvo'),
                                        ),
                                        const Text(
                                          'Release Data :',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: 'Arvo'),
                                        ),
                                        const Text(
                                          'Popularity :',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: 'Arvo'),
                                        ),
                                        const Text(
                                          'Vote Count :',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: 'Arvo'),
                                        ),
                                        const Text(
                                          'Vote Average :',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: 'Arvo'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          detail.name!,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Arvo'),
                                        ),
                                        Text(detail.originalLanguage!,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Arvo')),
                                        Text(detail.releaseDate!,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Arvo')),
                                        Text(
                                            detail.popularity!
                                                .toStringAsFixed(1),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Arvo')),
                                        Text('${detail.voteCount}',
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Arvo')),
                                        Text(
                                            detail.voteAverage!
                                                .toStringAsFixed(1),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Arvo')),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Recommended Movies',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Arvo',
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                        GridView.builder(
                            primary: false,
                            itemCount: 8,
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              childAspectRatio: 0.6,
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 5,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              final AppState state = context.watch<AppState>();

                              final Movie rec = state.movies[index];
                              return Image.network('$imageUrl${rec.posterPath}',
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
                              });
                            })
                      ],
                    ),
                  ),
                ),
              ));
  }
}
