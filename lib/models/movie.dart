class Movie {
  bool adult = false, isFav = false, saved = false, avilable = true;
  String? originalTitle,
      posterPath,
      releaseDate,
      overview,
      backdrop,
      status;
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
    for (int i = 0; i < json["genres"].length; i++) {
      tmpList.add(json["genres"][i]["name"]);
    }
    return Movie(
      adult: json["adult"],
      originalTitle: json["original_title"],
      popularity: json["popularity"],
      posterPath: json["poster_path"],
      releaseDate: json["release_date"],
      voteAverage: json["vote_average"],
      overview: json["overview"],
      backdrop: json["backdrop_path"],
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
