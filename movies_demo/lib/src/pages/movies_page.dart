import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:movies_demo/src/controllers/movies_controller.dart';
import 'package:movies_demo/src/pages/detail_movie.dart';
import 'package:movies_demo/src/widgets/text/custom_text.dart';


class MoviesPage extends StatelessWidget {
  const MoviesPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MoviesController>(
      init: MoviesController(),
      id: 'movies',
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const CustomText(
            fTxt: 'Peliculas',
            fSize: 18.0,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: _.fnLogOut
            )
          ],
        ),
        body: (!_.loadingMovies)
        ? ListView.builder(
          itemCount: _.moviesModel!.results.length,
          itemBuilder: (__, int index) {
            return GestureDetector(
              onTap: () => Get.to( () => DetailsMoviePage(movie: _.moviesModel!.results[index])),
              child: Container(
                width: 30.0,
                height: 50.0,
                margin: const EdgeInsets.all(15.0),
                color: Colors.blue,
                child: Center(
                  child: CustomText(
                    fTxt: _.moviesModel!.results[index].originalTitle,
                    fSize: 16.0,
                  ),
                ),
              ),
            );
          }
        ) : const Center(child: CircularProgressIndicator()),
       floatingActionButton: FloatingActionButton(
         onPressed: _.getMovies
       ),
       ),
    );
  }
}