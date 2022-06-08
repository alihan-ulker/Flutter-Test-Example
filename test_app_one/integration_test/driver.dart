import 'package:integration_test/integration_test_driver.dart';

//Entegrasyon testleri ile uygulama kullanıcı arayüzünü ve performansını test etme

//Bu kod, entegrasyon testi sürücüsünü etkinleştirir ve ardından testin çalışmasını bekler.
//Yanıt verileri, testler çalıştırıldıktan sonra entegrasyon_response_data.json adlı bir dosyada saklanır.
Future<void> main() => integrationDriver();
