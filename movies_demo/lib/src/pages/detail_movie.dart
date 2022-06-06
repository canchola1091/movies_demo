
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_demo/src/models/movies_model.dart';
import 'package:movies_demo/src/utils/utils.dart' as utils;
import 'package:movies_demo/src/widgets/text/custom_text.dart';
import 'package:movies_demo/src/theme/theme.dart' as th;

class DetailsMoviePage extends StatelessWidget {

  final Movie movie;

  const DetailsMoviePage({
    Key? key,
    required this.movie
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            elevation: 10.0,
            expandedHeight: utils.porcientoH(Get.context!, 23.0),
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title:  CustomText( fTxt: movie.originalTitle, fSize: 15.0 ),
              titlePadding: const EdgeInsets.only(left: 15.0, bottom: 15.0),
              background: _backGroundAppBar(), 
            ) 
          ),

          SliverToBoxAdapter( child: _body() )
        ]
      )
   );
  }

  Widget _backGroundAppBar() {
    const String _domainImage = 'https://image.tmdb.org/t/p/original';
    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.antiAlias,
      alignment: Alignment.center,
      children: [
        Hero(
        tag: movie.title,
        child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: '$_domainImage${movie.backdropPath}'
          )
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Colors.black12,
                Colors.grey.shade700
              ]
            )
          )
        )
      ]
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: FadeIn(
        delay: const Duration(milliseconds: 300),
        child: Column(
          children: [
            const SizedBox(height: 10.0),
            _infoMovie(),
            const SizedBox(height: 10.0),
            _overView(),        
            _overView(),        
            _overView(),        
            _overView(),        
          ]
        ),
      )
    );
  }

  Widget _infoMovie() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0)
      ),
      color: Colors.white,
      elevation: 10.0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(
                  fTxt: 'Popularity', 
                  fSize: 17.0,
                  fColor: Colors.black.withOpacity(0.6),
                ),
                const SizedBox(height: 5.0),
                CustomText(
                  fTxt: '${movie.popularity}', 
                  fSize: 15.0,
                  fColor: th.subTitleColor.withOpacity(0.7),
                )
              ]
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star, color: Colors.yellow),
                    const SizedBox(width: 10.0),
                    CustomText(
                      fTxt: '${movie.voteAverage}', 
                      fSize: 17.0,
                      fColor: Colors.black.withOpacity(0.6),
                    )
                  ]
                ),
                const SizedBox(height: 5.0),
                CustomText(
                  fTxt: utils.dateFormat(movie.releaseDate),
                  fSize: 15.0,
                  fColor: th.subTitleColor.withOpacity(0.7),
                )
              ]
            )
          ]
        ),
      ),
    );
  }

  Widget _overView() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: CustomText(
        fTxt: movie.overview,
        fSize: 18.0,
        fColor: Colors.black, 
        fAlign: TextAlign.justify,
        spacingLetter: 1.1,
      ),
    );
  }

}