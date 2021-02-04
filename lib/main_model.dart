import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_list_and_form_test/list_arguments.dart';

class MainModel extends ChangeNotifier {
  String titleText = 'タイトル';
  String bodyText = '本文';
  List<ListArguments> listArguments = [];

  void changeTitleText(String title) {
    titleText = title;
    notifyListeners();
  }

  void changeBodyText(String body) {
    bodyText = body;
    notifyListeners();
  }

  ListArguments createListArguments() {
    final ListArguments newListArguments = ListArguments(titleText, bodyText);
    return newListArguments;
  }

  void addListArguments(ListArguments object) {
    listArguments.add(object);
  }

  Future fetchListArguments() {
    final docs = Firestore.instance.collection('listArguments').getDocuments();
  }
}
