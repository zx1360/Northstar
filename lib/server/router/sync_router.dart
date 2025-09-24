import 'package:pilgrim/server/handler/sync_handler.dart';
import 'package:shelf_router/shelf_router.dart';

Router createSyncRouter(){
  final router = Router();
  router.get("/booklet", SyncHandler.syncBooklet);
  router.get("/essay", SyncHandler.syncEssay);

  return router;
}