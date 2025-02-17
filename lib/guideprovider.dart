
import 'package:flutter/material.dart';

class GuideProvider extends ChangeNotifier {
  int _currentPage = 0;
  bool _isDarkMode = false;

  int get currentPage => _currentPage;
  bool get isDarkMode => _isDarkMode;

  void setCurrentPage(int page) {
    _currentPage = page;
    notifyListeners();
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}

