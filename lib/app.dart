import 'package:flutter/material.dart';
import 'package:ketulrastogidemo/screens/home_screen.dart';
import 'package:ketulrastogidemo/screens/theme_service.dart';
import 'package:ketulrastogidemo/services/movie_service.dart';
import 'package:ketulrastogidemo/services/movie_tabbar_service.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MovieTabbarService>(
          create: (context) => MovieTabbarService(),
        ),
        ChangeNotifierProvider<MovieService>(
          create: (context) => MovieService(),
        ),
        ChangeNotifierProvider<ThemeService>(
          create: (context) => ThemeService(),
        ),
      ],
      child: Consumer<ThemeService>(
        builder: (context, themeService, child) {
          return MaterialApp(
            title: 'Ketul Rastogi Demo',
            theme: ThemeData(
              primarySwatch: Colors.orange,
              brightness: themeService.brightness,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            // darkTheme: ThemeData(
            //   primarySwatch: Colors.orange,
            //   brightness: Brightness.dark,
            //   visualDensity: VisualDensity.adaptivePlatformDensity,
            // ),
            themeMode: ThemeMode.dark,
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
