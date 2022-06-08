# Flutter Test Example

Unit, Widget and Integration Tests

## Add the following to pubspec.yaml

    provider: ^6.0.3

## dev_dependencies:
    flutter_test:
      sdk: flutter
    
    integration_test:
      sdk: flutter
    
    flutter_driver:
      sdk: flutter
    
    test: ^1.21.1

## To run a test:
    # Integration Test
    flutter run integration_test/app_test.dart

    # Unit Test
    flutter run test/models/favorites_test.dart

    # Flutter Driver Test
    flutter run test/test_driver/app_test.dart

    # Widgets Test
    flutter run test/favorites_test.dart
    flutter run test/home_test.dart
    flutter run test/widget_test.dart