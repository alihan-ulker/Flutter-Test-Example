import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:test_app_one/main.dart';

//Entegrasyon testleri ile uygulama kullanıcı arayüzünü ve performansını test etme

//ensureInitialized() işlevi, entegrasyon test sürücüsünün başlatılıp başlatılmadığını doğrular ve gerekirse yeniden başlatır.
//framePolicy, LiveTestWidgetsFlutterBindingFramePolicy numaralandırmasından fullLive olarak ayarlandığında,
//yoğun animasyonlu durumları test etmek için en uygun olanıdır.
//Ardından, uygulamanın kaydırma performansını test edin ve watchPerformance() işlevini kullanarak kaydedin.

void main() {
  group('Integration Test', () {
    final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

    //Kaydırma testi öğelerin listesini gerçekten hızlı bir şekilde kaydırır ve ardından tamamen yukarı kaydırır.
    //watchPerformance() işlevi, eylemleri kaydeder ve daha sonra
    //driver.dart dosyasındaki test sürücüsüne yanıt verisi olarak geri gönderilen bir zaman çizelgesi özeti oluşturur.

    testWidgets('Kaydırma Testi', (tester) async {
      await tester.pumpWidget(const TestingApp());

      final listFinder = find.byType(ListView);

      await binding.watchPerformance(() async {
        await tester.fling(listFinder, const Offset(0, -500), 10000);
        await tester.pumpAndSettle();

        await tester.fling(listFinder, const Offset(0, 500), 10000);
        await tester.pumpAndSettle();
      }, reportKey: 'scrolling_summary');
    });

    testWidgets('Favoriler Testi', (tester) async {
      await tester.pumpWidget(const TestingApp());

      final iconKeys = [
        'icon_0',
        'icon_1',
        'icon_2',
      ];

      for (var icon in iconKeys) {
        await tester.tap(find.byKey(ValueKey(icon)));
        await tester.pumpAndSettle(const Duration(seconds: 1));

        expect(find.text('Favorilere eklendi.'), findsOneWidget);
      }

      await tester.tap(find.text('Favoriler'));
      await tester.pumpAndSettle();

      final removeIconKeys = [
        'remove_icon_0',
        'remove_icon_1',
        'remove_icon_2',
      ];

      for (final iconKey in removeIconKeys) {
        await tester.tap(find.byKey(ValueKey(iconKey)));
        await tester.pumpAndSettle(const Duration(seconds: 1));

        expect(find.text('Favorilerden kaldırıldı.'), findsOneWidget);
      }
    });
  });

  //Test başarıyla tamamlandıktan sonra, projenin kökündeki derleme dizini,Integration_response_data.json adlı bir dosya içermelidir.
  //Çalışırken testten geri gönderilen yanıt verilerini içerir, bu durumda scrolling_summary.
  //Bilgileri görüntülemek için dosyayı herhangi bir metin düzenleyiciyle açın.
  //Daha gelişmiş bir kurulumla, test her çalıştırıldığında bir özet kaydedebilir ve sonuçların bir grafiğini oluşturabilirsiniz.
}
