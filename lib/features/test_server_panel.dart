import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:northstar/_server/myserver.dart';

// 服务器控制页面 - 应用的主界面
class ServerControlPage extends StatefulWidget {
  const ServerControlPage({super.key});

  @override
  State<ServerControlPage> createState() => _ServerControlPageState();
}

class _ServerControlPageState extends State<ServerControlPage> {
  // 服务器实例
  final Myserver _server = Myserver();
  
  // 状态变量
  bool _isServerRunning = false;
  String _statusMessage = "服务器未启动";
  final TextEditingController _portController = TextEditingController(text: "9527");
  final List<String> _logMessages = [];

  // 启动/停止服务器
  Future<void> _toggleServer() async {
    if (_isServerRunning) {
      // 停止服务器
      await _server.stop();
      _addLog("服务器已停止");
    } else {
      // 启动服务器
      final port = int.tryParse(_portController.text) ?? 8080;
      try {
        await _server.start(port: port);
        _addLog("服务器启动成功，端口: $port");
        // 监听服务器事件（假设有相关回调）
        // _server.onRequestReceived = (String path) {
        //   _addLog("收到请求: $path");
        // };
      } catch (e) {
        _addLog("启动失败: ${e.toString()}");
      }
    }

    // 更新状态
    setState(() {
      _isServerRunning = _server.isRunning;
      _statusMessage = _isServerRunning 
          ? "服务器运行中 (端口: ${_server.port})" 
          : "服务器未启动";
    });
  }

  // 添加日志消息
  void _addLog(String message) {
    final time = DateTime.now().toString().split(" ")[1];
    setState(() {
      _logMessages.insert(0, "[$time] $message");
      // 限制日志数量，避免内存占用过大
      if (_logMessages.length > 100) {
        _logMessages.removeLast();
      }
    });
  }

  // 复制服务器地址到剪贴板
  void _copyServerAddress() {
    if (_isServerRunning) {
      final address = "http://localhost:${_server.port}";
      Clipboard.setData(ClipboardData(text: address));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("已复制地址: $address")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("漫画备份中心"),
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () => showAboutDialog(
              context: context,
              applicationName: "漫画备份中心",
              applicationVersion: "1.0.0",
              children: [const Text("用于管理漫画数据备份的桌面工具")],
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 服务器控制区域
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _portController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: "服务器端口",
                              hintText: "输入端口号（1-65535）",
                              border: OutlineInputBorder(),
                            ),
                            enabled: !_isServerRunning, // 服务器运行时不可编辑
                          ),
                        ),
                        const SizedBox(width: 16),
                        ElevatedButton(
                          onPressed: _toggleServer,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 16),
                            backgroundColor: _isServerRunning 
                                ? Colors.red 
                                : Theme.of(context).primaryColor,
                          ),
                          child: Text(
                            _isServerRunning ? "停止服务器" : "启动服务器",
                            style: const TextStyle(fontSize: 16, color: Colors.amber),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _statusMessage,
                          style: TextStyle(
                            fontSize: 16,
                            color: _isServerRunning ? Colors.green : Colors.grey,
                          ),
                        ),
                        if (_isServerRunning)
                          TextButton.icon(
                            onPressed: _copyServerAddress,
                            icon: const Icon(Icons.copy),
                            label: const Text("复制地址"),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // 日志区域
            const Text(
              "服务器日志:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _logMessages.isEmpty
                      ? const Center(child: Text("暂无日志信息"))
                      : ListView.builder(
                          itemCount: _logMessages.length,
                          itemBuilder: (context, index) => Text(
                            _logMessages[index],
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 页面销毁时停止服务器
  @override
  void dispose() {
    if (_isServerRunning) {
      _server.stop();
    }
    _portController.dispose();
    super.dispose();
  }
}
    