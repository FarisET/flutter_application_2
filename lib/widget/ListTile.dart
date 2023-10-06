import 'package:flutter/material.dart';

class FlutterListTile extends StatelessWidget {
  const FlutterListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),

        body: ListView.builder(
          itemCount: _data.length,
          itemBuilder: (context, index) {
           final item = _data[index];
           return _item(item);
        }));
  }
  }


class TileDataModel {
  TileDataModel({required this.subTitle, required this.title});
  final String title;
  final String subTitle;
}

Widget _item(TileDataModel item) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
        child: ListTile(
            leading: Icon(Icons.access_alarm),
            title: Text(item.title),
            subtitle: Text(item.subTitle),
            trailing: Icon(Icons.more_vert)
        )),
  );
}

var _data = [
  TileDataModel(subTitle: "subTitle 1", title: "title 1"),
  TileDataModel(subTitle: "subTitle 2", title: "title 2"),
  TileDataModel(subTitle: "subTitle 3", title: "title 3")
];
