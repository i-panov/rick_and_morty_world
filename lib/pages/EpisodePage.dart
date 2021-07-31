import 'package:flutter/material.dart';
import 'package:rick_and_morty_world/models/Character.dart';
import 'package:rick_and_morty_world/models/Episode.dart';
import 'package:rick_and_morty_world/widgets/CharacterPreview.dart';
import 'package:rick_and_morty_world/widgets/TextPair.dart';

class EpisodePage extends StatelessWidget {
  final Episode model;

  EpisodePage({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Episode details'),
        backgroundColor: Colors.black54,
        shadowColor: Colors.white,
      ),
      backgroundColor: Colors.black54,
      body: Column(
        children: [
          TextPair(label: 'Name:', value: model.name),
          TextPair(label: 'Episode:', value: model.episode),
          Text('Characters:'),
          Scrollbar(
            child: FutureBuilder(
              future: model.fetchCharacterModels().toList(),
              builder: (BuildContext context, AsyncSnapshot<List<Character>> snapshot) {
                final characters = snapshot.data ?? List.empty();
                return Column(
                  children: [ for (final character in characters) CharacterPreview(model: character) ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
