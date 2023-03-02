import 'package:flutter/material.dart';
import 'package:movies/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
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
          children: const [
            
            //TODO CardSwiper main movie cards
            CardSwiperScreen(),
      
            //Horizontal List of movies, movie slider
            MovieSlider(),
          ],
        ),
      )
    );
  }
}