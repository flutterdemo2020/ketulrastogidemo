import 'package:flutter/material.dart';
import 'package:ketulrastogidemo/models/movie_model.dart';
import 'package:ketulrastogidemo/screens/movie_detail_screen.dart';
import 'package:ketulrastogidemo/services/movie_service.dart';
import 'package:ketulrastogidemo/services/movie_tabbar_service.dart';
import 'package:provider/provider.dart';

class MovieListWidget extends StatefulWidget {
  @override
  _MovieListWidgetState createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  MovieService _movieService;
  MovieTabbarService _movieTabbarService;
  List<Movie> _movieList;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MovieService _movieService = Provider.of<MovieService>(context);
    MovieTabbarService _movieTabbarService =
        Provider.of<MovieTabbarService>(context);
    // _movieService.getMovies(MovieType.values[_movieTabbarService.currentIndex]);
    return RefreshIndicator(
      color: Colors.orange,
      onRefresh: () async {
        await _movieService
            .getMovies(MovieType.values[_movieTabbarService.currentIndex]);
      },
      child: (_movieService.filterMovieList.length != 0)
          ? ListView.separated(
              padding: EdgeInsets.all(16.0),
              itemCount: _movieService.filterMovieList.length,
              itemBuilder: (context, index) {
                Movie movie = _movieService.filterMovieList[index];
                return MovieListItem(movie: movie);
              },
              separatorBuilder: (context, index) {
                return Divider(
                  height: 16.0,
                  // color: Colors.grey,
                );
              },
            )
          : Center(
              child: Text('No Data Available.'),
            ),
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
