import 'package:flutter/material.dart'; // 导入Flutter的Material Design组件库
import 'package:shop/screens/login.dart'; // 导入自定义的登录页面组件

void main() => runApp(MyApp()); // 程序入口，运行MyApp应用

class MyApp extends StatelessWidget { // 定义一个无状态组件MyApp
  @override
  Widget build(BuildContext context) { // 构建组件的方法
    return MaterialApp( // 返回一个MaterialApp组件
      title: 'shop Demo', // 设置应用标题
      home: LoginPage(), // 设置应用的首页为LoginPage
      debugShowCheckedModeBanner: false,  // 禁用debug模式下的黄色横条
    );
  }
}
