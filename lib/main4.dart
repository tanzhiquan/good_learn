// 1、登陆 done
// 列表 done
// 详情 todo
import 'package:flutter/material.dart';

void main() => runApp(MetalApp());

class MetalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '登陆',
      home: MetalLogin(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MetalLogin extends StatelessWidget {
  final TextEditingController metalUser = TextEditingController();
  final TextEditingController metalPass = TextEditingController();

  void accessAccount(BuildContext context) {
    String adminUser = "admin";
    String adminPass = "123456";
    if (metalUser.text == adminUser && metalPass.text == adminPass) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ItemScreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Access Denied')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[850],
        appBar: AppBar(
          title: Text('登陆'),
          backgroundColor: Colors.grey[700],
        ),
        body: Center(
          child: DecoratedBox(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('main4/bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: metalUser,
                  decoration: InputDecoration(
                    labelText: '用户名',
                    fillColor: Colors.grey[600],
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    prefixIcon: Icon(Icons.account_circle, color: Colors.amber),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: metalPass,
                  obscureText: true, 
                  decoration: InputDecoration(
                    labelText: '密码',
                    fillColor: Colors.grey[600],
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    prefixIcon: Icon(Icons.lock, color: Colors.amber),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => accessAccount(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    padding: EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                  child: Text('登陆', style: TextStyle(color: Colors.black)),
                ),
                ElevatedButton(
                  onPressed: () => () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    padding: EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                  child: Text('注册', style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ),
        ));
  }
}

class ItemScreen extends StatefulWidget {
  @override
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  final List<Map<String, String>> productList = [
    {'name': '运动相机', 'cost': '¥399', 'img': 'assets/sport_cam.jpg'},
    {'name': '电竞耳机', 'cost': '¥299', 'img': 'assets/gaming_headset.jpg'},
    {'name': '机械键盘', 'cost': '¥199', 'img': 'assets/keyboard.jpg'},
    {'name': '高清显示器', 'cost': '¥599', 'img': 'assets/monitor.jpg'},
  ];

  List<Map<String, String>> filteredProducts = [];
  TextEditingController searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredProducts = List.from(productList);
  }

  void searchItems(String searchText) {
    setState(() {
      filteredProducts = productList
          .where((product) => product['name']!.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('商品列表', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchTextController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: '搜索商品',
                labelStyle: TextStyle(color: Colors.white54),
                filled: true,
                fillColor: Colors.grey[800],
                prefixIcon: Icon(Icons.search, color: Colors.white),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onChanged: searchItems,
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DarkThemeProductDetail(product: filteredProducts[index]),
                      ),
                    );
                  },
                  child: Card(
                    color: Colors.grey[850],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                            child: Image.asset(
                              filteredProducts[index]['img']!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            filteredProducts[index]['name']!,
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            filteredProducts[index]['cost']!,
                            style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.w600),
                          ),
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
class DarkThemeProductDetail extends StatelessWidget {
  final Map<String, String> product;
  DarkThemeProductDetail({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text(product['name']!, style: TextStyle(color: Colors.white))),
      body: Center(child: Text('${product['name']}的详细信息', style: TextStyle(color: Colors.white))),
    );
  }
}