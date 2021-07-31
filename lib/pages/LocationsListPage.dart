import 'package:flutter/material.dart';
import 'package:rick_and_morty_world/widgets/LocationsRibbon.dart';
import 'package:rick_and_morty_world/widgets/NavBar.dart';

class LocationsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('Locations'),
      ),
      body: LocationsRibbon(),
    );
  }
}
