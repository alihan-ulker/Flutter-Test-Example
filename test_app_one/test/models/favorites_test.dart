import 'package:test/test.dart';
import 'package:test_app_one/models/favorites.dart';

//Unit (Birim) Test
void main() {
  group('Provider Testi', () {
    var favorites = Favorites();

    test('Yeni renk eklendi', () {
      var number = 35;
      favorites.add(number);
      expect(favorites.items.contains(number), true);
    });

    test('Yeni renk kaldırıldı', () {
      var number = 45;
      favorites.add(number);
      expect(favorites.items.contains(number), true);
      favorites.remove(number);
      expect(favorites.items.contains(number), false);
    });
  });
}
