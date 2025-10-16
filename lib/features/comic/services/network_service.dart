import 'dart:async';

import 'package:http/http.dart';

class CrawlerConfig {
  static final headers = {
    'User-Agent':
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    'Referer': domain,
    'Accept':
        'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7',
    'Accept-Language': 'zh-CN,zh;q=0.9',
    'Upgrade-Insecure-Requests': '1',
    'Cache-Control': 'no-cache',
  };
  static String domain = "https://www.manhuayu5.com/";
}

Future<Response?> fetch(String url) async {
  try {
    // 设置5秒超时
    final resp = await get(Uri.parse(url), headers: CrawlerConfig.headers).timeout(
      const Duration(seconds: 5),
      onTimeout: () {
        throw TimeoutException('请求超时，请稍后再试');
      },
    );

    if (resp.statusCode == 200) {
      return resp;
    } else {
      throw Exception("请求失败，状态码: ${resp.statusCode}");
    }
  } catch (e) {
    print("请求发生错误: $e");
  }
  return null;
}
