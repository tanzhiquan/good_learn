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
    if (true) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ItemScreen()));
    } 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: Text('登陆'),
        backgroundColor: Colors.grey[700],
        actions: [
                  TextButton(
                    child: Text('客服', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                    },
                  ),
                ],
      ),
      body: Center(
        child: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('main4/pic.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: metalUser,
                  decoration: InputDecoration(
                    labelText: '用户名',
                    fillColor: Colors.grey[600],
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    prefixIcon: Icon(Icons.account_circle, color: Colors.amber),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: metalPass,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: '密码',
                    fillColor: Colors.grey[600],
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    prefixIcon: Icon(Icons.lock, color: Colors.amber),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                    },
                    child: const Text('忘记密码?', style: TextStyle(color: Colors.amber)),
                  ),
                  TextButton(
                    onPressed: () {
                    },
                    child: const Text('注册', style: TextStyle(color: Colors.amber)),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => accessAccount(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  padding: EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text('登陆', style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemScreen extends StatefulWidget {
  @override
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  final CartManager cartManager = CartManager();

  // List of products
  final List<Map<String, String>> productList = [
    {'name': '牙刷', 'cost': '25元', 'img': 'main4/ryp1.jpg','detail':'日用品系列，精心设计，满足日常生活所需。每件产品均采用优质材料，耐用且实用，旨在提升您的生活品质。无论是个人护理、家居清洁还是日常饮食，这些产品都能带给您舒适便捷的使用体验。它们不仅外观简洁大方，而且功能性强，易于操作，能够适应快节奏的现代生活。选择这些日用品，您将享受到更高效、更环保的生活方式，让日常琐事变得更加轻松愉快。'},
    {'name': '拖鞋', 'cost': '25元', 'img': 'main4/ryp2.jpg','detail':'日用品系列，精心设计，满足日常生活所需。每件产品均采用优质材料，耐用且实用，旨在提升您的生活品质。无论是个人护理、家居清洁还是日常饮食，这些产品都能带给您舒适便捷的使用体验。它们不仅外观简洁大方，而且功能性强，易于操作，能够适应快节奏的现代生活。选择这些日用品，您将享受到更高效、更环保的生活方式，让日常琐事变得更加轻松愉快。'},
    {'name': '毛巾', 'cost': '25元', 'img': 'main4/ryp3.jpg','detail':'日用品系列，精心设计，满足日常生活所需。每件产品均采用优质材料，耐用且实用，旨在提升您的生活品质。无论是个人护理、家居清洁还是日常饮食，这些产品都能带给您舒适便捷的使用体验。它们不仅外观简洁大方，而且功能性强，易于操作，能够适应快节奏的现代生活。选择这些日用品，您将享受到更高效、更环保的生活方式，让日常琐事变得更加轻松愉快。'},
    {'name': '牙刷2', 'cost': '25元', 'img': 'main4/ryp4.jpg','detail':'日用品系列，精心设计，满足日常生活所需。每件产品均采用优质材料，耐用且实用，旨在提升您的生活品质。无论是个人护理、家居清洁还是日常饮食，这些产品都能带给您舒适便捷的使用体验。它们不仅外观简洁大方，而且功能性强，易于操作，能够适应快节奏的现代生活。选择这些日用品，您将享受到更高效、更环保的生活方式，让日常琐事变得更加轻松愉快。'},
    {'name': '纸巾', 'cost': '25元', 'img': 'main4/ryp5.jpg','detail':'日用品系列，精心设计，满足日常生活所需。每件产品均采用优质材料，耐用且实用，旨在提升您的生活品质。无论是个人护理、家居清洁还是日常饮食，这些产品都能带给您舒适便捷的使用体验。它们不仅外观简洁大方，而且功能性强，易于操作，能够适应快节奏的现代生活。选择这些日用品，您将享受到更高效、更环保的生活方式，让日常琐事变得更加轻松愉快。'},
    {'name': '垫子', 'cost': '25元', 'img': 'main4/ryp6.jpg','detail':'日用品系列，精心设计，满足日常生活所需。每件产品均采用优质材料，耐用且实用，旨在提升您的生活品质。无论是个人护理、家居清洁还是日常饮食，这些产品都能带给您舒适便捷的使用体验。它们不仅外观简洁大方，而且功能性强，易于操作，能够适应快节奏的现代生活。选择这些日用品，您将享受到更高效、更环保的生活方式，让日常琐事变得更加轻松愉快。'},
    {'name': '刷子', 'cost': '25元', 'img': 'main4/ryp7.jpg','detail':'日用品系列，精心设计，满足日常生活所需。每件产品均采用优质材料，耐用且实用，旨在提升您的生活品质。论是个人护理、家居清洁还是日常饮食，这些产品都能带给您舒适便捷的使用体验。它们不仅外观简洁大方，而且功能性强，易于操作，能够适应快节奏的现代生活。选择这些日用品，您将享受到更高效、更环保的生活方式，让日常琐事变得更加轻松愉快。'},
    {'name': '消毒水', 'cost': '25元', 'img': 'main4/ryp8.jpg','detail':'日用品系列，精心设计，满足日常生活所需。每件产品均采用优质材料，耐用且实用，旨在提升您的生活品质。无论是个人护理、家居清洁还是日常饮食，这些产品都能带给您舒适便捷的使用体验。它们不仅外观简洁大方，而且功能性强，易于操作，能够适应快节奏的现代生活。选择这些日用品，您将享受到更高效、更环保的生活方式，让日常琐事变得更加轻松愉快。'},
    {'name': '洗洁精', 'cost': '25元', 'img': 'main4/ryp9.jpg','detail':'日用品系列，精心设计，满足日常生活所需。每件产品均采用优质材料，耐用且实用，旨在提升您的生活品质。无论是个人护理、家居清洁还是日常饮食，这些产品都能带给您舒适便捷的使用体验。它们不仅外观简洁大方，而且功能性强，易于操作，能够适应快节奏的现代生活。选择这些日用品，您将享受到更高效、更环保的生活方式，让日常琐事变得更加轻松愉快。'},
    {'name': '一家', 'cost': '25元', 'img': 'main4/ryp10.jpg','detail':'日用品系列，精心设计，满足日常生活所需。每件产品均采用优质材料，耐用且实用，旨在提升您的生活品质。无论是个人护理、家居清洁还是日常饮食，这些产品都能带给您舒适便捷的使用体验。它们不仅外观简洁大方，而且功能性强，易于操作，能够适应快节奏的现代生活。选择这些日用品，您将享受到更高效、更环保的生活方式，让日常琐事变得更加轻松愉快。'},
    {'name': '拖鞋2', 'cost': '25元', 'img': 'main4/ryp11.jpg','detail':'日用品系列，精心设计，满足日常生活所需。每件产品均采用优质材料，耐用且实用，旨在提升您的生活品质。无论是个人护理、家居清洁还是日常饮食，这些产品都能带给您舒适便捷的使用体验。它们不仅外观简洁大方，而且功能性强，易于操作，能够适应快节奏的现生活。选择这些日用品，您将享受到更高效、更环保的生活方式，让日常琐事变得更加轻松愉快。'},
    {'name': '拖鞋', 'cost': '25元', 'img': 'main4/ryp12.jpg','detail':'日用品系列，精心设计，满足日常生活所需。每件产品均采用优质材料，耐用且实用，旨在提升您的生活品质。无论是个人护理、家居清洁还是日常饮食，这些产品都能带给您舒适便捷的使用体验。它们不仅外观简洁大方，而且功能性强，易于操作，能够适应快节奏的现代生活。选择这些日用品，您将享受到更高效、更环保的生活方式，让日常琐事变得更加轻松愉快。'},
    {'name': '工具', 'cost': '25元', 'img': 'main4/ryp13.jpg','detail':'日用品系列，精心设计，满足日常生活所需。每件产品均采用优质材料，耐用且实用，旨在提升您的生活品质。无论是个人护理、家居清洁还是日常饮食，这些产品都能带给您舒适便捷的使用体验。它们不仅外观简洁大方，而且功能性强，易于操作，能够适应快节奏的现代生活。选择这些日用品，您将享受到更高效、更环保的生活方式，让日常琐事变得更加轻松愉快。'},
    {'name': '扫帚', 'cost': '25元', 'img': 'main4/ryp14.jpg','detail':'日用品系列，精心设计，满足日常生活所需。每件产品均采用优质材料，耐用且实用，旨在提升您的生活品质。无论是个人护理、家居清洁还是日常饮食，这些产品都能带给您舒适便捷的使用体验。它们不仅外观简洁大方，而且功能性强，易于操作，能够适应快节奏的现代生活。选择这些日用品，您将享受到更高效、更环保的生活方式，让日常琐事变得更加轻松愉快。'},
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
      body: Stack(
        children: [
          Column(
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
                            builder: (context) => DarkThemeProductDetail(
                              product: filteredProducts[index],
                              cartManager: cartManager,
                            ),
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
          DraggableFloatingCart(cartManager: cartManager),
        ],
      ),
    );
  }
}

// 详情页// 详情页
class DarkThemeProductDetail extends StatefulWidget {
  final Map<String, String> product;
  final CartManager cartManager;

  DarkThemeProductDetail({
    required this.product,
    required this.cartManager,
  });

  @override
  _DarkThemeProductDetailState createState() => _DarkThemeProductDetailState();
}

class _DarkThemeProductDetailState extends State<DarkThemeProductDetail> {
  String? selectedSpec;
  final List<String> specs = ['规格一', '规格二']; // 配置的规格

  // 购物车商品列表
  List<Map<String, String>> cartItems = [];

  String _getProductValue(String key, [String defaultValue = '']) {
    final value = widget.product[key];
    if (key == 'img' && (value == null )) {
      return 'assets/default_image.png'; // 默认图片路径
    }
    return value ?? defaultValue;
  }
  // 重写build方法以构建产品详情页面
  @override
  Widget build(BuildContext context) {
    // 返回一个黑色背景的脚手架，包含产品详情的布局
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        // 设置返回按钮颜色
        iconTheme: IconThemeData(color: Colors.white), // 这里修改返回按钮颜色
        // 或者使用 leading 属性自定义返回按钮
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // 这里也可以修改颜色
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          _getProductValue('name'), 
          style: TextStyle(color: Colors.white)
        ),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            // 使用单ChildScrollView包裹列布局，以支持滚动
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 显示产品图片，覆盖整个屏幕宽度，高度为300
                Image.asset(_getProductValue('img'), fit: BoxFit.cover, width: double.infinity, height: 300),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 显示产品名称，使用较大的字体和加粗样式
                      Text(_getProductValue('name'), style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                      SizedBox(height: 8),
                      // 显示产品价格，文本颜色为红色，字体稍小
                      Text(_getProductValue('price'), style: TextStyle(color: Colors.redAccent, fontSize: 20)),
                      SizedBox(height: 16),
                      // 显示商品描述的标题
                      Text('商品描述', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                      SizedBox(height: 8),
                      // 显示产品详细信息
                      Text('${_getProductValue('detail')}', style: TextStyle(color: Colors.white70)),
                      SizedBox(height: 16),
                      SizedBox(height: 8),
                      SizedBox(height: 16),
                      // 显示两个按钮：加入购物车和立即购买
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () => _showOptionsBottomSheet(context),
                              child: Text('加入购物车'),
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[800]),
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () => _showOptionsBottomSheet(context),
                              child: Text('立即购买'),
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
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
          DraggableFloatingCart(cartManager: widget.cartManager),
        ],
      ),
    );
  }

  // 显示选项的底部弹出菜单
  void _showOptionsBottomSheet(BuildContext context) {
    // 使用模态底部弹出菜单显示选择规格的界面
    showModalBottomSheet(
      backgroundColor: Colors.grey[900],
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
                  // 显示选择规格的标题
                  Text('选择规格', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey[400])),
                  SizedBox(height: 8),
                  // 显示可选择的规格芯片
                  Wrap(
                    spacing: 8,
                    children: specs.map((spec) {
                      return ChoiceChip(
                        label: Text(spec, style: TextStyle(color: Colors.black)),
                        selectedColor: Colors.redAccent,
                        selected: selectedSpec == spec,
                        onSelected: (bool selected) {
                          setState(() {
                            selectedSpec = selected ? spec : null;
                          });
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16),
                  // 显示加入购物车和立即购买的按钮，根据选择的规格启用或禁用
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: selectedSpec != null ? () => _addToCart(context) : null,
                          child: Text('加购物车'),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[800]),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: selectedSpec != null ? () => _buyNow(context) : null,
                          child: Text('立即购买'),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
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
  void _addToCart(BuildContext context) {
    widget.cartManager.addItem(
      CartItem(
        name: _getProductValue('name'),
        cost: _getProductValue('cost'),
        img: _getProductValue('img'),
        spec: selectedSpec ?? '默认规格',
      ),
    );
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ShoppingCartPage(cartManager: widget.cartManager),
      ),
    );
  }

  void _buyNow(BuildContext context) {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('立即购买 ${_getProductValue('name')} ($selectedSpec)', style: TextStyle(color: Colors.white))),
    );
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
        backgroundColor: Colors.black,
      ),
      body: ListenableBuilder(
        listenable: cartManager,
        builder: (context, child) {
          if (cartManager.items.isEmpty) {
            return Center(
              child: Text('购物车是空的', style: TextStyle(color: Colors.white))
            );
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartManager.items.length,
                  itemBuilder: (context, index) {
                    final item = cartManager.items[index];
                    return ListTile(
                      leading: Image.asset(item.img),
                      title: Text(item.name, style: TextStyle(color: Colors.white)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.cost, style: TextStyle(color: Colors.redAccent)),
                          Text('规格: ${item.spec}', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove, color: Colors.white),
                            onPressed: () {
                              if (item.quantity > 1) {
                                cartManager.updateQuantity(index, item.quantity - 1);
                              }
                            },
                          ),
                          Text('${item.quantity}', style: TextStyle(color: Colors.white)),
                          IconButton(
                            icon: Icon(Icons.add, color: Colors.white),
                            onPressed: () {
                              cartManager.updateQuantity(index, item.quantity + 1);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.redAccent),
                            onPressed: () => cartManager.removeItem(index),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '总计: ¥${cartManager.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('结算成功')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent
                      ),
                      child: Text('去结算'),
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

// 购物车商品类
class CartItem {
  final String name;
  final String cost;
  final String img;
  final String spec;
  int quantity;

  CartItem({
    required this.name,
    required this.cost,
    required this.img,
    required this.spec,
    this.quantity = 1,
  });
}

// 购物车管理类
class CartManager extends ChangeNotifier {
  List<CartItem> _items = [];
  
  List<CartItem> get items => _items;
  
  void addItem(CartItem item) {
    _items.add(item);
    notifyListeners();
  }
  
  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }
  
  void updateQuantity(int index, int quantity) {
    _items[index].quantity = quantity;
    notifyListeners();
  }
  
  double get totalAmount {
    return _items.fold(0, (sum, item) => 
      sum + (double.parse(item.cost.replaceAll('元', '')) * item.quantity));
  }
}

// 可拖动的悬浮按钮组件
class DraggableFloatingCart extends StatefulWidget {
  final CartManager cartManager;

  DraggableFloatingCart({required this.cartManager});

  @override
  _DraggableFloatingCartState createState() => _DraggableFloatingCartState();
}

class _DraggableFloatingCartState extends State<DraggableFloatingCart> {
  late Offset position;
  
  @override
  void initState() {
    super.initState();
    // 初始化时设置位置
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final screenSize = MediaQuery.of(context).size;
      setState(() {
        position = Offset(
          screenSize.width - 70,  // 距离右边 70 像素
          screenSize.height - 200  // 调整高度，距离底部 200 像素
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    
    return Positioned(
      left: position?.dx ?? screenSize.width - 70,
      top: position?.dy ?? screenSize.height - 200,
      child: Draggable(
        feedback: Material(
          color: Colors.transparent,
          elevation: 4.0,  // 添加阴影效果
          child: FloatingActionButton(
            onPressed: null,
            backgroundColor: Colors.redAccent.withOpacity(0.8),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(Icons.shopping_cart, color: Colors.white, size: 26),
                if (widget.cartManager.items.isNotEmpty)
                  Positioned(
                    right: -8,
                    top: -8,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 24,
                        minHeight: 24,
                      ),
                      child: Text(
                        '${widget.cartManager.items.length}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ShoppingCartPage(cartManager: widget.cartManager),
              ),
            );
          },
          backgroundColor: Colors.redAccent,
          elevation: 4.0,  // 添加阴影效果
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Icon(Icons.shopping_cart, color: Colors.white, size: 26),
              if (widget.cartManager.items.isNotEmpty)
                Positioned(
                  right: -8,
                  top: -8,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 24,
                      minHeight: 24,
                    ),
                    child: Text(
                      '${widget.cartManager.items.length}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ),
        onDragEnd: (details) {
          setState(() {
            double newX = details.offset.dx;
            double newY = details.offset.dy;
            
            // 限制 X 坐标范围
            if (newX < 0) newX = 0;
            if (newX > screenSize.width - 60) newX = screenSize.width - 60;
            
            // 限制 Y 坐标范围，调整可拖动范围
            if (newY < 100) newY = 100;  // 顶部留出更多空间
            if (newY > screenSize.height - 160) newY = screenSize.height - 160;
            
            position = Offset(newX, newY);
          });
        },
      ),
    );
  }
}
