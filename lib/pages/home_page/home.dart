import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tiktok_flutter/config/current_position/position.dart';
import 'package:tiktok_flutter/pages/home_page/attention_page/attention.dart';
import 'package:tiktok_flutter/pages/home_page/position_page/position.dart';
import 'package:tiktok_flutter/pages/home_page/recommend_page/recommend.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List tabs = ["地区", "推荐", "关注"];
  List<Widget> _list = [AttentionPage(), PositionPage(), RecommandPage()];
  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high),
        //determinePosition(),
        builder: (context, snapshot) {
          print('position in here');
          print(snapshot.data);
          print('position out here');
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                actions: [
                  Container(
                      margin: EdgeInsets.all(15.0),
                      child: Image.asset("asset/images/search.png",
                          color: Colors.white))
                ],
                leading: Container(
                    margin: EdgeInsets.all(10.0),
                    child: Image.asset(
                      "asset/images/livevideo.png",
                    )),
                title: TabBar(
                    //生成Tab菜单
                    controller: _tabController,
                    tabs: tabs.map((e) => Tab(text: e)).toList()),
              ),
              body: TabBarView(
                controller: _tabController,
                children: _list.map((page) {
                  return Container(
                    alignment: Alignment.center,
                    child: page,
                  );
                }).toList(),
              ));
        });
  }
}
