import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:path/path.dart' as p;

/// 更新服务类 - 处理 JSON 数据和图片文件的持久化
class UpdateService {
  /// 数据根目录
  static final String basePath = p.join(Directory.current.path, 'services', 'update_data');

  /// 确保目录存在，如果不存在则创建
  static Future<void> ensureDirectory(String path) async {
    final dir = Directory(path);
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
  }

  /// 将 JSON 数据保存到文件
  static Future<void> saveJsonData(String filePath, dynamic data) async {
    await ensureDirectory(p.dirname(filePath));
    final file = File(filePath);
    final jsonString = JsonEncoder.withIndent('  ').convert(data);
    await file.writeAsString(jsonString, encoding: utf8);
  }

  /// 生成随机字符串
  static String _randomString(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final rnd = Random();
    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => chars.codeUnitAt(rnd.nextInt(chars.length)),
      ),
    );
  }

  /// 获取安全的文件名（处理编码和冲突）
  static Future<String> getSafeFileName(String originalName, String saveDir) async {
    String fileName;
    try {
      // 处理文件名编码问题
      fileName = utf8.decode(latin1.encode(originalName));
    } catch (e) {
      final ext = p.extension(originalName);
      fileName = '${DateTime.now().millisecondsSinceEpoch}-${_randomString(8)}$ext';
    }

    var fullPath = p.join(saveDir, fileName);
    if (await File(fullPath).exists()) {
      final nameWithoutExt = p.basenameWithoutExtension(fileName);
      final ext = p.extension(fileName);
      int counter = 1;
      do {
        fullPath = p.join(saveDir, '${nameWithoutExt}_$counter$ext');
        counter++;
      } while (await File(fullPath).exists());
      fileName = p.basename(fullPath);
    }

    return fileName;
  }

  /// 保存图片文件到指定目录
  static Future<List<String>> saveImages(List<File> files, String type) async {
    final saveDir = p.join(basePath, 'img_storage', type);
    await ensureDirectory(saveDir);

    final savedFiles = <String>[];
    for (final file in files) {
      final safeFileName = await getSafeFileName(p.basename(file.path), saveDir);
      final savePath = p.join(saveDir, safeFileName);
      await file.copy(savePath);
      savedFiles.add(savePath);
    }
    return savedFiles;
  }

  /// 保存 Booklet 图片
  static Future<List<String>> saveBookletImages(List<File> files) => saveImages(files, 'booklet');

  /// 保存 Essay 图片
  static Future<List<String>> saveEssayImages(List<File> files) => saveImages(files, 'essay');
}