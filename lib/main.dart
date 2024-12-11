import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/movie_service.dart';
import 'movie_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MovieService>(
  create: (_) => MovieService(),
  child: MaterialApp(
    title: 'Movie App',
    theme: ThemeData.light(),
    darkTheme: ThemeData.dark(),
    themeMode: ThemeMode.system,
    home: MovieListScreen(),
  ),
);
  }}