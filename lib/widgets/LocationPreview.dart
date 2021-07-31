import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rick_and_morty_world/models/Location.dart';
import 'package:rick_and_morty_world/pages/LocationPage.dart';

class LocationPreview extends StatelessWidget {
  final Location model;

  LocationPreview({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: Row(
          children: [
            Text(model.name),
            Text('\t'),
            if (model.created != null) Text(DateFormat.yMMMMd().format(model.created!)),
            Text('\t'),
            Text(model.type, textAlign: TextAlign.right),
          ],
        ),
      ),
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LocationPage(model: model))),
    );
  }
}
