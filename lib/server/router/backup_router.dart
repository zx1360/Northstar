import 'package:pilgrim/server/handler/backup_bandler.dart';
import 'package:shelf_router/shelf_router.dart';

Router createBackupRouter(){
  final router = Router();
  router.post("/booklet", BackupBandler.backupBooklet);
  router.post("/essay", BackupBandler.backupEssay);
  
  return router;
}