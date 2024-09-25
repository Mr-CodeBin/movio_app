import 'package:flutter/material.dart';
import 'package:movio/models/movie_model.dart';
import 'package:movio/services/api_services.dart';

class MovieProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<Movie> _movies = [];
  List<Movie> _searchResults = [];
  bool _isLoading = false;

  List<Movie> get movies => _movies;
  List<Movie> get searchResults => _searchResults;
  bool get isLoading => _isLoading;

  MovieProvider() {
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    _isLoading = true;
    notifyListeners();
    _movies = await _apiService.fetchMovies();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> searchMovies(String query) async {
    _isLoading = true;
    notifyListeners();
    _searchResults = await _apiService.searchMovies(query);
    _isLoading = false;
    notifyListeners();
  }
}
