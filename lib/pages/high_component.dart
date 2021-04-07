import 'package:flutter/material.dart';
import 'package:tiktok_flutter/pages/friend_page/friend.dart';
import 'package:tiktok_flutter/pages/message_page/message.dart';
import 'package:tiktok_flutter/pages/mine_page/mine.dart';
import 'package:tiktok_flutter/pages/record_video_page/record.dart';

import 'home_page/home.dart';

class HighComponent extends StatefulWidget {
  @override
  _HighComponentState createState() => _HighComponentState();
}

class _HighComponentState extends State<HighComponent> {
  final List page = [
    HomePage(),
    FriendPage(),
    RecordVideoPage(),
    MessagePage(),
    MinePage()
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget _currentPage = page[_currentIndex];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        currentIndex: _currentIndex,
        selectedFontSize: 14.0,
        unselectedFontSize: 14.0,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _currentPage = page[index];
          });
        },
        items: [
          BottomNavigationBarItem(
              label: '首页',
              icon: Icon(Icons.nature, size: 0, color: Colors.white70)),
          BottomNavigationBarItem(
              label: '朋友',
              icon: Icon(Icons.nature, size: 0, color: Colors.white70)),
          BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.add,
              )),
          BottomNavigationBarItem(
              label: '消息',
              icon: Icon(Icons.nature, size: 0, color: Colors.white70)),
          BottomNavigationBarItem(
              label: '我',
              icon: Icon(Icons.nature, size: 0, color: Colors.white70)),
        ],
      ),
      body: _currentPage,
    );
  }
}
