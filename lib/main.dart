import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:movieapp/model/app_state.dart';
import 'package:movieapp/provider/app_state_notifier.dart';
import 'package:movieapp/views/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        StateNotifierProvider<AppStateNotifier, AppState>(
          create: (_) => AppStateNotifier()..init(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Home(),
    );
  }
}
//edited