// import 'dart:convert';
// import 'dart:io';
// import 'package:northstar/_server/models/backup_service.dart';
// import 'package:shelf/shelf.dart';
// import 'package:path/path.dart' as p;
// import 'package:shelf_multipart/shelf_multipart.dart';

// /// 更新控制器 - 处理与更新相关的 HTTP 请求
// class UpdateController {
//   /// 更新 Booklet 数据
//   static Future<Response> updateBooklet(Request request) async {
//     try {
//       final body = await request.readAsString();
//       final jsonData = jsonDecode(body);

//       await UpdateService.saveJsonData(
//         p.join(UpdateService.basePath, 'booklet', 'styles.json'),
//         jsonData['styles'],
//       );
//       await UpdateService.saveJsonData(
//         p.join(UpdateService.basePath, 'booklet', 'records.json'),
//         jsonData['records'],
//       );

//       print('更新booklet完成\n');
//       return Response.ok(jsonEncode({'status': 'success'}));
//     } catch (e) {
//       print(e);
//       return Response.internalServerError(body: jsonEncode({
//         'status': 'error',
//         'message': '更新booklet失败',
//         'details': e.toString()
//       }));
//     }
//   }

//   /// 更新 Essay 数据
//   static Future<Response> updateEssay(Request request) async {
//     try {
//       final body = await request.readAsString();
//       final jsonData = jsonDecode(body);

//       await UpdateService.saveJsonData(
//         p.join(UpdateService.basePath, 'essay', 'year_summaries.json'),
//         jsonData['year_summaries'],
//       );
//       await UpdateService.saveJsonData(
//         p.join(UpdateService.basePath, 'essay', 'labels.json'),
//         jsonData['labels'],
//       );
//       await UpdateService.saveJsonData(
//         p.join(UpdateService.basePath, 'essay', 'essays.json'),
//         jsonData['essays'],
//       );

//       print('更新essay完成\n');
//       return Response.ok(jsonEncode({'status': 'success'}));
//     } catch (e) {
//       print(e);
//       return Response.internalServerError(body: jsonEncode({
//         'status': 'error',
//         'message': '更新essay失败',
//         'details': e.toString()
//       }));
//     }
//   }

//   /// 通用图片上传处理
//   static Future<Response> _uploadImages(Request request, String type) async {
//     if (!request.isMultipart) {
//       return Response(400, body: jsonEncode({
//         'status': 'error',
//         'message': '请求不是 multipart/form-data'
//       }));
//     }

//     final saveDir = p.join(UpdateService.basePath, 'img_storage', type);
//     await UpdateService.ensureDirectory(saveDir);

//     int count = 0;
//     await for (final part in request.parts) {
//       if (part is FormData && part.filename != null) {
//         // 通过扩展名判断图片类型（替代 lookupMimeType）
//         final ext = p.extension(part.filename!).toLowerCase();
//         if (!['.jpg', '.jpeg', '.png', '.gif', '.bmp', '.webp'].contains(ext)) {
//           return Response(400, body: jsonEncode({
//             'status': 'error',
//             'message': '只允许上传图片文件: ${part.filename}'
//           }));
//         }

//         final safeFileName = await UpdateService.getSafeFileName(part.filename!, saveDir);
//         final savePath = p.join(saveDir, safeFileName);
//         final file = File(savePath);
//         final sink = file.openWrite();
//         await part.data.pipe(sink);
//         await sink.close();
//         count++;
//       }
//     }

//     if (count == 0) {
//       return Response(400, body: jsonEncode({
//         'status': 'error',
//         'message': '没有文件被上传'
//       }));
//     }

//     return Response.ok(jsonEncode({
//       'status': 'success',
//       'message': '文件上传成功',
//       'count': count
//     }));
//   }

//   /// 上传 Booklet 图片
//   static Future<Response> uploadBookletImages(Request request) => _uploadImages(request, 'booklet');

//   /// 上传 Essay 图片
//   static Future<Response> uploadEssayImages(Request request) => _uploadImages(request, 'essay');
// }