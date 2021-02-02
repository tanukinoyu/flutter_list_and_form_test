import 'package:flutter/material.dart';

class MainModel extends ChangeNotifier {
  String titleText = 'タイトル';
  String bodyText = '本文';

  void changeTitleText(String title) {
    titleText = title;
    notifyListeners();
  }

  void changeBodyText(String body) {
    bodyText = body;
    notifyListeners();
  }
}