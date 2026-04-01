/*
 * @Author: cui
 * @Date: 2026-03-31 15:45:34
 * @LastEditors: cui
 * @LastEditTime: 2026-03-31 15:45:35
 * @FilePath: /flutter_base_component/lib/source_code_viewer.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SourceCodeViewer extends StatefulWidget {
  final String sourceCode;
  final Widget Function() demoBuilder;

  const SourceCodeViewer({
    super.key,
    required this.sourceCode,
    required this.demoBuilder,
  });

  @override
  State<SourceCodeViewer> createState() => _SourceCodeViewerState();
}

class _SourceCodeViewerState extends State<SourceCodeViewer> {
  bool _showSourceCode = false;

  Future<void> _copySourceCode() async {
    await Clipboard.setData(ClipboardData(text: widget.sourceCode));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('源代码已复制到剪贴板'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 源代码控制按钮
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    _showSourceCode = !_showSourceCode;
                  });
                },
                icon: Icon(_showSourceCode ? Icons.code_off : Icons.code),
                label: Text(_showSourceCode ? '隐藏源代码' : '查看源代码'),
              ),
              const SizedBox(width: 16),
              if (_showSourceCode)
                ElevatedButton.icon(
                  onPressed: _copySourceCode,
                  icon: const Icon(Icons.copy),
                  label: const Text('复制源代码'),
                ),
            ],
          ),
        ),

        // 内容区域
        Expanded(
          child: _showSourceCode
              ? SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: SelectableText(
                      widget.sourceCode,
                      style: TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 14,
                        color: Colors.grey[300],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                )
              : widget.demoBuilder(),
        ),
      ],
    );
  }
}
