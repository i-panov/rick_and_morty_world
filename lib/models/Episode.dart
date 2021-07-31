import '../api.dart';
import 'ApiModel.dart';
import 'Character.dart';

class Episode extends ApiModel {
  final int id;
  final String name;
  final String airDate;
  final String episode;
  final List<String> characters;
  final String url;
  final DateTime created;

  Episode({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episode,
    required this.characters,
    required this.url,
    required this.created,
  });
  
  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(
        id: json['id'],
        name: json['name'],
        airDate: json['air_date'],
        episode: json['episode'],
        characters: (json['characters'] as List).cast<String>(),
        url: json['url'],
        created: DateTime.parse(json['created']),
    );
  }

  Stream<Character> fetchCharacterModels() async* {
    yield* fetchModels(characters, (json) => Character.fromJson(json));
  }
}
