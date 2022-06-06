
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:movies_demo/src/models/movies_model.dart';
import 'package:movies_demo/src/services/movies_services.dart';
import 'package:movies_demo/src/utils/utils.dart' as utils;
import 'package:movies_demo/src/widgets/alerts/alert_logout.dart';

class MoviesController extends GetxController {

late MoviesModel? _moviesModel;
bool _loadingMovies = true;
bool _isGridView    = true;

//? GETTERS
MoviesModel? get gxMoviesModel => _moviesModel;
bool get gxLoadingMovies       => _loadingMovies;
bool get gxIsGridView          => _isGridView;

  @override
  void onReady() async{
    super.onReady();
    await getMovies();
  }

  //==========================================================
  /// CAMBIA LA VISTA DE LAS PELICULAS ENTRE LISTA Y GRID
  //==========================================================
  void changeView() {
    _isGridView = !_isGridView;
    update(['list-movies']);
  }

  //==========================================================
  /// CONSUME ENDPOINT DE PELICULAS EN CARTELERA
  //==========================================================
  Future<void> getMovies() async {
    _moviesModel = await MoviesServices().getMoviesNowPlaying();
    _loadingMovies = false;
    update(['list-movies']);
  }

  //==========================================================
  /// MUESTRA ALERTA DE CIERRE DE SESIÓN
  //==========================================================
  Future<void> showAlertLogOut() async{
    utils.msginfo('--> Cerrando sesión...');
    Get.dialog( AlertLogOut(
      fnDone: _logOut,
      fnCancel: () => Get.back()
    ));
  }  

  //==========================================================
  /// CIERRE DE SESIÓN CON FIREBASE
  //==========================================================
  Future<void> _logOut() async{
    await FirebaseAuth.instance.signOut();
     Get.offAllNamed('/login_page');
  }

}