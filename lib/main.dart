import 'package:flutter/material.dart';

import 'ListPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home': (context) => MyHomePage(),
        '/list': (context) => ListPage(),
      },
      title: 'List and Form test',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  final titleTextController = TextEditingController();
  final bodyTextController = TextEditingController();

  String title = 'タイトル';
  String body = '本文';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('フォームとリスト'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: titleTextController,
                decoration: InputDecoration(
                  hintText: 'タイトル',
                  labelText: 'Title',
                ),
                onEditingComplete: () {
                  title = titleTextController.text;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: bodyTextController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: '本文',
                  labelText: 'Body',
                ),
                onEditingComplete: () {
                  body = bodyTextController.text;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                child: Text('投稿する'),
                onPressed: () {
                  Navigator.pushNamed(context, '/list');
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.pink, width: 3),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: Icon(Icons.wine_bar)
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(title),
                            Text(body),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}
