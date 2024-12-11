import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/services/movie_service.dart';

void main() {
  test('Fetch movies returns a list', () async {
    final service = MovieService();
    final movies = await service.fetchMovies('batman');
    expect(movies.isNotEmpty, true);
  });
}
