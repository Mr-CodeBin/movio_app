import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie_model.dart';

class ApiService {
  Future<List<Movie>> fetchMovies() async {
    final response =
        await http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=all'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return List<Movie>.from(data.map((json) => Movie.fromJson(json)));
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<List<Movie>> searchMovies(String query) async {
    final response = await http
        .get(Uri.parse('https://api.tvmaze.com/search/shows?q=$query'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return List<Movie>.from(data.map((json) => Movie.fromJson(json)));
    } else {
      throw Exception('Failed to search movies');
    }
  }
}
