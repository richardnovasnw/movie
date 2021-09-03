import 'package:flutter/material.dart';
import 'package:movieapp/model/app_state.dart';
import 'package:movieapp/model/movie.dart';
import 'package:movieapp/provider/app_state_notifier.dart';
import 'package:movieapp/views/info_page.dart';
import 'package:provider/provider.dart';

class ListSearch extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<ListSearch> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AppStateNotifier>().now();
  }

  String name = "";
  final String imageUrl = 'https://image.tmdb.org/t/p/w500/';

  @override
  Widget build(BuildContext context) {
    final AppState state = context.watch<AppState>();

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_left,
                      size: 28.0,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(2),
            margin: EdgeInsets.all(5),
            child: TextField(
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                  labelText: 'Search',
                  labelStyle: TextStyle(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide: BorderSide(color: Colors.white)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide: BorderSide(color: Colors.white))),
              onChanged: (string) {
                setState(() {
                  name = string;
                  print('my text is :$name');
                });
              },
            ),
          ),
          Expanded(
              child: name.isNotEmpty
                  ? ListView.builder(
                      itemCount: state.movies.length,
                      itemBuilder: (context, index) {
                        final Movie movie = state.movies[index];
                        return movie.title!.contains(name) == true
                            ? GestureDetector(
                                onTap: () {
                                  Navigator.push<void>(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          InfoPage(detail: movie),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Container(
                                    margin: EdgeInsets.all(9.0),
                                    padding: EdgeInsets.all(6.0),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor:
                                              Colors.green.shade200,
                                          foregroundImage: NetworkImage(
                                              '$imageUrl${movie.posterPath}'),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Text(
                                              '${movie.title}',
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : FractionallySizedBox(
                                widthFactor: 0.0000001,
                              );
                      },
                    )
                  : FractionallySizedBox(
                      widthFactor: 0.0000001,
                    ))
        ],
      ),
    ));
  }
}
