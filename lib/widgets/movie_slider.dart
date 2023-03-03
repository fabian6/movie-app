import 'package:flutter/material.dart';
import 'package:movies/models/models.dart';

class MovieSlider extends StatelessWidget {
  final List<Movie> popularMovies;
  final String? title;
  const MovieSlider({super.key, required this.popularMovies, this.title});
  
  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: 270,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          if(title != null)
            Padding(
              padding:EdgeInsets.symmetric(horizontal: 20),
              child: Text(title!, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: popularMovies.length,
              itemBuilder: (BuildContext context, int index) => _MoviePoster( popularMovieUrl: popularMovies[index],),
            ),
          ),
          
          
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  
  final Movie popularMovieUrl;
  const _MoviePoster({
    super.key,
    required this.popularMovieUrl
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Column(
        children: [

          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments: 'movie details on down slider'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'), 
                image: NetworkImage(popularMovieUrl.fullPosterImg),
                width: 130,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          const SizedBox(height: 5,),

          Text(
            popularMovieUrl.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )

        ],
      ),
    );
  }
}