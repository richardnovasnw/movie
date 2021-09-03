import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movieapp/model/app_state.dart';
import 'package:movieapp/model/movie.dart';
import 'package:movieapp/provider/app_state_notifier.dart';
import 'package:movieapp/views/search.dart';
import 'package:movieapp/views/ticket/new_booking.dart';
import 'package:provider/provider.dart';
// import 'package:movieapp/views/movie_page.dart';
// import 'package:movieapp/views/toprated.dart';
// import 'package:movieapp/views/upcoming.dart';

// ignore: use_key_in_widget_constructors
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  int _currentPage = 0;
  final PageController ctrl = PageController(
    viewportFraction: 0.60,
  );

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
    Size size = MediaQuery.of(context).size;

    final AppState state = context.watch<AppState>();
    final Movie c = state.movies[_currentPage];

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: Container(
              key: ValueKey<String>('$imageUrl${c.posterPath}'),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('$imageUrl${c.posterPath}'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.black.withOpacity(0.5),
                    Colors.black.withOpacity(0.5),
                    Colors.black.withOpacity(1)
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                ),
              ),
            ),
          ),
          PageView.builder(
            controller: ctrl,
            itemCount: state.movies.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              final bool active = index == _currentPage;

              final double blur = active ? 30 : 0;
              final double offset = active ? 20 : 0;
              final double top = active ? 360 : 435;
              final double bottom = active ? 70 : 30;
              final double right = active ? 7 : 20;
              final double left = active ? 7 : 20;
              final Movie movie = state.movies[index];

              return state.movies == null
                  ? Text('Loading')
                  : AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeOutQuint,
                      margin: EdgeInsets.only(
                          top: top, bottom: bottom, right: right, left: left),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                '$imageUrl${movie.posterPath}',
                              )),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black87,
                                blurRadius: blur,
                                offset: Offset(offset, offset))
                          ]),
                    );
            },
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * .12,
                      height: MediaQuery.of(context).size.width * .12,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white54, width: .5),
                          borderRadius: BorderRadius.circular(15.0)),
                      child: IconButton(
                          icon: Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                          onPressed: () {}),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .12,
                      height: MediaQuery.of(context).size.width * .12,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white54, width: .5),
                          borderRadius: BorderRadius.circular(15.0)),
                      child: IconButton(
                          onPressed: () {
                            Navigator.push<void>(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) => ListSearch(),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.search,
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 45,
                    width: size.width * 0.44,
                    child: Center(
                        child: Text('Popular with friends',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.bold))),
                    decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 45,
                    width: 47,
                    child: Center(
                        child: c.adult == true
                            ? const Text('18',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold))
                            : const Text('U',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold))),
                    decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 45,
                    width: 60,
                    child: Center(
                        child: Text(c.voteAverage!.toStringAsFixed(1),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 11,
                                fontWeight: FontWeight.bold))),
                    decoration: BoxDecoration(
                        color: Colors.yellow[800],
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(c.releaseDate!.substring(0, 4),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.circle_rounded,
                    color: Colors.yellow[700],
                    size: 5,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Crime, Drame, Thriller',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.circle_rounded,
                    color: Colors.yellow[700],
                    size: 5,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Dolby Digital',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                      primary: Colors.redAccent[700]),
                  onPressed: () {
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => NewBooking(),
                      ),
                    );
                  },
                  child: Text('BUY TICKET',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold))),
            ],
          ),
          Positioned(
            bottom: 38,
            child: Text(
              c.name!,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
          )
        ],
      ),
    );
  }
}
    


 // SizedBox(
                  //   width: size.width * 0.7,
                  //   child: TextField(
                  //     decoration: InputDecoration(
                  //         suffixIcon: IconButton(
                  //           icon: Icon(
                  //             Icons.search,
                  //           ),
                  //           onPressed: () {},
                  //         ),
                  //         border: OutlineInputBorder(
                  //             borderRadius:
                  //                 BorderRadius.all(Radius.circular(15.0)))),
                  //   ),





















//      DefaultTabController(
//       length: 3,
//       child: Scaffold(
//           key: _key,
//           drawer: NavDrawer(),
//           body: NestedScrollView(
//             headerSliverBuilder:
//                 (BuildContext context, bool innerBoxIsScrolled) {
//               return <Widget>[
//                 SliverAppBar(
//                   elevation: 0,
//                   backgroundColor: Colors.black,
//                   leading: IconButton(
//                       onPressed: () {
//                         _key.currentState!.openDrawer();
//                       },
//                       icon: const Icon(Icons.menu, color: Colors.white)),
//                   title: const Text(
//                     'Book Movie',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   pinned: true,
//                   floating: true,
//                   bottom: PreferredSize(
//                     preferredSize: const Size.fromHeight(48),
//                     child: TabBar(
//                       isScrollable: true,
//                       indicatorColor: Colors.teal,
//                       tabs: <Widget>[
//                         const Tab(
//                             child: SizedBox(
//                                 width: 90,
//                                 child: Center(
//                                     child: Text(
//                                   'Now Playing',
//                                   style: TextStyle(color: Colors.white),
//                                 )))),
//                         const Tab(
//                             child: SizedBox(
//                                 width: 90,
//                                 child: Center(
//                                     child: Text(
//                                   'Top Rated',
//                                   style: TextStyle(color: Colors.white),
//                                 )))),
//                         Tab(
//                             // ignore: sized_box_for_whitespace
//                             child: Container(
//                                 width: 90,
//                                 child: const Center(
//                                     child: Text(
//                                   'Upcoming',
//                                   style: TextStyle(color: Colors.white),
//                                 )))),
//                       ],
//                     ),
//                   ),
//                 ),
//               ];
//             },
//             body: TabBarView(
//               children: <Widget>[
//                 NowPlaying(),
//                 TopRated(),
//                 UpComing(),
//               ],
//             ),
//           )),
//     );
//   }
// }

// class NavDrawer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: <Widget>[
//           DrawerHeader(
//             child: const Text(
//               'Book Home',
//               style: TextStyle(color: Colors.white, fontSize: 25),
//             ),
//             decoration: BoxDecoration(
//               color: Colors.red[900],
//             ),
//           ),
//           ListTile(
//             leading: const Icon(Icons.favorite),
//             title: const Text('My Favourite'),
//             onTap: () => <void>{},
//           ),
//           ListTile(
//             leading: const Icon(Icons.movie),
//             title: const Text('Movies'),
//             onTap: () {
//               Navigator.of(context).pop();
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.settings),
//             title: const Text('Settings'),
//             onTap: () {
//               Navigator.of(context).pop();
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.border_color),
//             title: const Text('Feedback'),
//             onTap: () => Navigator.of(context).pop(),
//           ),
//           ListTile(
//             leading: const Icon(Icons.exit_to_app),
//             title: const Text('Logout'),
//             onTap: () => Navigator.of(context).pop(),
//           ),
//         ],
//       ),
//     );
//   }
// }
