import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'app Demo',
      home: DengLu(),
    );
  }
}


class DengLu extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _login(BuildContext context) {
    var username = "";
    var password = "";
    if (usernameController.text == username &&
        passwordController.text == password) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProductListPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('密码错误')),
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
            image: AssetImage("main3/ball.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
                      child: TextField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          labelText: '请输入用户名',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(color: Colors.grey, width: 1.0),
                          ),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.9),
                          prefixIcon: Icon(Icons.account_circle),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.0, right: 16.0),
                      child: TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          labelText: '请输入密码',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(color: Colors.grey, width: 1.0),
                          ),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.9),
                          prefixIcon: Icon(Icons.lock),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.visibility),
                            onPressed: () {
                            },
                          ),
                        ),
                        obscureText: true,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () => _login(context),
                        child: Text('登录',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff6200ea),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          elevation: 8.0,
                          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                          minimumSize: Size(150, 56),
                        ),
                      ),

                      SizedBox(width: 16),

                      ElevatedButton(
                        onPressed: () =>
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ZhuCe(),
                              ),
                            ),
                        child: Text('注册',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff6200ea),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          elevation: 8.0,
                          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                          minimumSize: Size(150, 56),
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

class ZhuCe extends StatelessWidget {
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

// 产品列表页面，继承自StatefulWidget
class ProductListPage extends StatefulWidget {
  @override
  // 创建与此StatefulWidget关联的状态对象
  ProductList createState() => ProductList();
}

  // 产品列表State
class ProductList extends State<ProductListPage> {
  // 保存所有的产品信息
  final List<Map<String, String>> _allProducts = [
    {'name': '家电1', 'price': '¥89', 'image': 'main3/jiadian1.jpg'},
    {'name': '家电2', 'price': '¥89', 'image': 'main3/jiadian2.jpg'},
    {'name': '家电3', 'price': '¥89', 'image': 'main3/jiadian3.jpg'},
    {'name': '家电4', 'price': '¥89', 'image': 'main3/jiadian4.jpg'},
    {'name': '家电5', 'price': '¥89', 'image': 'main3/jiadian5.jpg'},
    {'name': '家电6', 'price': '¥89', 'image': 'main3/jiadian6.jpg'},
    {'name': '家电7', 'price': '¥89', 'image': 'main3/jiadian7.jpg'},
    {'name': '家电8', 'price': '¥89', 'image': 'main3/jiadian8.jpg'},
    {'name': '家电9', 'price': '¥89', 'image': 'main3/jiadian9.jpg'},
    {'name': '家电10', 'price': '¥89', 'image': 'main3/jiadian10.png'},
    {'name': '家电11', 'price': '¥89', 'image': 'main3/jiadian11.jpg'},
    {'name': '家电12', 'price': '¥89', 'image': 'main3/jiadian12.jpg'},
    {'name': '家电13', 'price': '¥89', 'image': 'main3/jiadian13.jpg'},
    {'name': '家电14', 'price': '¥89', 'image': 'main3/jiadian14.jpg'},
    {'name': '家电15', 'price': '¥89', 'image': 'main3/jiadian15.jpg'},
  ];

  // 保存当前显示的产品信息
  List<Map<String, String>> _displayedProducts = [];
  // 保存搜索框的内容
  TextEditingController _searchController = TextEditingController();

  @override
  // 在State对象被插入到树中时调用
  void initState() {
    super.initState();
    _displayedProducts = List.from(_allProducts);
  }

  // 搜索框的回调函数
  void _searchProducts(String query) {
    setState(() {
      // 通过搜索框的内容来过滤产品
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
              //  products的布局
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: _displayedProducts.length,
              //  products的item builder
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    //  点击某个product时，跳转到对应的详情页面
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailPage(
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
                      //  product的名称
                      Text(_displayedProducts[index]['name']!),
                      //  product的价格
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


// 
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
                      '这是一个高品质的${widget
                          .product['name']}，这款家电集高效、节能与智能于一体，操作简便，性能卓越，为现代家庭带来便捷与舒适。设计时尚，耐用性强，是提升生活品质的理想选择。'
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => _showSelectionBottomSheet(context),
                    child: const Text('选择颜色'),
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
                        .map((color) =>
                        ChoiceChip(
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
            '已将 ${widget
                .product['name']} ($selectedColor, $selectedSize) 加入购物车'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
