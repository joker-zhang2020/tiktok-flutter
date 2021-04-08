import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessagePage extends StatefulWidget {
  MessagePage({Key key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Container(
          margin: EdgeInsets.all(10.0),
          child: Image.asset(
            "asset/images/add(1).png",
            color: Colors.white,
          ),
        ),
        title: Text('消息'),
        actions: [
          Container(
              margin: EdgeInsets.all(10.0),
              child: Image.asset(
                "asset/images/video.png",
                color: Colors.white,
              ))
        ],
      ),
      body: Container(
        child: Text('friend_page'),
      ),
    );
  }
}
