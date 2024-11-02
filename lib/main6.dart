// 1、登陆 done
// 列表 done
// 详情 todo
import 'package:flutter/material.dart';

void main() => runApp(InkStyleApp());

class InkStyleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '登录',
      home: InkLogin(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class InkLogin extends StatelessWidget {
  final TextEditingController inkUser = TextEditingController();
  final TextEditingController inkPass = TextEditingController();

  void handleLogin(BuildContext context) {
    String correctUser = "admin";
    String correctPass = "123456";
    if (inkUser.text == correctUser && inkPass.text == correctPass) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => InkProduct()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('用户名或密码错误')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('登录'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("main6/bg.jpg"), 
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: inkUser,
                  decoration: InputDecoration(
                    labelText: '用户名',
                    filled: true,
                    fillColor: Colors.white60,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
                    prefixIcon: const Icon(Icons.person, color: Colors.black),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: inkPass,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: '密码',
                    filled: true,
                    fillColor: Colors.white60,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
                    prefixIcon: const Icon(Icons.lock, color: Colors.black),
                  ),
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () => handleLogin(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white70,
                    padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                    side: BorderSide(color: Colors.black, width: 1.5),
                  ),
                  child: const Text('登录', style: TextStyle(color: Colors.black, fontSize: 18)),
                ),
                ElevatedButton(
                  onPressed: () => (),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white70,
                    padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                    side: BorderSide(color: Colors.black, width: 1.5),
                  ),
                  child: const Text('注册', style: TextStyle(color: Colors.black, fontSize: 18)),
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
class InkProduct extends StatefulWidget {
  @override
  _InkProductPageState createState() => _InkProductPageState();
}

class _InkProductPageState extends State<InkProduct> {
 
  final List<Map<String, String>> catalogItems = [
    {'name': '毛绒玩具', 'price': '¥89', 'imagePath': 'assets/toy.jpg'},
    {'name': '拼图', 'price': '¥39', 'imagePath': 'assets/puzzle.jpg'},
    {'name': '彩色积木', 'price': '¥59', 'imagePath': 'assets/blocks.jpg'},
    {'name': '模型车', 'price': '¥129', 'imagePath': 'assets/car_model.jpg'},
  ];

  List<Map<String, String>> availableItems = [];
  final TextEditingController searchBoxController = TextEditingController();

  @override
  void initState() {
    super.initState();
    availableItems = List.from(catalogItems);
  }

  void searchCatalog(String keyword) {
    setState(() {
      availableItems = catalogItems
          .where((item) => item['name']!.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        title: const Text('卡通商品陈列', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchBoxController,
              decoration: InputDecoration(
                labelText: '查找商品',
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.search, color: Colors.orange),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
              onChanged: searchCatalog,
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.8,
              ),
              itemCount: availableItems.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartoonProductDetail(item: availableItems[index]),
                      ),
                    );
                  },
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(availableItems[index]['imagePath']!),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            availableItems[index]['name']!,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Text(
                          availableItems[index]['price']!,
                          style: TextStyle(color: Colors.green, fontWeight: FontWeight.w700),
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

class CartoonProductDetail extends StatelessWidget {
  final Map<String, String> item;
  CartoonProductDetail({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item['name']!),
        backgroundColor: Colors.orange,
      ),
      body: Center(child: Text('这是${item['name']}的卡通风详情')),
    );
  }
}