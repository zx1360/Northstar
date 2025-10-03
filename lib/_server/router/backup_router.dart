import 'package:northstar/_server/handler/backup_handler.dart';
import 'package:shelf_router/shelf_router.dart';

/// 更新相关路由
Router createBackupRouter() {
  final router = Router();
  router.post('/booklet', BackupHandler.backupBooklet);
  router.post('/essay', BackupHandler.backupEssay);

  return router;
}