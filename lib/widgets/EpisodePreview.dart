import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rick_and_morty_world/models/Episode.dart';
import 'package:rick_and_morty_world/pages/EpisodePage.dart';

class EpisodePreview extends StatelessWidget {
  final Episode model;

  EpisodePreview({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: Row(
          children: [
            Column(
              children: [
                Text(model.name),
                Text(DateFormat.yMMMMd().format(model.created)),
              ],
            ),
            Column(
              children: [
                Text(model.episode, textAlign: TextAlign.right),
              ],
            ),
          ],
        ),
      ),
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => EpisodePage(model: model))),
    );
  }
}
