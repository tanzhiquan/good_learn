import 'package:flutter/material.dart';

void main() => runApp(AppMain());

/// AppMain类是应用程序的入口点，它是一个无状态的部件
/// 它的职责是构建应用程序的主结构，包括配置应用的标题和主界面
class AppMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 构建方法返回一个MaterialApp实例，配置应用的基本信息和主界面
    return MaterialApp(
      // 设置应用的标题，用于在标题栏显示
      title: '学习项目',
      // 禁用调试模式下的检查模式横幅，以避免在应用界面的右上角显示检查模式标志
      debugShowCheckedModeBanner: false,
      // 设置应用的主界面为LoginScreen，即登录屏幕
      home: LoginScreen(),
    );
  }
}


// 登录页

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameField = TextEditingController();
  final TextEditingController passwordField = TextEditingController();
  String registeredUsername = '';
  String registeredPassword = '';

  void performLogin(BuildContext context) {
    if (usernameField.text == registeredUsername && passwordField.text == registeredPassword) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Products()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('密码或账号错误')),
      );
    }
  }

  void performRegister(BuildContext context) {
    setState(() {
      registeredUsername = usernameField.text;
      registeredPassword = passwordField.text;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('注册成功')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('登录')),
      body: Center(
        child: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('pig/weixin.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTextField(usernameField, '账号', Icons.person),
                const SizedBox(height: 16.0),
                _buildTextField(passwordField, '密码', Icons.lock, obscureText: true),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text('忘记密码?'),
                      style: TextButton.styleFrom(foregroundColor: Colors.blue),
                    ),
                    TextButton(
                      onPressed: () => performRegister(context),
                      child: const Text('注册'),
                      style: TextButton.styleFrom(foregroundColor: Colors.blue),
                    ),
                  ],
                ),
                const SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () => performLogin(context),
                  child: const Text('登陆', style: TextStyle(fontSize: 18)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText, IconData icon, {bool obscureText = false}) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        prefixIcon: Icon(icon, color: Colors.blue),
      ),
    );
  }
}

class Products extends StatefulWidget {
  @override
  _SimpleProductListState createState() => _SimpleProductListState();
}

class _SimpleProductListState extends State<Products> {
  final List<Map<String, String>> productCatalog = [
    {'title': '宠物玩具', 'price': '5元', 'image': 'pig/pig2.jpg'},
    {'title': '猫咪屋', 'price': '109元', 'image': 'pig/pig1.jpg'},
    {'title': '猫咪零食', 'price': '100元', 'image': 'pig/pig3.jpg'},
    {'title': '小狗玩具', 'price': '100元', 'image': 'pig/pig4.jpg'},
    {'title': '零食', 'price': '100元', 'image': 'pig/pig5.jpg'},
    {'title': '包包', 'price': '100元', 'image': 'pig/pig6.jpg'},
    {'title': '猫咪背包', 'price': '100元', 'image': 'pig/pig7.jpg'},
    {'title': '玩具', 'price': '100元', 'image': 'pig/pig8.jpg'},
    {'title': '猫咪玩具', 'price': '100元', 'image': 'pig/pig9.jpg'},
    {'title': '零食', 'price': '100元', 'image': 'pig/pig10.jpg'},
    {'title': '逗猫棒', 'price': '100元', 'image': 'pig/pig11.jpg'},
    {'title': '毛线球', 'price': '100元', 'image': 'pig/pig12.jpg'},
    {'title': '背包', 'price': '100元', 'image': 'pig/pig13.jpg'},
    {'title': '猫咪床', 'price': '100元', 'image': 'pig/pig14.jpg'},
    {'title': '猫抓板', 'price': '100元', 'image': 'pig/pig15.jpg'},
  ];

