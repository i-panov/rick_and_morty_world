import 'package:flutter/material.dart';
import 'package:rick_and_morty_world/widgets/CharactersRibbon.dart';
import 'package:rick_and_morty_world/widgets/NavBar.dart';

class CharactersListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('Characters'),
      ),
      body: CharactersRibbon(),
    );
  }
}
