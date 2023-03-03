import 'package:flutter/material.dart';
import 'package:movies/providers/movies_provider.dart';
import 'package:movies/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies on Cinema'),
        elevation:0,
        actions: [
          IconButton(
            onPressed: () {
              
            }, 
            icon: const Icon(Icons.search_rounded)
          ),
        ],
        
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            //TODO CardSwiper main movie cards
            CardSwiperScreen( movies: moviesProvider.onDisplayMovies ),
      
            //Horizontal List of movies, movie slider
            MovieSlider( 
              popularMovies: moviesProvider.popularMovies,
              title: 'Popular!', //optional
            ),
          ],
        ),
      )
    );
  }
}