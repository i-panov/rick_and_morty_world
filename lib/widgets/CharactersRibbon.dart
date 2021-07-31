import 'package:flutter/material.dart';
import 'package:rick_and_morty_world/api.dart';
import 'package:rick_and_morty_world/models/Character.dart';
import 'package:rick_and_morty_world/widgets/CharacterPreview.dart';
import 'package:rick_and_morty_world/widgets/Ribbon.dart';

class CharactersRibbon extends Ribbon<Character> {
  @override
  Widget buildCard(BuildContext context, Character model) {
    return CharacterPreview(model: model);
  }

  @override
  Future<List<Character>> getNextPage(int index) async {
    final response = await fetchCharacterPage(index);
    return response.results;
  }
}
