import 'dart:io';

import 'package:path/path.dart'as path;

class IoService {
  static String get appDir => path.dirname(Platform.resolvedExecutable);
  
  // 初始化目录. 创建所有需要的目录结构.
  static void initDirectories(){
    List<String> dirs = [
      "static/img_storage",
      "static/booklet",
      "static/essay",
    ];
    dirs.forEach((dir)async{
      await getSaveDir(dir);
    });
  }
  
  // 根据相对路径创建一个目录.
  static Future<Directory> getSaveDir(String relativePath)async{
    String appDir = path.dirname(Platform.resolvedExecutable);
    String targetDir = path.join(appDir, relativePath);
    try{
      return Directory(targetDir).create(recursive: true);
    }catch(e){
      throw Exception("getSaveDir($targetDir)出错: $e");
    }
  }

  // 根据相对路径获取文件
  static Future<File> getFile(String relativePath)async{
    final targetDir = await getSaveDir(relativePath);
    return File(path.join(targetDir.path, relativePath));
  }

  // 将文件保存到指定目录
  static Future<String> saveFile(File file, String relativePath)async{
    final targetDir = await getSaveDir(relativePath);
    final destination = path.join(targetDir.path, path.basename(file.path));
    try{
      file.copy(destination);
      return destination;
    }catch(e){
      throw Exception("saveFile出错: $e");
    }
  }

}