import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:northstar/_server/myserver.dart';

class ServerPage extends StatefulWidget {
  const ServerPage({super.key});

  @override
  State<ServerPage> createState() => _ServerPageState();
}

class _ServerPageState extends State<ServerPage> {
  // Web服务实例
  final Myserver _server = Myserver();

  // 状态变量
  bool _isServerRunning = false;
  String _statusMessage = "Web服务尚未启动...";
  final _portController = TextEditingController(text: "4215");
  final List<String> _logMessages = [];

  // 切换服务器运行状态
  Future<void> _toggleServer() async {
    if (_isServerRunning) {
      await _server.stop();
      _addLog("Web服务已停止.");
    } else {
      final port = int.tryParse(_portController.text) ?? 4215;
      try {
        await _server.start(port: port);
        _addLog("服务器启动: ${_server.ip}:$port");
      } catch (e) {
        _addLog("启动失败: ${e.toString()}");
      }
    }

    // 更新ui状态
    setState(() {
      _isServerRunning = _server.isRunning;
      _statusMessage = _isServerRunning
          ? "服务器运行中(端口: ${_server.port})"
          : "Web服务尚未启动...";
    });
  }

  // 添加日志消息
  void _addLog(String message) {
    final time = DateTime.now().toString();
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
      final address = "http://${_server.ip}:${_server.port}";
      Clipboard.setData(ClipboardData(text: address));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("已复制地址: $address")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    return Container(
      color: colorTheme.surface,
      child: Padding(
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
                              hintText: "输入端口号(1-65535)",
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
                              horizontal: 24,
                              vertical: 16,
                            ),
                            backgroundColor: _isServerRunning
                                ? colorTheme.onSecondary
                                : Theme.of(context).primaryColor,
                          ),
                          child: Text(
                            _isServerRunning ? "停止服务器" : "启动服务器",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.amber,
                            ),
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
                            color: _isServerRunning
                                ? Colors.green
                                : Colors.grey,
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
}
