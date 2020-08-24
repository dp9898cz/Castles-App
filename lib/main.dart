import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/object_list_provider.dart';

import './screens/map_screen.dart';
import 'screens/list_of_object.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TowersList(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rozhledny',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'OpenSans',
      ),
      initialRoute: MapScreen.routeName,
      routes: {
        ListOfObjectsScreen.routeName: (context) => ListOfObjectsScreen(),
        MapScreen.routeName: (context) => MapScreen(),
      },
    );
  }
}
