import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:tiktok_flutter/config/theme/tiktok_theme.dart';
import 'package:tiktok_flutter/config/tiktok_route/tiktok_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(10, 10),
      allowFontScaling: false,
      builder: () => MaterialApp(
        routes: tikTokRoute,
        debugShowCheckedModeBanner: false,
        title: 'TikTok-flutter',
        theme: TikTokTheme.norTheme,
      ),
    );
  }
}
