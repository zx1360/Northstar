import 'dart:convert';
import 'dart:io';

import 'package:northstar/_server/core/services/io/io_service.dart';
import 'package:path/path.dart'as path;
import 'package:shelf/shelf.dart';

// 同步
class SyncHandler {
  // 同步booklet数据
  static Future<Response> syncBooklet(Request req)async{
    final targetDir =  path.join(IoService.appDir, "static/booklet");
    final Map<String, dynamic> data = {};
    final styleFile = File(path.join(targetDir, "styles.json"));
    final recordFile = File(path.join(targetDir, "records.json"));
    print((await styleFile.readAsString()).toString());
    data['styles'] = jsonDecode(await styleFile.readAsString());
    data['records'] = jsonDecode(await recordFile.readAsString());
    
    return Response.ok(
      jsonEncode(data),
      headers: {"Content-Type": "application/json"}
    );
  }


  // 同步essay数据.
  static Future<Response> syncEssay(Request req)async{
    final targetDir =  path.join(IoService.appDir, "static/essay");
    final Map<String, dynamic> data = {};
    final summaryFile = File(path.join(targetDir, "year_summaries.json"));
    final labelFile = File(path.join(targetDir, "labels.json"));
    final essayFile = File(path.join(targetDir, "essays.json"));
    data['year_summaries'] = await summaryFile.readAsString();
    data['labels'] = await labelFile.readAsString();
    data['essays'] = await essayFile.readAsString();
    
    return Response.ok(
      jsonEncode(data),
      headers: {"Content-Type": "application/json"}
    );
  }
}