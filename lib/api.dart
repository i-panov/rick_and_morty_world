import 'package:rick_and_morty_world/models/ApiModel.dart';
import 'package:rick_and_morty_world/models/ApiResponse.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:rick_and_morty_world/models/Character.dart';
import 'package:rick_and_morty_world/models/Episode.dart';
import 'package:rick_and_morty_world/models/Location.dart';

Future<ApiResponse<Model>> fetchApiPage<Model extends ApiModel>(String type, int page, Model Function(dynamic) mapper) async {
  if (page <= 0) {
    throw new ArgumentError('Page must be positive and non zero');
  }

  final url = Uri.parse("https://rickandmortyapi.com/api/$type/?page=$page");
  final response = await http.get(url, headers: {"Accept": "application/json"});

  if (response.statusCode != 200) {
    throw new Exception(response.reasonPhrase);
  }

  return ApiResponse.fromJson(json.decode(response.body), mapper);
}

Future<ApiResponse<Character>> fetchCharacterPage(int page) async {
  return fetchApiPage('character', page, (json) => Character.fromJson(json));
}

Future<ApiResponse<Location>> fetchLocationPage(int page) async {
  return fetchApiPage('location', page, (json) => Location.fromJson(json));
}

Future<ApiResponse<Episode>> fetchEpisodePage(int page) async {
  return fetchApiPage('episode', page, (json) => Episode.fromJson(json));
}

Stream<T> fetchModels<T>(List<String> urls, T Function(dynamic) mapper) async* {
  for (final url in urls) {
    final response = await http.get(Uri.parse(url), headers: {"Accept": "application/json"});

    if (response.statusCode == 200) {
      yield mapper(json.decode(response.body));
    }
  }
}
