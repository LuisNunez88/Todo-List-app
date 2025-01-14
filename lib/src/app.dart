import 'package:flutter/material.dart';
import 'package:todo/src/ui/routes/pages.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do-List',
      initialRoute: '/',
      routes: appRoutes,
    );
  }
}
