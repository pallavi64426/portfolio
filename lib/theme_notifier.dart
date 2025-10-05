import 'package:flutter/foundation.dart';

class ThemeNotifier extends ChangeNotifier {
  bool _isDarkMode = true;

  bool get isDarkMode => _isDarkMode;

  void toggle() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
