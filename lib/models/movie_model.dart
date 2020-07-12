import 'package:intl/intl.dart';

class Movie {
  final int id;
  final String title;
  final String overview;
  final String releaseDate;
  final String posterPath;
  final int voteCount;
  final num voteAverage;

  Movie(
      {this.id,
      this.title,
      this.overview,
      this.releaseDate,
      this.posterPath,
      this.voteCount,
      this.voteAverage});

  factory Movie.fromMap(Map<String, dynamic> data) {
    return Movie(
      id: data['id'],
      title: data['title'],
      overview: data['overview'],
      releaseDate:
          DateFormat.yMMMMd().format(DateTime.parse(data['release_date'])),
      posterPath: 'https://image.tmdb.org/t/p/w342' + data['poster_path'],
      voteCount: data['vote_count'],
      voteAverage: data['vote_average'],
    );
  }
}
