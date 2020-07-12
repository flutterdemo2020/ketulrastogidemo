import 'package:flutter/material.dart';
import 'package:ketulrastogidemo/models/movie_model.dart';
import 'package:ketulrastogidemo/screens/theme_service.dart';
import 'package:ketulrastogidemo/services/movie_service.dart';
import 'package:ketulrastogidemo/services/movie_tabbar_service.dart';
import 'package:ketulrastogidemo/widgets/movie_list.dart';
import 'package:ketulrastogidemo/widgets/movie_tabbar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MovieTabbarService _movieTabbarService =
        Provider.of<MovieTabbarService>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: MovieListAppBarTitle(),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        body: MovieListWidget(
          movieType: MovieType.values[_movieTabbarService.currentIndex],
        ),
        bottomNavigationBar: MovieTabBar(),
        floatingActionButton: MovieListFAB(),
      ),
    );
  }
}

class MovieListFAB extends StatelessWidget {
  const MovieListFAB({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(
      builder: (context, themeService, child) {
        return FloatingActionButton(
          backgroundColor: (Theme.of(context).brightness == Brightness.dark)
              ? Colors.white
              : Colors.black,
          child: (Theme.of(context).brightness == Brightness.dark)
              ? Icon(
                  Icons.wb_sunny,
                  size: 30.0,
                  color: Colors.orange,
                )
              : Icon(
                  Icons.brightness_2,
                  size: 30.0,
                  color: Colors.white,
                ),
          onPressed: () {
            themeService.toggleBrightness();
          },
        );
      },
    );
  }
}

class MovieListAppBarTitle extends StatelessWidget {
  const MovieListAppBarTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MovieTabbarService _movieTabbarService =
        Provider.of<MovieTabbarService>(context);
    return _movieTabbarService.searchClicked
        ? Container(
            width: double.infinity,
            child: Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width - 100,
                  // decoration: BoxDecoration(
                  //   border: Border.all(
                  //     color: Colors.white,
                  //   ),
                  //   borderRadius: BorderRadius.circular(8.0),
                  // ),
                  child: TextField(
                    decoration: InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      hintText: 'Search',
                      filled: true,
                      fillColor:
                          (Theme.of(context).brightness == Brightness.dark)
                              ? Colors.black
                              : Colors.white,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.search,
                          size: 24.0,
                        ),
                      ),
                      suffixIcon: _movieTabbarService.searchClicked
                          ? Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Icon(Icons.cancel),
                            )
                          : Container(),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      prefixIconConstraints: BoxConstraints(maxHeight: 32.0),
                      suffixIconConstraints: BoxConstraints(maxHeight: 32.0),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _movieTabbarService.onCancelClicked();
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Cancel',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          )
        : Container(
            // decoration: BoxDecoration(
            //   border: Border.all(
            //     color: Colors.white,
            //   ),
            //   borderRadius: BorderRadius.circular(8.0),
            // ),
            child: TextField(
              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                hintText: 'Search',
                filled: true,
                fillColor: (Theme.of(context).brightness == Brightness.dark)
                    ? Colors.black
                    : Colors.white,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.search,
                    size: 24.0,
                  ),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                prefixIconConstraints: BoxConstraints(maxHeight: 32.0),
              ),
              onTap: () {
                _movieTabbarService.onSearchClicked();
              },
            ),
          );
  }
}
