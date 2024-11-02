// 1、登陆 done
// 列表 done
// 详情 todo
import 'package:flutter/material.dart';

void main() => runApp(ClassicalApp());

class ClassicalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '商城系统',
      home: ClassicalLogin(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// 古典风格登录页面
class ClassicalLogin extends StatelessWidget {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  void authenticateUser(BuildContext context) {
    String expectedUser = "admin";
    String expectedPass = "123456";
    if (userController.text == expectedUser && passController.text == expectedPass) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => ClassicalProductList()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('账号或密码不正确')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('登录界面'),
        backgroundColor: Colors.brown[800],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("main5/bg.jpg"), 
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: userController,
                  decoration: InputDecoration(
                    labelText: '用户名',
                    filled: true,
                    fillColor: Colors.white70,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                    prefixIcon: Icon(Icons.person, color: Colors.brown),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: passController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: '密码',
                    filled: true,
                    fillColor: Colors.white70,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                    prefixIcon: Icon(Icons.lock, color: Colors.brown),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => authenticateUser(context),
                      child: const Text('登录'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown[700],
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                        textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () => (){
                        // 消息通知注册成功
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('注册成功')),
                        );
                      }(),
                      child: const Text('注册'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown[700],
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                        textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    // 处理忘记密码逻辑
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('忘记密码')),
                    );
                  },
                  child: const Text('忘记密码？'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white70, textStyle: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// 产品列表页面

class ClassicalProductList extends StatefulWidget {
  @override
  _CardStyleProductListState createState() => _CardStyleProductListState();
}

class _CardStyleProductListState extends State<ClassicalProductList> {
  final List<Map<String, String>> productItems = [
    {'productName': '智能手环', 'priceTag': '¥179', 'imageUrl': 'assets/band.jpg'},
    {'productName': '无线音箱', 'priceTag': '¥299', 'imageUrl': 'assets/speaker.jpg'},
    {'productName': '笔记本电脑', 'priceTag': '¥3599', 'imageUrl': 'assets/laptop.jpg'},
    {'productName': '空气净化器', 'priceTag': '¥799', 'imageUrl': 'assets/air_purifier.jpg'},
  ];

  List<Map<String, String>> currentDisplayProducts = [];
  final TextEditingController searchFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    currentDisplayProducts = List.from(productItems);
  }

  void filterProducts(String keyword) {
    setState(() {
      currentDisplayProducts = productItems
          .where((item) => item['productName']!.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('商品列表'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchFieldController,
              decoration: InputDecoration(
                labelText: '搜索产品',
                prefixIcon: Icon(Icons.search, color: Colors.blueAccent),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onChanged: filterProducts,
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.7,
              ),
              itemCount: currentDisplayProducts.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CardStyleProductDetail(item: currentDisplayProducts[index]),
                      ),
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 5,
                    child: Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                            child: Image.asset(
                              currentDisplayProducts[index]['imageUrl']!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            currentDisplayProducts[index]['productName']!,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          currentDisplayProducts[index]['priceTag']!,
                          style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
                        ),
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

class CardStyleProductDetail extends StatelessWidget {
  final Map<String, String> item;
  CardStyleProductDetail({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item['productName']!)),
      body: Center(child: Text('${item['productName']}的详细介绍')),
    );
  }
}