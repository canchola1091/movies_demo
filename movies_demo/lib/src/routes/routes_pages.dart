
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:movies_demo/src/pages/login_page.dart';
import 'package:movies_demo/src/pages/movies_page.dart';


class RoutesPages {
  static List<GetPage> routes = [
    GetPage(name: '/login_page',  page: () => const LoginPage()),
    GetPage(name: '/movies_page', page: () => const MoviesPage()),
  ];
}