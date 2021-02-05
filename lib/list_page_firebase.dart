import 'package:flutter/material.dart';
import 'package:flutter_list_and_form_test/list_arguments.dart';
import 'package:provider/provider.dart';

import 'main_model.dart';

class ListPageFirebase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List_firebase'),
      ),
      body: MyListWidget(),
    );
  }
}

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    this.title,
    this.body,
  });

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.pink, width: 3),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Center(
                  child: Icon(
                    Icons.wine_bar,
                    color: Colors.pink,
                    size: 40.0,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: _ListTileData(
                  title: title,
                  body: body,
                ),
              ),
              const Icon(
                Icons.more_vert,
                size: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ListTileData extends StatelessWidget {
  const _ListTileData({
    Key key,
    this.title,
    this.body,
  }) : super(key: key);

  final String title;
  final String body;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16.0,
            ),
          ),
          const Padding(
              padding: EdgeInsets.symmetric(vertical: 2.0)
          ),
          Text(
            body,
            style: const TextStyle(
                fontSize: 14.0
            ),
          ),
        ],
      ),
    );
  }

}
class MyListWidget extends StatelessWidget {
  MyListWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainModel>(
      create: (_) => MainModel()..fetchListArguments(),
      child: Consumer<MainModel>(
        builder: (context, model, child) {
          final List<ListArguments> list = model.listArgumentsFirebase;

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return CustomListItem(
                title: list[index].title,
                body: list[index].body,
              );
            },
          );
        }
      ),
    );
  }

}