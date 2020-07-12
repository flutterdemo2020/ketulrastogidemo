import 'package:flutter/cupertino.dart';

class ThemeService extends ChangeNotifier {
  Brightness _brightness = Brightness.light;

  Brightness get brightness => _brightness;

  toggleBrightness() {
    _brightness =
        (_brightness == Brightness.dark) ? Brightness.light : Brightness.dark;
    notifyListeners();
  }
}
