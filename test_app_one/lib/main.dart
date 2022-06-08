import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app_one/models/favorites.dart';
import 'package:test_app_one/screens/favorites.dart';
import 'package:test_app_one/screens/home.dart';

void main() {
  runApp(const TestingApp());
}

class TestingApp extends StatelessWidget {
  const TestingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Favorites>(
      create: (context) => Favorites(),
      child: MaterialApp(
        title: 'Flutter Test',
        //Debug modu başlığı kapatma
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //  routes: {
        //   "/": (context) => const HomePage(),
        //   "/favorites_page": (context) => const FavoritesPage(),
        // },

        //Sayfa yönlendirmeleri
        routes: {
          HomePage.routeName: (context) => const HomePage(),
          FavoritesPage.routeName: (context) => const FavoritesPage(),
        },
        onUnknownRoute: (settings) => MaterialPageRoute(
            builder: (context) => Scaffold(
                  appBar: AppBar(),
                  body: const Center(
                    child: Text('Birşeyler ters gitti!'),
                  ),
                )),
        initialRoute: HomePage.routeName,
      ),
    );
  }
}
