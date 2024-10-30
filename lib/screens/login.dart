import 'package:flutter/material.dart';
import 'goodlist.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _login(BuildContext context) {
    var username = "admin";
    var password = "123456";
    if (usernameController.text == username && passwordController.text == password) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProductListPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid username or password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('登录', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: '用户名',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person, color: Colors.grey),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: '密码',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock, color: Colors.grey),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _login(context),
                child: const Text('登录'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
