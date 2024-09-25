import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movio/providers/movie_provider.dart';
import 'package:movio/widgets/movie_card.dart';
import 'package:provider/provider.dart';

class MovioPage extends StatelessWidget {
  const MovioPage({super.key});

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.black54,
            expandedHeight: 81.0,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding:
                  const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              title: const Text("MOVIO"),
              centerTitle: true,
              background: Image.asset(
                'assets/images/bg_test1.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                movieProvider.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : movieProvider.movies.isEmpty
                        ? const Center(
                            child: Text('No movies found'),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: movieProvider.movies.length,
                            itemBuilder: (context, index) {
                              final movie = movieProvider.movies[index];
                              log(movie.name);
                              return MovieCard(movie: movie);
                            },
                          ),

                // Container(
                //   height: 1000, // For scroll effect
                //   color: ThemeData.dark().scaffoldBackgroundColor,
                //   child:
                // ),

                // // Add your content here
                // Container(
                //   height: 500, // For scroll effect
                //   color: ThemeData.dark().scaffoldBackgroundColor,
                //   child: const Center(
                //     child: Text(
                //       "Content Below App Bar",
                //       style: TextStyle(color: Colors.white),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
