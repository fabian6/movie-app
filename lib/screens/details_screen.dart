import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:movies/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  
  const DetailsScreen({super.key});
  
  @override
  Widget build(BuildContext context) {


    //TODO change for a instance of movie
    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Movie Details'),
      // ),
      body:  CustomScrollView(
        slivers: [
          const _CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              const _PosterAndTitle(),
              const _OverView(),
              const _OverView(),
              const _OverView(),
              const _OverView(),
              const _OverView(),
              const _OverView(),
              const _OverView(),
              const _OverView(),
              const _OverView(),
              const _OverView(),
              const CastingCards(),
            ]),
          )
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          padding: EdgeInsets.only(bottom: 10),
          child: const Text('movie title', style: TextStyle(fontSize: 16, ),),
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://via.placeholder.com/500x300'),
          fit: BoxFit.cover,

        ),
      ),

    );
  }
}

class _PosterAndTitle extends StatelessWidget {

  const _PosterAndTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric( horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage('https://via.placeholder.com/200x300'),
              height: 150,
            ),
          ),
          
          SizedBox( width: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Movie title', style: textTheme.headline5, overflow: TextOverflow.ellipsis, maxLines: 2,),
              Text('Original title', style: textTheme.subtitle1, overflow: TextOverflow.ellipsis, maxLines: 1,),
              Row(
                children: [
                  Icon( Icons.star_border_outlined, size:15, color: Colors.grey),
                  SizedBox(width: 5,),
                  Text('Movie vote average', style: textTheme.caption,)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _OverView extends StatelessWidget {
  const _OverView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 23, vertical: 10),
      child: Text('Eiusmod ea elit Lorem elit est nulla culpa eu qui laborum occaecat elit.',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}