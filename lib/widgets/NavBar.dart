import 'package:flutter/material.dart';
import 'package:rick_and_morty_world/helpers.dart';
import 'package:rick_and_morty_world/pages/CharactersListPage.dart';
import 'package:rick_and_morty_world/pages/EpisodesListPage.dart';
import 'package:rick_and_morty_world/pages/LocationsListPage.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.accessibility),
            title: Text('Characters'),
            onTap: () => pushPage(context, CharactersListPage()),
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Locations'),
            onTap: () => pushPage(context, LocationsListPage()),
          ),
          ListTile(
            leading: Icon(Icons.view_comfy),
            title: Text('Episodes'),
            onTap: () => pushPage(context, EpisodesListPage()),
          ),
        ],
      ),
    );
  }
}
