import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiktok_flutter/pages/friend_page/friend_dynamic_state/dynamic_state.dart';
import 'package:tiktok_flutter/pages/friend_page/friend_recommend/recommend.dart';

class FriendPage extends StatefulWidget {
  FriendPage({Key key}) : super(key: key);

  @override
  _FriendPageState createState() => _FriendPageState();
}

class _FriendPageState extends State<FriendPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Container(
          margin: EdgeInsets.all(10.0),
          child: Image.asset(
            "asset/images/add.png",
            color: Colors.white,
          ),
        ),
        title: Container(
            alignment: Alignment.center,
            height: ScreenUtil().setHeight(.55),
            width: ScreenUtil().setWidth(9),
            margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.grey,
                filled: true,
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            )),
      ),
      body: ListView(
        children: [
          FriendDynamicState(),
          Divider(
            color: Colors.grey,
          ),
          FriendRecommend()
        ],
      ),
    );
  }
}
