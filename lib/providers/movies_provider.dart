
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies/models/models.dart';

class MoviesProvider extends ChangeNotifier{

  final String _apiKey    = 'f37afc93a6fb0cc8aa410f95c40cdd5d';
  final String _baseUrl   = 'api.themoviedb.org';
  final String _language  = 'en-US';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  MoviesProvider(){
    print('Movies provider initialize');
    getOnDisplayMovies();
    getPopularMovies();
  }

  getOnDisplayMovies() async{
    var url = Uri.https(_baseUrl,'3/movie/now_playing', {
      'api_key'  : _apiKey,
      'language': _language,
      'page'    : '1',
    });

    final response = await http.get(url);
    if(response.statusCode != 200) return print('error');

    final nowResponse = NowPlayingResponse.fromRawJson(response.body) ;

    onDisplayMovies = nowResponse.results;
    notifyListeners();
  }

  getPopularMovies() async{
    var url = Uri.https(_baseUrl,'3/movie/popular', {
      'api_key'  : _apiKey,
      'language': _language,
      'page'    : '1',
    });

    final response = await http.get(url);
    if(response.statusCode != 200) return print('error');

    final popularResponse = PopularResponse.fromRawJson(response.body) ;

    popularMovies = [...popularMovies,...popularResponse.results];
    notifyListeners();
  }

}