
import 'package:flutter/material.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _codeEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('TextField')),
        body: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              TextField(
                controller: _textEditingController,
                onChanged:(value) => {
                  print('账号: $value')
                },
                onSubmitted: (value) => {
                  print('账号提交: $value')
                },
                decoration: InputDecoration(
                  hintText: '请输入账号',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 232, 218, 176),
                  contentPadding: EdgeInsets.only(left: 20),
                
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _codeEditingController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: '请输入密码',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 232, 218, 176),
                  contentPadding: EdgeInsets.only(left: 20),
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                width: double.infinity,
                height: 50,
                child: TextButton(onPressed: () {
                  print('登录- ${_textEditingController.text} - ${_codeEditingController.text}');
                }, child: Text('登录', style: TextStyle(color: Colors.white))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