  List<Map<String, String>> visibleProducts = [];
  TextEditingController searchCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    visibleProducts = List.from(productCatalog);
  }

  void filterProducts(String keyword) {
    setState(() {
      visibleProducts = productCatalog
          .where((product) => product['title']!.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('产品展示', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartScreen()),
                  );
                },
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Text(
                    '0',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: searchCtrl,
              decoration: InputDecoration(
                labelText: '查找产品',
                prefixIcon: Icon(Icons.search, color: Colors.black54),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onChanged: filterProducts,
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              itemCount: visibleProducts.length,
              itemBuilder: (context, i) => GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SimpleProductDetail(item: visibleProducts[i])),
                ),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                          child: Image.asset(visibleProducts[i]['image']!, fit: BoxFit.cover),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(visibleProducts[i]['title']!, style: TextStyle(fontWeight: FontWeight.w600)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(visibleProducts[i]['price']!, style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class SimpleProductDetail extends StatefulWidget {
  final Map<String, String> item;
  SimpleProductDetail({required this.item});

  @override
  _SimpleProductDetailState createState() => _SimpleProductDetailState();
}

class _SimpleProductDetailState extends State<SimpleProductDetail> {
  String? selectedSpec;
  final List<String> specs = ['新款', '旧款', '优惠款'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item['title']!),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartScreen()),
                  );
                },
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  constraints: const 
                  BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Text(
                    '${CartScreen.cartItems.fold(0, (sum, item) => sum + item['quantity'] as int)}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(widget.item['image']!, fit: BoxFit.cover, width: double.infinity, height: 300),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.item['title']!, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text(widget.item['price']!, style: TextStyle(color: Colors.redAccent, fontSize: 20)),
                  SizedBox(height: 16),
                  Text('商品描述', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('这是一个优质的${widget.item['title']}，适合各种使用场景。'),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => _showOptionsBottomSheet(context, isAddToCart: true),
                          child: Text('加入购物车'),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => _showOptionsBottomSheet(context, isAddToCart: false),
                          child: Text('立即购买'),
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

  void _showOptionsBottomSheet(BuildContext context, {required bool isAddToCart}) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ..._buildChoiceChips('选择规格', specs, (spec) => setState(() => selectedSpec = spec)),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: selectedSpec != null 
                            ? () {
                                if (isAddToCart) {
                                  _addToCart(context);
                                } else {
                                  _buyNow(context);
                                }
                              } 
                            : null,
                          child: Text(isAddToCart ? '加入购物车' : '立即购买'),
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

  List<Widget> _buildChoiceChips(String title, List<String> options, Function(String) onSelected) {
    return [
      Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      SizedBox(height: 8),
      Wrap(
        spacing: 8,
        children: options.map((option) {
          return ChoiceChip(
            label: Text(option),
            selected: selectedSpec != null && selectedSpec!.contains(option),
            onSelected: (bool selected) {
              onSelected(selected ? option : '');
            },
          );
        }).toList(),
      ),
      SizedBox(height: 16),
    ];
  }

  void _addToCart(BuildContext context) {
    // 检查是否已存在相同商品和规格
    final existingItemIndex = CartScreen.cartItems.indexWhere((item) => 
      item['title'] == widget.item['title'] && 
      item['spec'] == selectedSpec
    );

    if (existingItemIndex != -1) {
      // 如果已存在,增加数量
      setState(() {
        CartScreen.cartItems[existingItemIndex]['quantity']++;
      });
    } else {
      // 如果不存在,添加新商品
      CartScreen.cartItems.add({
        'title': widget.item['title'],
        'price': widget.item['price'],
        'image': widget.item['image'],
        'spec': selectedSpec,
        'quantity': 1,
      });
    }
    
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('已将 ${widget.item['title']} ($selectedSpec) 加入购物车')),
    );
  }

  void _buyNow(BuildContext context) {
    final cartState = _CartScreenState();
    cartState.addToCart({
      'title': widget.item['title'],
      'price': widget.item['price'],
      'image': widget.item['image'],
    }, selectedSpec!);
    
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartScreen(),
      ),
    );
  }
}

// 购物车
class CartScreen extends StatefulWidget {
  static final List<Map<String, dynamic>> cartItems = [];
  
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double get totalPrice {
    return CartScreen.cartItems.fold(0, (sum, item) => sum + (double.parse(item['price'].toString().replaceAll('元', ''))) * (item['quantity'] as int));
  }

  void addToCart(Map<String, dynamic> item, String spec) {
    setState(() {
      CartScreen.cartItems.add({
        ...item,
        'spec': spec,
        'quantity': 1,
      });
    });
  }

  void removeFromCart(int index) {
    setState(() {
      CartScreen.cartItems.removeAt(index);
    });
  }

  void updateQuantity(int index, int quantity) {
    setState(() {
      CartScreen.cartItems[index]['quantity'] = quantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('购物车'),
        centerTitle: true,
      ),
      body: CartScreen.cartItems.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart_outlined, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('购物车是空的', style: TextStyle(fontSize: 16, color: Colors.grey)),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: CartScreen.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = CartScreen.cartItems[index];
                      return Card(
                        margin: EdgeInsets.all(8),
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Image.asset(
                                item['image'],
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['title'],
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 4),
                                    Text('规格: ${item['spec']}'),
                                    Text('${item['price']}'),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: () {
                                      if (item['quantity'] > 1) {
                                        updateQuantity(index, item['quantity'] - 1);
                                      }
                                    },
                                  ),
                                  Text('${item['quantity']}'),
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      updateQuantity(index, item['quantity'] + 1);
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete_outline),
                                    onPressed: () => removeFromCart(index),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '总计: ￥${totalPrice.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                        onPressed: CartScreen.cartItems.isEmpty ? null : () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('正在前往支付...')),
                          );
                        },
                        child: Text('去支付'),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
