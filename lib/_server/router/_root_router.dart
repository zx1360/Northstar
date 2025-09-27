import 'package:northstar/_server/router/backup_router.dart';
import 'package:northstar/_server/router/sync_router.dart';
import 'package:shelf_router/shelf_router.dart';

Router createRootRouter(){
  final rootRouter = Router();
  rootRouter.mount("/backup", createBackupRouter().call);
  rootRouter.mount("/sync", createSyncRouter().call);
  return rootRouter;
}
