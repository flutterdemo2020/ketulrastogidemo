import 'package:flutter/material.dart';
import 'package:ketulrastogidemo/models/movie_model.dart';
import 'package:ketulrastogidemo/screens/movie_detail_screen.dart';
import 'package:ketulrastogidemo/services/movie_service.dart';
import 'package:provider/provider.dart';

class MovieListWidget extends StatelessWidget {
  final MovieType movieType;

  const MovieListWidget({Key key, this.movieType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MovieService _movieService = Provider.of<MovieService>(context);
    return RefreshIndicator(
      color: Colors.orange,
      onRefresh: () async {
        await _movieService.getMovies(movieType);
      },
      child: FutureBuilder<List<Movie>>(
          future: _movieService.getMovies(movieType),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data != null) {
                return ListView.separated(
                  padding: EdgeInsets.all(16.0),
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    Movie movie = snapshot.data[index];
                    return MovieListItem(movie: movie);
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 16.0,
                      // color: Colors.grey,
                    );
                  },
                );
              } else {
                return Center(
                  child: Text('No Data Available.'),
                );
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}

class MovieListItem extends StatelessWidget {
  final Movie movie;
  const MovieListItem({
    Key key,
    this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailScreen(movie: movie),
          ),
        );
      },
      child: Container(
        height: MediaQuery.of(context).size.height / 5,
        // color: Colors.white,
        child: Row(
          children: <Widget>[
            Container(
              child: Image.network(movie.posterPath),
            ),
            SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      movie.title,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Container(
                    child: Text(
                      movie.overview,
                      style: Theme.of(context).textTheme.bodyText2,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
