import 'package:northstar/_server/core/services/io/io_service.dart';
import 'package:northstar/_server/router/backup_router.dart';
import 'package:northstar/_server/router/sync_router.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_static/shelf_static.dart';

Router createRootRouter(){
  final rootRouter = Router();

  // 响应静态资源
  final staticHandler = createStaticHandler(IoService.appDir);
  rootRouter.get("/static/<ignored|.*>", staticHandler);

  // 数据备份/同步
  rootRouter.mount("/backup", createBackupRouter().call);
  rootRouter.mount("/sync", createSyncRouter().call);

  return rootRouter;
}
