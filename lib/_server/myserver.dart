import 'dart:io';

import 'package:northstar/_server/core/services/network/network_service.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:northstar/_server/router/_root_router.dart';

class Myserver {
  // 服务器配置信息
  late HttpServer _server;
  late String _ip;
  int _port = 4215;
  bool _isRunning = false;

  // 信息get
  bool get isRunning => _isRunning;
  String get ip => _ip;
  int get port => _port;

  // 启动web服务.
  Future<void> start({int port=4215}) async{
    if(_isRunning) return;

    _port = port;
    try{
      // 路由及请求处理.
      final router = createRootRouter();
      final handler = Pipeline()
        .addMiddleware(logRequests())
        .addHandler(router.call);

      _ip = await getLocalIps();
      _server = await shelf_io.serve(handler, _ip, _port);
      _isRunning = true;
    }catch(err){
      throw Exception("err: $err");
    }
  }

  // 暂停web服务.
  Future<void> stop()async{
    if(!_isRunning) return;

    await _server.close();
    _isRunning = false;
    print("server: 已停止");
  }
}