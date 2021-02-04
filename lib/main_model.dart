import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_list_and_form_test/list_arguments.dart';

class MainModel extends ChangeNotifier {
  String titleText = 'タイトル';
  String bodyText = '本文';
  List<ListArguments> listArguments = [];
  List<ListArguments> listArgumentsFirebase = [];

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

  Future fetchListArguments() async {
    final docs = await Firestore.instance.collection('listArguments').getDocuments();
    final listArgumentsFirebase = docs.documents.map((doc) => ListArguments(doc['title'], doc['body'])).toList();
    this.listArgumentsFirebase = listArgumentsFirebase;
    notifyListeners();
  }

  Future addArgumentsToFirebase() async {
    //TODO validation
    Firestore.instance.collection('listArguments').add(
      {
        'title': titleText,
        'body': bodyText,
      },
    );
  }
}
