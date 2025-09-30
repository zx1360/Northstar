import 'package:shelf_router/shelf_router.dart';

/// 更新相关路由
Router createBackupRouter() {
  final router = Router();
  router.post('/booklet', (){});

  // router.post('/booklet', UpdateController.updateBooklet);
  // router.post('/essay', UpdateController.updateEssay);
  // router.post('/booklet_imgs', UpdateController.uploadBookletImages);
  // router.post('/essay_imgs', UpdateController.uploadEssayImages);
  return router;
}