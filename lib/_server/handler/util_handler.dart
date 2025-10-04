import 'dart:convert';

import 'package:shelf/shelf.dart';

// 工具类请求处理.
class UtilHandler {
  static Future<Response> test(Request req) async {
    return Response.ok(
      jsonEncode({"message": "/util/test 成功联通."}),
      headers: {"Content-Type": "application/json"},
    );
  }
}
