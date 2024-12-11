import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/movie_service.dart';
import 'screens/movie_card.dart';

class MovieListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final movieService = Provider.of<MovieService>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search Movies',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (query) {
                movieService.searchMovies(query);
              },
            ),
          ),
          if (movieService.isLoading)
            Center(child: CircularProgressIndicator()),
          if (!movieService.isLoading && movieService.movies.isEmpty)
            Center(child: Text('No films found')),
          Expanded(
            child: movieService.movies.isEmpty
                ? Center(child: Text('Search for movies!'))
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 0.7,
                    ),
                    itemCount: movieService.movies.length,
                    itemBuilder: (context, index) {
                      final movie = movieService.movies[index];
                      return MovieCard(
                        title: movie.title,
                        year: movie.year,
                        poster: movie.poster,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
