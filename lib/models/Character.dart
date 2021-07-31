import 'package:rick_and_morty_world/api.dart';
import 'ApiModel.dart';
import 'Episode.dart';
import 'Location.dart';

class Character extends ApiModel {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final Location firstKnownLocation;
  final Location lastKnownLocation;
  final String image;
  final List<String> episodes;
  final String url;
  final DateTime created;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.firstKnownLocation,
    required this.lastKnownLocation,
    required this.image,
    required this.episodes,
    required this.url,
    required this.created,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
        id: json['id'],
        name: json['name'],
        status: json['status'],
        species: json['species'],
        type: json['type'],
        gender: json['gender'],
        firstKnownLocation: Location.fromJson(json['origin']),
        lastKnownLocation: Location.fromJson(json['location']),
        image: json['image'],
        episodes: (json['episode'] as List).cast<String>(),
        url: json['url'],
        created: DateTime.parse(json['created']),
    );
  }

  Stream<Episode> fetchEpisodeModels() async* {
    yield* fetchModels(episodes, (json) => Episode.fromJson(json));
  }
}
