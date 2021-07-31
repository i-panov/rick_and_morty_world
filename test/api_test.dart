import 'package:rick_and_morty_world/api.dart';
import 'package:test/test.dart';

void main() {
  test('fetch character page', () async {
    final response = await fetchCharacterPage(1);
    print(response);
  });
}
