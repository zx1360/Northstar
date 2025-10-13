import 'package:northstar/_server/myserver.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'status_provider.g.dart';


// 状态管理员.
class Cashier{
  final Myserver server = Myserver();
}

// 状态提供者
@riverpod
class AppStatus extends _$AppStatus{
  @override
  Cashier build(){
    return Cashier();
  }

  // ----Myserver, web服务相关.
  bool get isRunning => state.server.isRunning;
  // Future<void>
}
