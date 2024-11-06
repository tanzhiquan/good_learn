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
    String user = "";
    String pass = "";
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
            "main7/yellow.jpg",
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
                      borderSide: const BorderSide(color: Color.fromARGB(221, 103, 63, 180), width: 1),
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
                const SizedBox(height: 10),
                // 忘记密码和注册按钮
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('忘记密码功能尚未实现')),
                        );
                      },
                      child: const Text('忘记密码？', style: TextStyle(color: Colors.blue)),
                    ),
                    TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('注册完成')),
                        );
                      },
                      child: const Text('注册', style: TextStyle(color: Colors.blue)),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => signIn(context),
                  style: ButtonStyle(
                    alignment: Alignment.centerLeft,
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(const Color.fromARGB(221, 103, 63, 180)),
                  ),
                  child: const Text('登陆'),  
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MinimalProductList extends StatefulWidget {
  @override
  _MinimalProductListState createState() => _MinimalProductListState();
}

class _MinimalProductListState extends State<MinimalProductList> {
  final List<Map<String, String>> products = [
    {'title': '黑色中性笔', 'price': '¥299', 'image': 'main7/wenju1.jpg','description':'这款文具系列以其精致设计和实用性深受用户喜爱。每件文具都经过精心打造，不仅外观时尚，而且功能多样，满足日常学习和办公需求。'},
    {'title': '笔记本', 'price': '¥299', 'image': 'main7/wenju2.jpg','description':'这款文具系列以其精致设计和实用性深受用户喜爱。每件文具都经过精心打造，不仅外观时尚，而且功能多样，满足日常学习和办公需求。'},
    {'title': '考试专用笔', 'price': '¥299', 'image': 'main7/wenju3.jpg','description':'这款文具系列以其精致设计和实用性深受用户喜爱。每件文具都经过精心打造，不仅外观时尚，而且功能多样，满足日常学习和办公需求。'},
    {'title': '学生套尺', 'price': '¥299', 'image': 'main7/wenju4.jpg','description':'这款文具系列以其精致设计和实用性深受用户喜爱。每件文具都经过精心打造，不仅外观时尚，而且功能多样，满足日常学习和办公需求。'},
    {'title': '铅笔刀', 'price': '¥299', 'image': 'main7/wenju5.jpg','description':'这款文具系列以其精致设计和实用性深受用户喜爱。每件文具都经过精心打造，不仅外观时尚，而且功能多样，满足日常学习和办公需求。'},
    {'title': '橡皮擦', 'price': '¥299', 'image': 'main7/wenju6.jpg','description':'这款文具系列以其精致设计和实用性深受用户喜爱。每件文具都经过精心打造，不仅外观时尚，而且功能多样，满足日常学习和办公需求。'},
    {'title': '本子', 'price': '¥299', 'image': 'main7/wenju7.jpg','description':'这款文具系列以其精致设计和实用性深受用户喜爱。每件文具都经过精心打造，不仅外观时尚，而且功能多样，满足日常学习和办公需求。'},
    {'title': '订书机', 'price': '¥299', 'image': 'main7/wenju8.jpg','description':'这款文具系列以其精致设计和实用性深受用户喜爱。每件文具都经过精心打造，不仅外观时尚，而且功能多样，满足日常学习和办公需求。'},
    {'title': '笔袋', 'price': '¥299', 'image': 'main7/wenju9.jpg','description':'这款文具系列以其精致设计和实用性深受用户喜爱。每件文具都经过精心打造，不仅外观时尚，而且功能多样，满足日常学习和办公需求。'},
    {'title': '便利贴', 'price': '¥299', 'image': 'main7/wenju10.jpg','description':'这款文具系列以其精致设计和实用性深受用户喜爱。每件文具���经过精心打造，不仅外观时尚，而且功能多样，满足日常学习和办公需求。'},
  ];

  List<Map<String, String>> filteredProducts = [];
  final TextEditingController searchController = TextEditingController();

  final CartManager cartManager = CartManager();

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
                          builder: (context) => MinimalProductDetail(item: filteredProducts[index], cartManager: cartManager),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ShoppingCartPage(cartManager: cartManager),
            ),
          );
        },
        child: Icon(Icons.shopping_cart),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}

class MinimalProductDetail extends StatefulWidget {
  final Map<String, String> item;
  final CartManager cartManager;

  MinimalProductDetail({
    required this.item,
    required this.cartManager,
  });

  @override
  _MinimalProductDetailState createState() => _MinimalProductDetailState();
}

class _MinimalProductDetailState extends State<MinimalProductDetail> {
  String? currentColor;
  final List<String> colors = ['黑色', '蓝色', '红色'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item['title'] ?? ''),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              widget.item['image']!,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.item['title']!,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    widget.item['price']!,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    widget.item['description']!,
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 24),
                  Text('选择颜色:', style: TextStyle(fontSize: 18)),
                  Wrap(
                    spacing: 8,
                    children: colors.map((color) {
                      return ChoiceChip(
                        label: Text(color),
                        selected: currentColor == color,
                        onSelected: (bool selected) {
                          setState(() {
                            currentColor = selected ? color : null;
                          });
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // 直接调用添加到购物车的方法
                            final color = currentColor ?? '默认颜色';
                            widget.cartManager.addItem({
                              'title': widget.item['title'],
                              'price': widget.item['price'],
                              'image': widget.item['image'],
                              'color': color,
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('已添加到购物车')),
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShoppingCartPage(cartManager: widget.cartManager),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
                            padding: EdgeInsets.symmetric(vertical: 15),
                          ),
                          child: Text('加入购物车', style: TextStyle(fontSize: 16)),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('购买成功')),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
                            padding: EdgeInsets.symmetric(vertical: 15),
                          ),
                          child: Text('立即购买', style: TextStyle(fontSize: 16)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartManager extends ChangeNotifier {
  List<Map<String, dynamic>> _items = [];
  
  List<Map<String, dynamic>> get items => _items;
  
  double get totalAmount {
    return _items.fold(0, (sum, item) => 
      sum + double.parse(item['price'].toString().replaceAll(RegExp(r'[^0-9.]'), '')));
  }
  
  void addItem(Map<String, dynamic> item) {
    _items.add(item);
    notifyListeners();
  }
  
  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }
  
  void clear() {
    _items.clear();
    notifyListeners();
  }
}

class ShoppingCartPage extends StatelessWidget {
  final CartManager cartManager;

  ShoppingCartPage({required this.cartManager});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('购物车'),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListenableBuilder(
        listenable: cartManager,
        builder: (context, child) {
          if (cartManager.items.isEmpty) {
            return Center(child: Text('购物车是空的', style: TextStyle(fontSize: 16)));
          }
          
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartManager.items.length,
                  itemBuilder: (context, index) {
                    final item = cartManager.items[index];
                    return Card(
                      margin: EdgeInsets.all(8),
                      child: ListTile(
                        leading: Image.asset(item['image'], width: 60, height: 60, fit: BoxFit.cover),
                        title: Text(item['title']),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('颜色: ${item['color']}'),
                            Text('价格: ${item['price']}', style: TextStyle(color: Colors.redAccent)),
                          ],
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => cartManager.removeItem(index),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '总计: ¥${cartManager.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('结算成功')),
                        );
                        cartManager.clear();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                      ),
                      child: Text('结算'),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

