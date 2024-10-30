import 'package:flutter/material.dart';
import 'goodlist.dart';

class AuthPage extends StatelessWidget {
  final TextEditingController ctrlUsername = TextEditingController();
  final TextEditingController ctrlPassword = TextEditingController();

  void _loginUser(BuildContext context) {
    const String validUser = "";
    const String validPass = "";
    if (ctrlUsername.text == validUser && ctrlPassword.text == validPass) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProductListPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('用户名或密码不正确')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('登录界面'), backgroundColor: Colors.blue, elevation: 10.0),
      body: Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: ctrlUsername,
                  decoration: InputDecoration(labelText: '输入用户名',
                  // 修改输入框长度为屏幕1/3宽度
                    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: ctrlPassword,
                  decoration: InputDecoration(labelText: '输入密码', border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
                  obscureText: true,
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () => _loginUser(context),
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue)),
                  child: const Text('登录', style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage())),
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
                  child: const Text('注册', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('注册'), backgroundColor: Colors.blue, elevation: 10.0),
      body: Center(child: Text('注册页面', style: TextStyle(color: Colors.black),)),
    );
  }
}
