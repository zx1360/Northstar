import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:northstar/_server/router/_root_router.dart';

class Myserver {
  late HttpServer _server;
  int _port = 9527;
  bool _isRunning = false;

  bool get isRunning => _isRunning;
  int get port => _port;

  Future<void> start({int port=9527}) async{
    if(_isRunning) return;

    _port = port;
    try{
      final router = createRootRouter();
      final handler = Pipeline()
        .addMiddleware(logRequests())
        // .addMiddleware(corsMiddleWare)
        .addHandler(router.call);
      _server = await shelf_io.serve(handler, InternetAddress.anyIPv4, _port);
      _isRunning = true;
      print("服务器运行于: $_port");
    }catch(err){
      throw Exception("err: $err");
    }
  }

  Future<void> stop()async{
    if(!_isRunning) return;

    await _server.close();
    _isRunning = false;
    print("server: 已停止");
  }
}