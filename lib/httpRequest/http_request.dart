import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiktok_flutter/httpRequest/http_config.dart';

class HttpRequest {
  static final BaseOptions baseOptions =
      BaseOptions(connectTimeout: HttpConfig.timeout);
  static final Dio dio = Dio(baseOptions);

  static Future<T> request<T>(String url,
      {String method = "get",
      Map<String, dynamic> data,
      Map<String, dynamic> params,
      Interceptor inter}) async {
    // 1.创建单独配置
    final options = Options(method: method);

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs?.getString('token') ?? '';
      String stations = prefs?.getString('station') ?? '';
      if (token != '' && stations != '') {
        options.headers['token'] = "Bear $token";
        options.headers['station'] = stations;
      }
    } catch (error) {
      print(error);
    }

    // 全局拦截器
    // 创建默认的全局拦截器
    Interceptor dInter = InterceptorsWrapper();
    List<Interceptor> inters = [dInter];

    // 请求单独拦截器
    if (inter != null) {
      inters.add(inter);
    }

    // 统一添加到拦截器中
    dio.interceptors.addAll(inters);

    // 2.发送网络请求
    try {
      Response response;
      if (method == 'get') {
        response =
            await dio.request(url, queryParameters: params, options: options);
      } else if (method == 'post') {
        response = await dio.request(url, data: data, options: options);
      }
      return response.data;
    } on DioError catch (e) {
      return Future.error(e);
    }
  }
}
