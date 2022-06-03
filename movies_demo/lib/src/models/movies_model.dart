// To parse this JSON data, do
//
//     final moviesModel = moviesModelFromJson(jsonString);

import 'dart:convert';

MoviesModel moviesModelFromJson(String str) => MoviesModel.fromJson(json.decode(str));

String moviesModelToJson(MoviesModel data) => json.encode(data.toJson());

class MoviesModel {
    
  List<Movie> results;

  MoviesModel({
      required this.results,
  });

  factory MoviesModel.fromJson(Map<String, dynamic> json) => MoviesModel(
    results: List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };

}

class Movie {

  String backdropPath;
  int id;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  DateTime releaseDate;
  String title;
  double voteAverage;

  Movie({
    required this.backdropPath,
    required this.id,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
  });

    

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    backdropPath:  json["backdrop_path"],
    id:            json["id"],
    originalTitle: json["original_title"],
    overview:      json["overview"],
    popularity:    json["popularity"].toDouble(),
    posterPath:    json["poster_path"],
    releaseDate:   DateTime.parse(json["release_date"]),
    title:         json["title"],
    voteAverage:   json["vote_average"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "backdrop_path":  backdropPath,
    "id":             id,
    "original_title": originalTitle,
    "overview":       overview,
    "popularity":     popularity,
    "poster_path":    posterPath,
    "release_date":   "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
    "title":          title,
    "vote_average":   voteAverage,
  };
}
