import 'package:flutter/material.dart';
import 'package:ketulrastogidemo/models/movie_model.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailScreen({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('BACK'),
          titleSpacing: 1.0,
        ),
        body: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 0,
              child: Image.network(
                movie.posterPath,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Container(
                // height: 300.0,
                padding: EdgeInsets.all(16.0),
                color: Colors.black.withOpacity(0.7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                        movie.title,
                        style: Theme.of(context).textTheme.headline5.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                            ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Text(
                              movie.releaseDate,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                    // fontWeight: FontWeight.bold,
                                    color: Colors.white70,
                                  ),
                            ),
                          ),
                          Container(
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.star,
                                  size: 20.0,
                                  color: Theme.of(context).primaryColor,
                                ),
                                SizedBox(
                                  width: 8.0,
                                ),
                                Text(
                                  '${movie.voteAverage}/10  (${movie.voteCount} votes)',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.white70,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      movie.overview,
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            // fontWeight: FontWeight.bold,
                            color: Colors.white70,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
