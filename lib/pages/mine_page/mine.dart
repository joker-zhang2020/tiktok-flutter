import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  MinePage({Key key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, actions: [
        Container(
            margin: EdgeInsets.all(15.0),
            child: Image.asset(
              "asset/images/menu.png",
              color: Colors.white,
            ))
      ]),
      body: Container(
        child: Text('friend_page'),
      ),
    );
  }
}
