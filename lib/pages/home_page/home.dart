import 'package:flutter/material.dart';
import 'package:tiktok_flutter/httpRequest/http_request.dart';
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
        future: HttpRequest.request("https://restapi.amap.com/v3/geocode/regeo",
            method: 'get',
            params: {
              "location": "117.01146,36.60033",
              "key": "7ea0a637a236f5d70e8f5164f9dfae4f"
            }),
        //determinePosition(),
        builder: (context, snapshot) {
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
                    tabs: tabs.map((e) {
                      if (snapshot.data != null && e == '地区') {
                        return Tab(
                            text: snapshot.data['regeocode']['addressComponent']
                                ["district"]);
                      } else {
                        return Tab(text: e);
                      }
                    }).toList()),
              ),
              body: snapshot.data != null
                  ? TabBarView(
                      controller: _tabController,
                      children: _list.map((page) {
                        return Container(
                          alignment: Alignment.center,
                          child: page,
                        );
                      }).toList(),
                    )
                  : Text('loading'));
        });
  }
}
