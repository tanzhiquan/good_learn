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

// 购物车商品模型重命名和重构
class ShoppingCartProduct {
  final String productName;
  final String productPrice;
  final String productImage; 
  final String productColor;
  int productCount;

  ShoppingCartProduct({
    required this.productName,
    required this.productPrice,
    required this.productImage,
    required this.productColor, 
    this.productCount = 1
  });
}

// 购物车管理类重构
class ShoppingCartManager extends ChangeNotifier {
  List<ShoppingCartProduct> _productList = [];
  
  List<ShoppingCartProduct> get productList => _productList;
  
  double get totalAmount {
    return _productList.fold(0, (sum, product) => 
      sum + double.parse(product.productPrice.substring(1)) * product.productCount
    );
  }

  void addToCart(ShoppingCartProduct product) {
    _productList.add(product);
    notifyListeners();
  }

  void removeFromCart(int index) {
    _productList.removeAt(index);
    notifyListeners();
  }

  void updateProductCount(int index, int count) {
    _productList[index].productCount = count;
    notifyListeners(); 
  }

  void clearShoppingCart() {
    _productList.clear();
    notifyListeners();
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

// 购物车页面重构
class ShoppingCartPage extends StatefulWidget {
  final ShoppingCartManager cartManager;

  ShoppingCartPage({required this.cartManager});

  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('购物车'),
      ),
      body: widget.cartManager.productList.isEmpty 
        ? Center(
            child: Text('购物车是空的'),
          )
        : Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: widget.cartManager.productList.length,
                  itemBuilder: (context, index) {
                    final product = widget.cartManager.productList[index];
                    return ListTile(
                      leading: Image.asset(product.productImage),
                      title: Text(product.productName),
                      subtitle: Text('${product.productColor} - ${product.productPrice}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              if(product.productCount > 1) {
                                widget.cartManager.updateProductCount(
                                  index, 
                                  product.productCount - 1
                                );
                              }
                            },
                          ),
                          Text('${product.productCount}'),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              widget.cartManager.updateProductCount(
                                index,
                                product.productCount + 1
                              );
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              widget.cartManager.removeFromCart(index);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '总计: ¥${widget.cartManager.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('正在前往支付...')),
                        );
                      },
                      child: Text('去结算'),
                    ),
                  ],
                ),
              ),
            ],
          ),
    );
  }
}

// 产品列表页面
class ProductListPage extends StatefulWidget {
  @override
  ProductList createState() => ProductList();
}

class ProductList extends State<ProductListPage> {
  final ShoppingCartManager cartManager = ShoppingCartManager();
  
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
                          product: _displayedProducts[index],
                          cartManager: cartManager,
                        ),
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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}

// 商品详情页
class ProductDetailPage extends StatefulWidget {
  final Map<String, String> product;
  final ShoppingCartManager cartManager;

  ProductDetailPage({required this.product, required this.cartManager});

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
      appBar: AppBar(
        title: Text(widget.product['name']!),
      ),
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
                      '这是一个高品质的${widget.product['name']}，这款家电集高效、节能与智能于一体，操作简便，性能卓越，为现代家庭带来便捷与舒适。设计时尚，耐用性强，是提升生活品质的理想选择。'
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ShoppingCartPage(cartManager: widget.cartManager),
            ),
          );
        },
        child: Icon(Icons.shopping_cart),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
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
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: selectedColor != null
                              ? () {
                                  widget.cartManager.addToCart(
                                    ShoppingCartProduct(
                                      productName: widget.product['name']!,
                                      productPrice: widget.product['price']!,
                                      productImage: widget.product['image']!,
                                      productColor: selectedColor!,
                                    ),
                                  );
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ShoppingCartPage(cartManager: widget.cartManager),
                                    ),
                                  );
                                }
                              : null,
                          child: Text('加入购物车'),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: selectedColor != null
                              ? () {
                                  widget.cartManager.addToCart(
                                    ShoppingCartProduct(
                                      productName: widget.product['name']!,
                                      productPrice: widget.product['price']!,
                                      productImage: widget.product['image']!,
                                      productColor: selectedColor!,
                                    ),
                                  );
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('正在前往支付...')),
                                  );
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: Text('立即购买'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
