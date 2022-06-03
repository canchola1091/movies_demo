
import 'package:http/http.dart' as http;
import 'package:movies_demo/src/models/movies_model.dart';
import 'package:movies_demo/src/utils/utils.dart' as utils;

class MoviesServices {
  
  final String _urlHost = 'api.themoviedb.org';
  
  Future getMoviesNowPlaying() async {
    utils.msginfo('--> Obteniendo Peliculas en Cartelera...');
    final _url = Uri.https(_urlHost, '3/movie/now_playing');
    try {
      final _resp = await http.get(
        _url,
        headers: utils.getHeaderwithUserToken()
      );
      print('--> StatusCode: ${_resp.statusCode}');
      print('--> Resp: ${_resp.body}');
      // Get.back();
      if(_resp.statusCode == 200) {
        final String _decodedData = _resp.body;
        return moviesModelFromJson(_decodedData);
      }else {
        utils.msgerror('Error al obtener las peliculas');
      }
    } catch (e) {
      // TODO: Agregar Alert
      return [];
    }
  }
}