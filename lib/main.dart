import 'package:flutter/material.dart';
import 'package:rick_and_morty_world/pages/CharactersListPage.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick and Morty world',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: CharactersListPage(),
    );
  }
}
