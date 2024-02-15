
import '../constatns/strings.dart';

class Movie {
  dynamic adult = false, saved = false, available = true;
  String? originalTitle, posterPath, releaseDate, overview, backdrop, status;
  dynamic link;
  dynamic popularity, voteAverage, runtime, budget, id;
  List<String> genres = [];

  Movie(
      {required this.adult,
      required this.originalTitle,
      required this.popularity,
      required this.posterPath,
      required this.releaseDate,
      required this.voteAverage,
      required this.overview,
      required this.backdrop,
      required this.status,
      required this.genres,
      required this.budget,
      required this.runtime,
      required this.id});

  factory Movie.fromJson(json) {
    List<String> tmpList = [];
    String backdropImage;
    double popularity;
    if (json["genres"] != null) {
      for (int i = 0; i < json["genres"].length; i++) {
        tmpList.add(json["genres"][i]["name"]);
      }
    }
    if (json["backdrop_path"] != null) {
      backdropImage =
          "https://image.tmdb.org/t/p/w500/${json["backdrop_path"]}";
    } else if (json["poster_path"] != null) {
      backdropImage = "https://image.tmdb.org/t/p/w500/${json["poster_path"]}";
    } else {
      backdropImage = kNullImage;
    }
    popularity = json["popularity"] ?? 0;
    return Movie(
      adult: json["adult"],
      originalTitle: json["original_title"],
      popularity: popularity,
      posterPath: json["poster_path"],
      releaseDate: json["release_date"],
      voteAverage: json["vote_average"],
      overview: json["overview"],
      backdrop: backdropImage,
      genres: tmpList,
      status: json["status"],
      budget: json["budget"],
      runtime: json["runtime"],
      id: json["id"],
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return originalTitle!;
  }
}
