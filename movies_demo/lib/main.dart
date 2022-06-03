import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:movies_demo/src/routes/routes_pages.dart';
import 'package:movies_demo/src/theme/theme.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies Demo',
      theme: theme,
      initialRoute: '/login_page',
      getPages: RoutesPages.routes,
    );
  }
}