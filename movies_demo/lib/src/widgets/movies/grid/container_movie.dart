
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_demo/src/theme/theme.dart' as th;
import 'package:movies_demo/src/utils/utils.dart' as utils;
import 'package:movies_demo/src/widgets/text/custom_text.dart';

class  ContainerMovie extends StatelessWidget {

  final String? nameMovie;
  final String? imageMovie;
  final void Function() fnOnClick;

  const ContainerMovie({
    Key? key,
    required this.nameMovie, 
    required this.imageMovie,
    required this.fnOnClick
  }) : super(key: key);

  final  String urlImg = 'https://image.tmdb.org/t/p/original';

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.fromLTRB(
        utils.porcientoW(context, 4.0), // Left
        0.0, // Top
        utils.porcientoW(context, 4.0), // Right
        utils.porcientoH(context, 1.0) // Bottom
      ),
      clipBehavior: Clip.antiAlias,
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.antiAlias,
        children: [
          GestureDetector(
            onTap: fnOnClick,
            child: Hero(
              tag: '$nameMovie',
              child: CachedNetworkImage( // IMAGEN MOVIE
                fit: BoxFit.cover,
                imageUrl: '$urlImg$imageMovie',
                placeholder: (context, url) => const SizedBox(
                  width: 3.0,
                  child: Padding(
                    padding: EdgeInsets.all(70.0),
                    child: CircularProgressIndicator.adaptive(),
                  )
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red),
              )
            )
          ),
          const SizedBox(height: 10.0),
          Positioned( // TITULO MOVIE
            bottom: 0.0,
            child: ClipRRect(
              child: Container(
                color: th.primaryColor.withOpacity(0.6),
                padding: const EdgeInsets.all(8.0),
                child: CustomText( 
                  fTxt: nameMovie!,
                  fSize: 14.0,
                  fColor: Colors.white,
                  fAlign: TextAlign.center,
                )
              ),
            )
          )
        ]
      )
    );
  }
}