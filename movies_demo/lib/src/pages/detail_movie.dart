
import 'package:flutter/material.dart';
import 'package:movies_demo/src/models/movies_model.dart';

class DetailsMoviePage extends StatelessWidget {

  final Movie movie;

  const DetailsMoviePage({
    Key? key,
    required this.movie
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // child: CustomText(fTxt: movie.title, fSize: 18.0, fColor: Colors.black),
        child: Image.network('https://image.tmdb.org/t/p/original${movie.backdropPath}')
     ),
   );
  }
}