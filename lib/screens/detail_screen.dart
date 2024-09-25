import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:movio/models/movie_model.dart';
import 'package:movio/utils/constants.dart';
import 'package:movio/utils/html_string_helper.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailsScreen({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 500,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                movie.name,
              ),
              stretchModes: const [
                StretchMode.blurBackground,
                StretchMode.zoomBackground,
                StretchMode.fadeTitle
              ],
              titlePadding:
                  const EdgeInsets.only(left: 16, right: 0, bottom: 8),
              centerTitle: false,
              background: movie.imageUrl != ''
                  ? Image.network(
                      movie.imageUrl!,
                      fit: BoxFit.fitHeight,
                    )
                  : Image.asset(
                      default_image_url,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        movie.rating == null
                            ? 'No rating'
                            : '${movie.rating?.toStringAsPrecision(2)} / 10',
                      ),
                      const Spacer(),
                      Text(
                        'Views: ${getMillionCount(movie.updated ?? 0)}',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        "Language: ${movie.language ?? 'No language available'}",
                      ),
                      const Spacer(),
                      Text(
                        "Country: ${movie.country ?? 'No country available'}",
                      )
                    ],
                  ),

                  // Text(movie.language ?? 'No language available'),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        "Premiered: ${movie.premiered ?? 'No data available'}",
                      ),
                      const Spacer(),
                      Text(
                        "Ended: ${movie.ended ?? 'No data available'}",
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    children: movie.genre == null
                        ? []
                        : movie.genre!
                            .map((genre) => Chip(label: Text(genre)))
                            .toList(),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Description:",
                    style: TextStyle(fontSize: 24),
                  ),
                  const Divider(
                    thickness: 0.5,
                  ),
                  Text(
                    getPlainText(movie.summary),
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  ExpandableText(
                    getPlainText(movie.summary),
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.justify,
                    expandText: 'Read More',
                    collapseText: 'Read Less',
                    maxLines: 3,
                    linkColor: Colors.blue,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
