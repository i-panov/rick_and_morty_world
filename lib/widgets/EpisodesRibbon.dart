import 'package:flutter/material.dart';
import 'package:rick_and_morty_world/api.dart';
import 'package:rick_and_morty_world/models/Episode.dart';
import 'package:rick_and_morty_world/widgets/EpisodePreview.dart';
import 'package:rick_and_morty_world/widgets/Ribbon.dart';

class EpisodesRibbon extends Ribbon<Episode> {
  @override
  Widget buildCard(BuildContext context, Episode model) {
    return EpisodePreview(model: model);
  }

  @override
  Future<List<Episode>> getNextPage(int index) async {
    final response = await fetchEpisodePage(index);
    return response.results;
  }
}
