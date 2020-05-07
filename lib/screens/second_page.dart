import 'package:flutter/material.dart';


class SecondPage extends StatelessWidget {

  const SecondPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(itemBuilder: (context, index) {
      return ListTile(title: Text("Haimal Khetan"),
          subtitle: Text("$index"));
    });
  }
}