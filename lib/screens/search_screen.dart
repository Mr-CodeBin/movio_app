import 'package:flutter/material.dart';
import 'package:movio/providers/movie_provider.dart';
import 'package:movio/widgets/movie_card.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Movies',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    Provider.of<MovieProvider>(context, listen: false)
                        .searchMovies(value);
                  }
                },
              ),
            ),
            Expanded(
              child: Consumer<MovieProvider>(
                builder: (context, movieProvider, child) {
                  if (movieProvider.isLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (movieProvider.searchResults.isEmpty) {
                    return Center(
                      child: Text('No results found'),
                    );
                  }

                  return ListView.builder(
                    itemCount: movieProvider.searchResults.length,
                    itemBuilder: (context, index) {
                      final movie = movieProvider.searchResults[index];
                      return MovieCard(movie: movie);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
