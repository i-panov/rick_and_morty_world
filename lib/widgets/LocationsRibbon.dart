import 'package:flutter/material.dart';
import 'package:rick_and_morty_world/api.dart';
import 'package:rick_and_morty_world/models/Location.dart';
import 'package:rick_and_morty_world/widgets/LocationPreview.dart';
import 'package:rick_and_morty_world/widgets/Ribbon.dart';

class LocationsRibbon extends Ribbon<Location> {
  @override
  Widget buildCard(BuildContext context, Location model) {
    return LocationPreview(model: model);
  }

  @override
  Future<List<Location>> getNextPage(int index) async {
    final response = await fetchLocationPage(index);
    return response.results;
  }
}
