import 'package:flutter/material.dart';
import 'package:helloworld/screens/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-commerce Demo',
      home: LoginPage(),
      debugShowCheckedModeBanner: false, // 添加这一行来隐藏debug标签
    );
  }
}
