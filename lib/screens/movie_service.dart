import 'dart:convert';
import 'package:http/http.dart' as http;
import 'movie.dart';
import 'package:flutter/foundation.dart'; 

class MovieService extends ChangeNotifier {  
  final String _apiKey = '8c9f476';  
  bool _isLoading = false;
  List<Movie> _movies = [];

  List<Movie> get movies => _movies;
  bool get isLoading => _isLoading;

  
  Future<void> searchMovies(String query) async {
    _isLoading = true;
    notifyListeners();  
    try {
      final response = await http.get(
        Uri.parse('https://www.omdbapi.com/?s=$query&apikey=$_apiKey'),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['Response'] == 'True') {
          _movies = (data['Search'] as List)
              .map((movie) => Movie.fromJson(movie))
              .toList();
        } else {
          throw Exception('No films found');
        }
      } else {
        throw Exception('Failed to load films');
      }
    } catch (e) {
      print('Error: $e');
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners(); 
    }
  }
}
