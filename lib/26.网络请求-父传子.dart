import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'source_code_viewer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();

    // 发起网络请求
    _getChannels();
  }

  List<Map<String, dynamic>> _list = [];

  void _getChannels() async {
    DioUtils util = DioUtils();
    Response<dynamic> result = await util.get('channels');
    Map<String, dynamic> res = result.data as Map<String, dynamic>;
    List data = res['data']['channels'] as List;
    setState(() {
      _list = data.cast<Map<String, dynamic>>();
      print(_list);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SourceCodeViewer(
      sourceCode: '''import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();

    // 发起网络请求
    _getChannels();
  }

  List<Map<String, dynamic>> _list = [];

  void _getChannels() async {
    DioUtils util = DioUtils();
    Response<dynamic> result = await util.get('channels');
    Map<String, dynamic> res = result.data as Map<String, dynamic>;
    List data = res['data']['channels'] as List;
    setState(() {
      _list = data.cast<Map<String, dynamic>>();
      print(_list);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GridView.extent(
          padding: const EdgeInsets.all(10),
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 3,
          children: List.generate(_list.length, (index) {
            return ChannelItem(
              item: _list[index],
              index: index,
              delChannel: (int index) {
                setState(() {
                  _list.removeAt(index);
                });
              },
            );
          }),
        ),
      ),
    );
  }
}

class ChannelItem extends StatelessWidget {
  final Map<String, dynamic> item;
  final int index;
  final Function(int index) delChannel;
  const ChannelItem({
    super.key,
    required this.item,
    required this.index,
    required this.delChannel,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text(
            item['name'] ?? '空',
            style: TextStyle(color: Colors.white),
          ),
        ),

        Positioned(
          child: IconButton(
            onPressed: () {
              delChannel(index);
            },
            icon: Icon(Icons.delete, color: Colors.red),
          ),
        ),
      ],
    );
  }
}

class DioUtils {
  final _dio = Dio();

  DioUtils() {
    // 设置基础地址和超时时间
    _dio.options
      ..baseUrl = 'https://geek.itheima.net/v1_0/'
      ..connectTimeout = Duration(seconds: 10)
      ..sendTimeout = Duration(seconds: 10)
      ..receiveTimeout = Duration(seconds: 10);

    // 拦截器
    _addInterceptors();
  }
  void _addInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (context, handler) => {handler.next(context)},
        onResponse: (response, handler) => {
          if (response.statusCode == 200)
            {handler.next(response)}
          else
            {
              handler.reject(
                DioException(requestOptions: response.requestOptions),
              ),
            },
        },
        onError: (error, handler) => {handler.reject(error)},
      ),
    );
  }

  Future<Response<dynamic>> get(
    String url, {
    Map<String, dynamic>? params,
    Options? options,
  }) {
    return _dio.get(url, queryParameters: params, options: options);
  }
}''',
      demoBuilder: () => Scaffold(
        body: GridView.extent(
          padding: const EdgeInsets.all(10),
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 3,
          children: List.generate(_list.length, (index) {
            return ChannelItem(
              item: _list[index],
              index: index,
              delChannel: (int index) {
                setState(() {
                  _list.removeAt(index);
                });
              },
            );
          }),
        ),
      ),
    );
  }
}

class ChannelItem extends StatelessWidget {
  final Map<String, dynamic> item;
  final int index;
  final Function(int index) delChannel;
  const ChannelItem({
    super.key,
    required this.item,
    required this.index,
    required this.delChannel,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text(
            item['name'] ?? '空',
            style: TextStyle(color: Colors.white),
          ),
        ),

        Positioned(
          child: IconButton(
            onPressed: () {
              delChannel(index);
            },
            icon: Icon(Icons.delete, color: Colors.red),
          ),
        ),
      ],
    );
  }
}

class DioUtils {
  final _dio = Dio();

  DioUtils() {
    // 设置基础地址和超时时间
    _dio.options
      ..baseUrl = 'https://geek.itheima.net/v1_0/'
      ..connectTimeout = Duration(seconds: 10)
      ..sendTimeout = Duration(seconds: 10)
      ..receiveTimeout = Duration(seconds: 10);

    // 拦截器
    _addInterceptors();
  }
  void _addInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (context, handler) => {handler.next(context)},
        onResponse: (response, handler) => {
          if (response.statusCode == 200)
            {handler.next(response)}
          else
            {
              handler.reject(
                DioException(requestOptions: response.requestOptions),
              ),
            },
        },
        onError: (error, handler) => {handler.reject(error)},
      ),
    );
  }

  Future<Response<dynamic>> get(
    String url, {
    Map<String, dynamic>? params,
    Options? options,
  }) {
    return _dio.get(url, queryParameters: params, options: options);
  }
}

void main() {
  runApp(MaterialApp(
    home: MainPage(),
  ));
}
