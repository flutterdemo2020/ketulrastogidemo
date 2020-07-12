import 'package:flutter/cupertino.dart';

class MovieTabbarService extends ChangeNotifier {
  int _currentIndex = 0;
  bool _searchClicked = false;

  int get currentIndex => _currentIndex;
  bool get searchClicked => _searchClicked;

  onTabClicked(int index) {
    _currentIndex = index;
    _searchClicked = false;
    notifyListeners();
  }

  onSearchClicked() {
    _searchClicked = true;
    notifyListeners();
  }

  onCancelClicked() {
    _searchClicked = false;
    notifyListeners();
  }
}
