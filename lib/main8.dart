// 1、登陆 done
// 列表 done
// 详情 todo
import 'package:flutter/material.dart';

void main() => runApp(MinimalApp());

class MinimalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '登陆',
      home: _MinimalLogin(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// ignore: must_be_immutable
class _MinimalLogin extends StatelessWidget {
  final TextEditingController userCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();

  late Object user = "";
  late Object pass = "";

  void signIn(BuildContext context) {

    if (userCtrl.text == user && passCtrl.text == pass) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ProList()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('登陆错误')),
      );
    }
  }

  void register(BuildContext context) {

    // 获取用户的输入，并将其存储在全局变量中
    user = userCtrl.text;
    pass = passCtrl.text;
     // 显示弹窗提示用户输入的信息
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('注册信息'),
          content: Text('用户名: $user\n密码: $pass'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // 关闭弹窗
              },
              child: const Text('关闭'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('登陆'),
        backgroundColor: Colors.black87,
        actions: [
          IconButton(
            icon: const Icon(Icons.support, color: Colors.white),
            // 改为文字 “ 客服”，不要icon
            tooltip: '客服',
            onPressed: () {
              // Your customer service action here
            },
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "main8/bg.jpg",
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Flex(
              direction: Axis.vertical,
              children: [
                const SizedBox(height: 100),
                const Text(
                  '欢迎回来!',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 40),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: userCtrl,
                        decoration: InputDecoration(
                          labelText: '用户名',
                          labelStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.black54,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: passCtrl,
                        decoration: InputDecoration(
                          labelText: '密码',
                          labelStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.black54,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              // Your forgot password action here
                            },
                            child: const Text('忘记密码?',
                                style: TextStyle(color: Colors.white)),
                          ),
                          TextButton(
                            onPressed: () => register(context),
                            child: const Text('注册',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () => signIn(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('登陆', style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProList extends StatefulWidget {
  const ProList({super.key});

  @override
  _ProListState createState() => _ProListState();
}

class _ProListState extends State<ProList> {
  final List<Map<String, String>> inventory = [
    {'product': '时尚背包', 'cost': '¥199', 'oldcost': '¥299','img': 'main8/apple.jpg'},
    {'product': '便携音响', 'cost': '¥349', 'oldcost': '¥399','img': 'main8/phone.jpg'},
    {'product': '运动鞋', 'cost': '¥799','oldcost': '¥499', 'img': 'main8/apple.jpg'},
    {'product': '手提电脑', 'cost': '¥4299','oldcost': '¥399', 'img': 'main8/phone.jpg'},
  ];

  List<Map<String, String>> shownItems = [];
  final TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    shownItems = List.from(inventory);
  }

  void filterList(String input) {
    setState(() {
      shownItems = inventory
          .where((item) =>
              item['product']!.toLowerCase().contains(input.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('商品陈列'),
        backgroundColor: Colors.grey.shade800,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                hintText: '搜索产品',
                prefixIcon: Icon(Icons.search, color: Colors.grey.shade600),
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: filterList,
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 0.8,
              ),
              itemCount: shownItems.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MinimalProductDetail(product: shownItems[index]),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Image.asset(
                              shownItems[index]['img']!,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(
                            shownItems[index]['product']!,
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                        Text(
                          shownItems[index]['cost']!,
                          style: TextStyle(color: Colors.blue.shade700),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(
                            '${shownItems[index]['oldcost']!} ',
                            // 删除字体
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey.shade600),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MinimalProductDetail extends StatelessWidget {
  final Map<String, String> product;
  MinimalProductDetail({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['product']!),
        backgroundColor: Colors.grey.shade800,
      ),
      body: Center(child: Text('了解更多关于${product['product']}的信息')),
    );
  }
}
