
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:movies_demo/src/controllers/movies_controller.dart';
import 'package:movies_demo/src/widgets/movies/grid/grid_movies.dart';
import 'package:movies_demo/src/widgets/movies/list/list_movies.dart';
import 'package:movies_demo/src/widgets/text/custom_text.dart';
import 'package:movies_demo/src/theme/theme.dart' as th;


class MoviesPage extends StatelessWidget {
  const MoviesPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MoviesController>(
      init: MoviesController(),
      id: 'list-movies',
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
              onPressed: _.showAlertLogOut
            )
          ]
        ),
        body: (_.gxLoadingMovies)
          ? const Center(child: CircularProgressIndicator())
          : _typeView(_.gxIsGridView), 
       floatingActionButton: Bounce(
         from: 20.0,
         child: FloatingActionButton(
           child: const Icon(Icons.compare_arrows_outlined, color: Colors.white),
           backgroundColor: th.primaryColor,
           onPressed: _.changeView,
         )
       )
      )
    );
  }

  Widget _typeView(bool _isGridView) {
    return  AnimatedSwitcher(
      duration: const Duration(milliseconds: 800),
      transitionBuilder: (child, animation) => SlideTransition(
        position: animation.drive(
          Tween(
            begin: const Offset(1.0, 0.0),
            end: const Offset(0.0, 0.0)
          )
        ),
        child: child
      ),
      child: (_isGridView)
        ? const GridMovies()
        : const ListMovies() 
    );
  }
}