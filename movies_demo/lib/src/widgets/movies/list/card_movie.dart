
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:movies_demo/src/utils/utils.dart' as utils;
import 'package:movies_demo/src/widgets/text/custom_text.dart';


class CardMovie extends StatelessWidget {
  
  final String? nameMovie;
  final String? imageMovie;
  final void Function() fnOnClick;

  const CardMovie({
    Key? key,
    required this.nameMovie, 
    required this.imageMovie,
    required this.fnOnClick
  }) : super(key: key);

  final  String _urlImg = 'https://image.tmdb.org/t/p/original';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fnOnClick,
      child: SizedBox(
        height: utils.porcientoH(Get.context, 15.0),
        child: Card(
          color: Colors.white,
          elevation: 10.0,
          clipBehavior: Clip.antiAlias,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Hero(
                tag: '$nameMovie',
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: '$_urlImg$imageMovie',
                  placeholder: (context, url) => const Padding(
                padding: EdgeInsets.all(50.0),
                  child: CircularProgressIndicator.adaptive(),
                ),
                  errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red),
                ),
              ), 
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                    Colors.grey.shade700,
                    Colors.black.withOpacity(0.3),
                    Colors.black12,
                    Colors.grey.shade700
                    ]
                  )
                )
              ),
              Center(
                child: CustomText(
                  fTxt: nameMovie!,
                  fSize: 17.0,
                  fColor: Colors.white
                )
              )
            ]
          )
        )
      )
    );
  }
}