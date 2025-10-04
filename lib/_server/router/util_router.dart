import 'package:northstar/_server/handler/util_handler.dart';
import 'package:shelf_router/shelf_router.dart';

Router createUtilRouter(){
  final router = Router();
  router.get("/test", UtilHandler.test);

  return router;
}