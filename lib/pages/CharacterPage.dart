import 'package:flutter/material.dart';
import 'package:rick_and_morty_world/models/Character.dart';
import 'package:rick_and_morty_world/models/Episode.dart';
import 'package:rick_and_morty_world/widgets/CharacterStatusIndicator.dart';
import 'package:rick_and_morty_world/widgets/EpisodePreview.dart';
import 'package:rick_and_morty_world/widgets/TextPair.dart';
import 'package:intl/intl.dart';

class CharacterPage extends StatelessWidget {
  final Character model;

  CharacterPage({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Person details', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black54,
        shadowColor: Colors.white,
      ),
      backgroundColor: Colors.black54,
      body: Column(
        children: [
          Image.network(model.image),
          Text(model.name, style: TextStyle(color: Colors.white, fontSize: 20)),
          Divider(),
          TextPair(
              label: 'Live status:',
              value: " ${model.status}",
              beforeValue: CharacterStatusIndicator(status: model.status)
          ),
          TextPair(label: 'Species and gender:', value: "${model.species} (${model.gender})"),
          TextPair(label: 'Last known location:', value: model.lastKnownLocation.name),
          TextPair(label: 'First seen in:', value: model.firstKnownLocation.name),
          Text('Episodes:'),
          Scrollbar(
            child: FutureBuilder(
              future: model.fetchEpisodeModels().toList(),
              builder: (BuildContext context, AsyncSnapshot<List<Episode>> snapshot) {
                final episodes = snapshot.data ?? List.empty();
                return Column(
                  children: [ for (final episode in episodes) EpisodePreview(model: episode) ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
