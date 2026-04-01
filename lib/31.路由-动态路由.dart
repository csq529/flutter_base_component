import 'package:flutter/material.dart';
import 'source_code_viewer.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SourceCodeViewer(
      sourceCode: '''import 'package:flutter/material.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/goodsList',
      routes: {'/goodsList': (context) => GoodsList()},
      onGenerateRoute: (settings) {
        if (settings.name == '/cartList') {
        
          bool isLogin = false;

          if (isLogin) {
            return MaterialPageRoute(
              builder: (context) {
                return CartList();
              },
            );
          } else {
            return MaterialPageRoute(
              builder: (context) {
                return LoginPage();
              },
            );
          }
        }
      },
    );
  }
}

// 商品列表页面
class GoodsList extends StatefulWidget {
  const GoodsList({super.key});

  @override
  State<GoodsList> createState() => _GoodsListState();
}

class _GoodsListState extends State<GoodsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('商品列表')),
      body: Center(
        child: Container(
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cartList');
            },
            child: Text('加入购物车'),
          ),
        ),
      ),
    );
  }
}

// 购物车列表页面
class CartList extends StatefulWidget {
  const CartList({super.key});

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('购物车页面')),
      body: Center(
        child: Container(
          child: TextButton(onPressed: () {}, child: Text('加入购物车')),
        ),
      ),
    );
  }
}


// 登录页面
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('登录页面')),
      body: Center(
        child: Container(
          child: TextButton(onPressed: () {}, child: Text('加入购物车')),
        ),
      ),
    );
  }
}''',
      demoBuilder: () => MaterialApp(
        initialRoute: '/goodsList',
        routes: {'/goodsList': (context) => GoodsList()},
        onGenerateRoute: (settings) {
          if (settings.name == '/cartList') {
            bool isLogin = false;
            if (isLogin) {
              return MaterialPageRoute(
                builder: (context) {
                  return CartList();
                },
              );
            } else {
              return MaterialPageRoute(
                builder: (context) {
                  return LoginPage();
                },
              );
            }
          }
        },
      ),
    );
  }
}

// 商品列表页面
class GoodsList extends StatefulWidget {
  const GoodsList({super.key});

  @override
  State<GoodsList> createState() => _GoodsListState();
}

class _GoodsListState extends State<GoodsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('商品列表')),
      body: Center(
        child: Container(
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cartList');
            },
            child: Text('加入购物车'),
          ),
        ),
      ),
    );
  }
}

// 购物车列表页面
class CartList extends StatefulWidget {
  const CartList({super.key});

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('购物车页面')),
      body: Center(
        child: Container(
          child: TextButton(onPressed: () {}, child: Text('加入购物车')),
        ),
      ),
    );
  }
}

// 登录页面
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('登录页面')),
      body: Center(
        child: Container(
          child: TextButton(onPressed: () {}, child: Text('加入购物车')),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    initialRoute: '/goodsList',
    routes: {'/goodsList': (context) => GoodsList()},
    onGenerateRoute: (settings) {
      if (settings.name == '/cartList') {
        bool isLogin = false;
        if (isLogin) {
          return MaterialPageRoute(
            builder: (context) {
              return CartList();
            },
          );
        } else {
          return MaterialPageRoute(
            builder: (context) {
              return LoginPage();
            },
          );
        }
      }
    },
  ));
}
