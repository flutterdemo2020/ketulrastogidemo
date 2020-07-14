import 'package:flutter/material.dart';
import 'package:ketulrastogidemo/services/movie_service.dart';
import 'package:ketulrastogidemo/services/movie_tabbar_service.dart';
import 'package:provider/provider.dart';

class MovieTabBar extends StatelessWidget {
  const MovieTabBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MovieService _movieService = Provider.of<MovieService>(context);
    final MovieTabbarService _movieTabbarService =
        Provider.of<MovieTabbarService>(context);
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      selectedItemColor: (Theme.of(context).brightness == Brightness.dark)
          ? Colors.white
          : Colors.black,
      // unselectedItemColor: Colors.grey.shade600,
      currentIndex: _movieTabbarService.currentIndex,

      onTap: (index) {
        _movieTabbarService.onTabClicked(index);
        _movieService.getMovies(MovieType.values[index]);
      },
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.play_circle_outline,
          ),
          title: Text('Now Playing'),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.filter_vintage,
          ),
          title: Text('Top Rated'),
        ),
      ],
    );
  }
}
