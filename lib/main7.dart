// 1、登陆 done
// 列表 done
// 详情 todo
import 'package:flutter/material.dart';

void main() => runApp(MinimalApp());

class MinimalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'demo',
      home: MinimalLogin(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MinimalLogin extends StatelessWidget {
  final TextEditingController userCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();

  void signIn(BuildContext context) {
    String user = "admin";
    String pass = "123456";
    if (userCtrl.text == user && passCtrl.text == pass) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => MinimalProductList()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('登陆异常')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('登陆'), backgroundColor: const Color.fromARGB(221, 103, 63, 180)),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 背景图片
          Image.asset(
            "main7/bg.jpg", 
            fit: BoxFit.cover,
          ),
          // 登录表单
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: userCtrl,
                  decoration: InputDecoration(
                    labelText: '用户：',
                    filled: true,
                    fillColor: Colors.white10,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color:  Color.fromARGB(221, 103, 63, 180), width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color.fromARGB(221, 103, 63, 180), width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                TextField(
                  controller: passCtrl,
                  decoration: InputDecoration(
                    labelText: '密码：',
                    filled: true,
                    fillColor: Colors.white10,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(221, 103, 63, 180), width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white10, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => signIn(context),
                  style: ButtonStyle(
                    alignment: Alignment.centerLeft,
                    // font color
                    foregroundColor: WidgetStateProperty.all(Colors.white),
                    // set color
                    backgroundColor: WidgetStateProperty.all(const Color.fromARGB(221, 103, 63, 180)),
                  ),
                  child: const Text('登陆'),  
                ),
                ElevatedButton(
                  onPressed: () => {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('注册完成')),
                    ),
                  },
                  style: ButtonStyle(
                    alignment: Alignment.centerLeft,
                    // font color
                    foregroundColor: WidgetStateProperty.all(Colors.white),
                    // set color
                    backgroundColor: WidgetStateProperty.all(Color.fromARGB(221, 103, 63, 180)),
                  ),
                  child: const Text('注册'),  
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class MinimalProductList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Minimal Products')),
//       body: const Center(child: Text('Minimal style product list')),
//     );
//   }
// }


class MinimalProductList extends StatefulWidget {
  @override
  _MinimalProductListState createState() => _MinimalProductListState();
}

class _MinimalProductListState extends State<MinimalProductList> {
  final List<Map<String, String>> products = [
    {'title': '蓝牙耳机', 'price': '¥299', 'image': 'assets/earbuds.jpg'},
    {'title': '智能手表', 'price': '¥499', 'image': 'assets/watch.jpg'},
    {'title': '平板电脑', 'price': '¥1599', 'image': 'assets/tablet.jpg'},
    {'title': '相机', 'price': '¥2499', 'image': 'assets/camera.jpg'},
  ];

  List<Map<String, String>> filteredProducts = [];
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredProducts = List.from(products);
  }

  void searchItems(String query) {
    setState(() {
      filteredProducts = products
          .where((product) => product['title']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('商品清单'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purpleAccent.withOpacity(0.3), Colors.blueAccent.withOpacity(0.3)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  labelText: '搜索商品',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  fillColor: Colors.white.withOpacity(0.9),
                  filled: true,
                ),
                onChanged: searchItems,
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(10),
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
                          builder: (context) => GradientProductDetail(
                              product: filteredProducts[index]),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.85),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)],
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                              child: Image.asset(
                                filteredProducts[index]['image']!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              filteredProducts[index]['title']!,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            filteredProducts[index]['price']!,
                            style: TextStyle(color: Colors.red),
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
      ),
    );
  }
}

class GradientProductDetail extends StatelessWidget {
  final Map<String, String> product;
  GradientProductDetail({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product['title']!)),
      body: Center(child: Text('${product['title']}的详细信息')),
    );
  }
}
