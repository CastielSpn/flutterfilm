import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MovieDetailScreen extends StatelessWidget {
  final Map<String, dynamic> movie;

  MovieDetailScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie['Title'])),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: movie['Poster'],
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              SizedBox(height: 10),
              Text(
                movie['Title'],
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text('Year: ${movie['Year']}'),
              SizedBox(height: 10),
              Text('Genre: ${movie['Genre'] ?? 'N/A'}'),
              SizedBox(height: 10),
              Text('Description: ${movie['Plot'] ?? 'N/A'}'),
              SizedBox(height: 10),
              Text('Rating: ${movie['imdbRating'] ?? 'N/A'} / 10'),
            ],
          ),
        ),
      ),
    );
  }
}
