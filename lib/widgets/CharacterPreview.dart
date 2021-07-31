import 'package:flutter/material.dart';
import 'package:rick_and_morty_world/models/Character.dart';
import 'package:rick_and_morty_world/pages/CharacterPage.dart';
import 'package:rick_and_morty_world/helpers.dart';
import 'CharacterStatusIndicator.dart';

class CharacterPreview extends StatelessWidget {
  final Character model;

  CharacterPreview({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: [
          Image.network(model.image, width: 100, height: 100),
          Column(
            children: [
              Text(model.name, style: TextStyle(color: Colors.white, fontSize: 20)),
              Row(
                children: [
                  CharacterStatusIndicator(status: model.status),
                  Text(' ' + model.status.capitalize(), style: TextStyle(color: Colors.white, fontSize: 16)),
                  Text('\t'),
                  Text(model.species.capitalize(), style: TextStyle(color: Colors.white, fontSize: 16)),
                ],
              ),
              Text('Last known location:', style: TextStyle(fontSize: 14)),
              Text(model.lastKnownLocation.name, style: TextStyle(color: Colors.white, fontSize: 16)),
            ],
          )
        ],
      ),
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CharacterPage(model: model))),
    );
  }
}
