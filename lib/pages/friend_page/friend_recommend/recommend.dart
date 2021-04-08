import 'package:flutter/material.dart';

class FriendRecommend extends StatefulWidget {
  @override
  _FriendRecommendState createState() => _FriendRecommendState();
}

class _FriendRecommendState extends State<FriendRecommend> {
  final List<dynamic> _list = [
    {"name": "123", "recommend": '456', "pic": '123'},
    {"name": "123", "recommend": '456', "pic": '123'}
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: EdgeInsets.fromLTRB(50, 20, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '朋友推荐',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                Container(
                    height: 20,
                    width: 20,
                    child: Image.asset("asset/images/image_login_caution.png",
                        color: Colors.white))
              ],
            )),
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _list.map((item) {
              return Container(
                  margin: EdgeInsets.fromLTRB(40, 20, 40, 20),
                  child: Row(
                    children: [
                      CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              AssetImage("asset/images/friend_picture.png")),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "data",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text("123",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12))
                        ],
                      )),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.deepOrange)),
                          onPressed: () {},
                          child: Text('关注')),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'x',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ));
            }).toList())
      ],
    );
  }
}
