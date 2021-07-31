import 'package:flutter/material.dart';
import 'package:rick_and_morty_world/widgets/EpisodesRibbon.dart';
import 'package:rick_and_morty_world/widgets/NavBar.dart';

class EpisodesListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('Episodes'),
      ),
      body: EpisodesRibbon(),
    );
  }
}
