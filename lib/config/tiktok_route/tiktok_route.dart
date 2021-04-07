import 'package:flutter/material.dart';
import 'package:tiktok_flutter/pages/friend_page/friend.dart';
import 'package:tiktok_flutter/pages/high_component.dart';
import 'package:tiktok_flutter/pages/home_page/home.dart';
import 'package:tiktok_flutter/pages/message_page/message.dart';
import 'package:tiktok_flutter/pages/mine_page/mine.dart';
import 'package:tiktok_flutter/pages/record_video_page/record.dart';

Map<String, WidgetBuilder> tikTokRoute = {
  "/": (ctx) => HighComponent(),
  "homePage": (ctx) => HomePage(),
  "friendPage": (ctx) => FriendPage(),
  "messagePage": (ctx) => MessagePage(),
  "minePage": (ctx) => MinePage(),
  "recordVideoPage": (ctx) => RecordVideoPage(),
};
