import 'package:flutter/material.dart';
import 'package:rick_and_morty_world/models/Character.dart';
import 'package:rick_and_morty_world/models/Location.dart';
import 'package:rick_and_morty_world/widgets/CharacterPreview.dart';
import 'package:rick_and_morty_world/widgets/TextPair.dart';

class LocationPage extends StatelessWidget {
  final Location model;

  LocationPage({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location details'),
        backgroundColor: Colors.black54,
        shadowColor: Colors.white,
      ),
      backgroundColor: Colors.black54,
      body: Column(
        children: [
          TextPair(label: 'Name:', value: model.name),
          TextPair(label: 'Type:', value: model.type),
          TextPair(label: 'Dimension:', value: model.dimension),
          Text('Residents:'),
          Scrollbar(
            child: FutureBuilder(
              future: model.fetchResidentModels().toList(),
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
