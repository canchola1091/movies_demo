
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/route_manager.dart';
import 'package:movies_demo/src/controllers/movies_controller.dart';
import 'package:movies_demo/src/pages/detail_movie.dart';
import 'package:movies_demo/src/widgets/movies/grid/container_movie.dart';
import 'package:movies_demo/src/utils/utils.dart' as utils;


class GridMovies extends StatelessWidget {
  const GridMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MoviesController>(
      builder: (_) => GridView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: utils.porcientoW(Get.context!, 50.0),
          crossAxisSpacing: utils.porcientoW(Get.context!, 1.0),
          mainAxisSpacing: utils.porcientoH(Get.context!, 1.0), 
        ),
        itemCount: _.gxMoviesModel!.results.length,
        itemBuilder: (__, int index) => Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: ContainerMovie(
            nameMovie: _.gxMoviesModel!.results[index].title,
            imageMovie: _.gxMoviesModel!.results[index].posterPath,
            fnOnClick: () => Get.to( () => DetailsMoviePage(
              movie: _.gxMoviesModel!.results[index]
            ))
          )
        )
      )
    );
  }
}