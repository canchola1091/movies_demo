
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:movies_demo/src/models/movies_model.dart';
import 'package:movies_demo/src/services/movies_services.dart';
import 'package:movies_demo/src/utils/utils.dart' as utils;

class MoviesController extends GetxController {

late MoviesModel? moviesModel;

bool loadingMovies = true;

  @override
  void onReady() async{
    super.onReady();
    await getMovies();
  }

  Future<void> getMovies() async {
   moviesModel = await MoviesServices().getMoviesNowPlaying();
    loadingMovies = false;
    update(['movies']);
  }

  Future<void> fnLogOut() async{
    utils.msginfo('--> Cerrando sesión...');
     await FirebaseAuth.instance.signOut();
     Get.offAllNamed('/login_page');
  }  

}