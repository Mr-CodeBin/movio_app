class Movie {
  final String name;
  final String? imageUrl;
  final String summary;
  final double? rating;
  final List<String>? genre;
  final String? language;
  final int? updated;
  final String? country;
  final String? premiered;
  final String? ended;
  final int? runtime;

  Movie({
    required this.name,
    required this.imageUrl,
    required this.summary,
    required this.rating,
    required this.genre,
    required this.language,
    required this.updated,
    required this.country,
    required this.premiered,
    required this.ended,
    required this.runtime,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      name: json['show']['name'],
      imageUrl:
          json['show']['image'] != null ? json['show']['image']['medium'] : '',
      summary: json['show']['summary'] ?? 'No summary available',
      rating: json['show']['rating']['average']?.toDouble(),
      genre: json['show']['genres'] != null
          ? List<String>.from(json['show']['genres'])
          : [],
      language: json['show']['language'],
      updated: json['show']['updated'] ?? 0,
      country: json['show']['network'] != null
          ? json['show']['network']['country']['name']
          : 'No country available',
      premiered: json['show']['premiered'],
      ended: json['show']['ended'],
      runtime: json['show']['runtime'],
    );
  }
}
