
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'app Demo',
      home: LoginPage(),
      debugShowCheckedModeBanner: false, // 添加这一行来隐藏debug标签
    );
  }
}


class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _login(BuildContext context) {
    // 登录逻辑 需要补充密码校验
    var username = "admin";
    var password = "123456";
    // 初始化账号密码
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
      appBar: AppBar(
        title: const Text('登录'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      labelText: '请输入用户名',
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.grey),
                      ),
                    ),
                  ),
                  flex: 1,
                ),
                Flexible(
                  child: TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: '请输入密码',
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.grey),
                      ),
                    ),
                    obscureText: true,
                  ),
                  flex: 1,
                ),
                const SizedBox(height: 20),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () => _login(context),
                        child: const Text('登录'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()),
                        ),
                        child: const Text('注册'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  flex: 2,
                ),
                const SizedBox(height: 20),
                Flexible(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('忘记密码？'),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.blue,
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  flex: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('注册')),
      body: const Center(
        child: Text('注册页面'),
      ),
    );
  }
}



class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final List<Map<String, String>> _allProducts = [
    {'name': '旗舰手机', 'price': '¥789', 'image': 'assets/phone.jpg'},
    {'name': '苹果', 'price': '¥100', 'image': 'assets/apple.jpg'},
    {'name': '旗舰手机', 'price': '¥789', 'image': 'assets/phone.jpg'},
    {'name': '苹果', 'price': '¥100', 'image': 'assets/apple.jpg'},
    {'name': '旗舰手机', 'price': '¥789', 'image': 'assets/phone.jpg'},
    {'name': '苹果', 'price': '¥100', 'image': 'assets/apple.jpg'},
    {'name': '旗舰手机', 'price': '¥789', 'image': 'assets/phone.jpg'},
    {'name': '苹果', 'price': '¥100', 'image': 'assets/apple.jpg'},
    {'name': '旗舰手机', 'price': '¥789', 'image': 'assets/phone.jpg'},
    {'name': '苹果', 'price': '¥100', 'image': 'assets/apple.jpg'},
  ];

  List<Map<String, String>> _displayedProducts = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _displayedProducts = List.from(_allProducts);
  }

  void _searchProducts(String query) {
    setState(() {
      _displayedProducts = _allProducts
          .where((product) =>
              product['name']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('商品陈列'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: '搜索商品',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () => _searchProducts(_searchController.text),
                ),
                border: OutlineInputBorder(),
              ),
              onChanged: _searchProducts,
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: _displayedProducts.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(
                            product: _displayedProducts[index]),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          _displayedProducts[index]['image']!,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(_displayedProducts[index]['name']!),
                      Text(_displayedProducts[index]['price']!,
                          style: const TextStyle(color: Colors.red)),
                    ],
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


class ProductDetailPage extends StatefulWidget {
  final Map<String, String> product;

  ProductDetailPage({required this.product});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  String? selectedColor;
  String? selectedSize;

  final List<String> colors = ['红色', '蓝色', '黑色', '白色'];
  final List<String> sizes = ['S', 'M', 'L', 'XL'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.product['name']!)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(widget.product['image']!,
                fit: BoxFit.cover, width: double.infinity, height: 300),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.product['name']!,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text(widget.product['price']!,
                      style: const TextStyle(color: Colors.red, fontSize: 20)),
                  SizedBox(height: 16),
                  Text('商品描述',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text(
                      '这是一个高品质的${widget.product['name']}，采用优质材料制作，舒适耐穿。适合各种场合穿着，是您的理想选择。'),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => _showSelectionBottomSheet(context),
                    child: const Text('选择颜色和尺寸'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSelectionBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('选择颜色',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: colors
                        .map((color) => ChoiceChip(
                              label: Text(color),
                              selected: selectedColor == color,
                              onSelected: (selected) {
                                setState(() {
                                  selectedColor = selected ? color : null;
                                });
                              },
                            ))
                        .toList(),
                  ),
                  SizedBox(height: 16),
                  Text('选择尺寸',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: sizes
                        .map((size) => ChoiceChip(
                              label: Text(size),
                              selected: selectedSize == size,
                              onSelected: (selected) {
                                setState(() {
                                  selectedSize = selected ? size : null;
                                });
                              },
                            ))
                        .toList(),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: (selectedColor != null && selectedSize != null)
                        ? () {
                            Navigator.pop(context);
                            _addToCart(context);
                          }
                        : null,
                    child: Text('加入购物车'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _addToCart(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            '已将 ${widget.product['name']} ($selectedColor, $selectedSize) 加入购物车'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
