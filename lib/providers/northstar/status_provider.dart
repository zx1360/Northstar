import 'package:northstar/_server/myserver.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'status_provider.g.dart';

// 状态管理员.
class Cashier {
  final MyServer server;
  Cashier({required this.server});

  factory Cashier.create({MyServer? server}){
    return Cashier(server: server??MyServer());
  }

  Cashier copyWith({
    MyServer? server,
  }) {
    return Cashier(
      server: server ?? this.server,
    );
  }
}

// 状态提供者
@riverpod
class AppStatus extends _$AppStatus {
  @override
  Cashier build() {
    return Cashier.create();
  }

  // ----MyServer, web服务相关.
  bool get isServerRunning => state.server.isRunning;
  Future<void> stopServer()async{
    await state.server.stop();
    state = state.copyWith();
  }
  Future<void> startServer({required int port})async{
    await state.server.start(port: port);
    state = state.copyWith();
  }
}
