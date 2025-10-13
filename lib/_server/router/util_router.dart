import 'package:northstar/_server/handler/util_handler.dart';
import 'package:shelf_router/shelf_router.dart';


// TODO: 在成功建立连接后, 继续发送torrid相关信息, 在northstar中呈现.
Router createUtilRouter(){
  final router = Router();
  router.get("/test", UtilHandler.test);

  return router;
}