
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/route_manager.dart';
import 'package:movies_demo/src/controllers/movies_controller.dart';
import 'package:movies_demo/src/pages/detail_movie.dart';
import 'package:movies_demo/src/widgets/movies/list/card_movie.dart';

class ListMovies extends StatelessWidget {
  const ListMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MoviesController>(
      builder: (_) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        itemCount: _.gxMoviesModel!.results.length,
        separatorBuilder: (__, int i) => const SizedBox(height: 15.0),
        itemBuilder: (__, int index) => CardMovie(
          nameMovie: _.gxMoviesModel!.results[index].title,
          imageMovie:_.gxMoviesModel!.results[index].posterPath,
          fnOnClick: () => Get.to( () => DetailsMoviePage(
            movie: _.gxMoviesModel!.results[index]
          ))
        )
      )
    );
  }
}