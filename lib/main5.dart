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
// ClassicalLogin 类继承自 StatelessWidget，用于实现一个经典的登录界面
class ClassicalLogin extends StatelessWidget {
  // 用户名输入框的控制器，用于获取用户输入的用户名
  final TextEditingController userController = TextEditingController();
  // 密码输入框的控制器，用于获取用户输入的密码
  final TextEditingController passController = TextEditingController();

  /**
   * 尝试验证用户身份
   *
   * 此方法会比较用户输入的用户名和密码与预设的用户名和密码是否匹配
   * 如果匹配成功，将导航到产品列表页面，否则显示错误提示信息
   *
   * @param context BuildContext 类型，用于导航和显示SnackBar
   */
  void authenticateUser(BuildContext context) {
    // 预设的用户名和密码，当前为空字符串
    String expectedUser = "";
    String expectedPass = "";
    // 比较用户输入与预设值，如果匹配则导航到产品列表页面
    if (userController.text == expectedUser && passController.text == expectedPass) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => ClassicalProductList()));
    } else {
      // 如果用户名或密码不正确，显示SnackBar提示用户
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('账号或密码不正确')),
      );
    }
  }

  // 构建登录界面的UI
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
            image: AssetImage("main5/blue.jpg"),
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
    {'productName': '黄油饼干', 'priceTag': '120元', 'image': 'main5/food1.jpg','detail':"这款食品精选上等原料，经过严格质量控制与精心加工，确保每一口都是安全美味的享受。它不仅满足了味蕾的追求，还富含必要的营养成分，为您提供健康均衡的饮食选择。实用环保的包装设计，便于储存和携带，保持食品的新鲜度和最佳口感。无论是忙碌的工作日还是悠闲的周末，这款食品都能迅速补充能量，成为您享受便捷健康生活的理想伴侣。我们致力于通过创新配方和多样化产品线，迎合不同消费者的口味和饮食偏好，让每一次用餐都成为愉悦的体验。选择我们，让美食的快乐融入生活的每一个角落，增添无限精彩。"},
    {'productName': '巧克力饼干', 'priceTag': '183元', 'image': 'main5/food2.jpg','detail':"这款食品精选上等原料，经过严格质量控制与精心加工，确保每一口都是安全美味的享受。它不仅满足了味蕾的追求，还富含必要的营养成分，为您提供健康均衡的饮食选择。实用环保的包装设计，便于储存和携带，保持食品的新鲜度和最佳口感。无论是忙碌的工作日还是悠闲的周末，这款食品都能迅速补充能量，成为您享受便捷健康生活的理想伴侣。我们致力于通过创新配方和多样化产品线，迎合不同消费者的口味和饮食偏好，让每一次用餐都成为愉悦的体验。选择我们，让美食的快乐融入生活的每一个角落，增添无限精彩。"},
    {'productName': '咪咪', 'priceTag': '78元', 'image': 'main5/food3.jpg','detail':"这款食品精选上等原料，经过严格质量控制与精心加工，确保每一口都是安全美味的享受。它不仅满足了味蕾的追求，还富含必要的营养成分，为您提供健康均衡的饮食选择。实用环保的包装设计，便于储存和携带，保持食品的新鲜度和最佳口感。无论是忙碌的工作日还是悠闲的周末，这款食品都能迅速补充能量，成为您享受便捷健康生活的理想伴侣。我们致力于通过创新配方和多样化产品线，迎合不同消费者的口味和饮食偏好，让每一次用餐都成为愉悦的体验。选择我们，让美食的快乐融入生活的每一个角落，增添无限精彩。"},
    {'productName': '巧克力夹心脆', 'priceTag': '265元', 'image': 'main5/food4.jpg','detail':"这款食品精选上等原料，经过严格质量控制与精心加工，确保每一口都是安全美味的享受。它不仅满足了味蕾的追求，还富含必要的营养成分，为您提供健康均衡的饮食选择。实用环保的包装设计，便于储存和携带，保持食品的新鲜度和最佳口感。无论是忙碌的工作日还是悠闲的周末，这款食品都能迅速补充能量，成为您享受便捷健康生活的理想伴侣。我们致力于通过创新配方和多样化产品线，迎合不同消费者的口味和饮食偏好，让每一次用餐都成为愉悦的体验。选择我们，让美食的快乐融入生活的每一个角落，增添无限精彩。"},
    {'productName': '香菇肥牛', 'priceTag': '45元', 'image': 'main5/food5.jpg','detail':"这款食品精选上等原料，经过严格质量控制与精心加工，确保每一口都是安全美味的享受。它不仅满足了味蕾的追求，还富含必要的营养成分，为您提供健康均衡的饮食选择。实用环保的包装设计，便于储存和携带，保持食品的新鲜度和最佳口感。无论是忙碌的工作日还是悠闲的周末，这款食品都能迅速补充能量，成为您享受便捷健康生活的理想伴侣。我们致力于通过创新配方和多样化产品线，迎合不同消费者的口味和饮食偏好，让每一次用餐都成为愉悦的体验。选择我们，让美食的快乐融入生活的每一个角落，增添无限精彩。"},
    {'productName': '紫皮腰果', 'priceTag': '203元', 'image': 'main5/food6.jpg','detail':"这款食品精选上等原料，经过严格质量控制与精心加工，确保每一口都是安全美味的享受。它不仅满足了味蕾的追求，还富含必要的营养成分，为您提供健康均衡的饮食选择。实用环保的包装设计，便于储存和携带，保持食品的新鲜度和最佳口感。无论是忙碌的工作日还是悠闲的周末，这款食品都能迅速补充能量，成为您享受便捷健康生活的理想伴侣。我们致力于通过创新配方和多样化产品线，迎合不同消费者的口味和饮食偏好，让每一次用餐都成为愉悦的体验。选择我们，让美食的快乐融入生活的每一个角落，增添无限精彩。"},
    {'productName': '番茄味薯片', 'priceTag': '39元', 'image': 'main5/food7.jpg','detail':"这款食品精选上等原料，经过严格质量控制与精心加工，确保每一口都是安全美味的享受。它不仅满足了味蕾的追求，还富含必要的营养成分，为您提供健康均衡的饮食选择。实用环保的包装设计，便于储存和携带，保持食品的新鲜度和最佳口感。无论是忙碌的工作日还是悠闲的周末，这款食品都能迅速补充能量，成为您享受便捷健康生活的理想伴侣。我们致力于通过创新配方和多样化产品线，迎合不同消费者的口味和饮食偏好，让每一次用餐都成为愉悦的体验。选择我们，让美食的快乐融入生活的每一个角落，增添无限精彩。"},
    {'productName': '港荣蒸蛋糕', 'priceTag': '145元', 'image': 'main5/food8.jpg','detail':"这款食品精选上等原料，经过严格质量控制与精心加工，确保每一口都是安全美味的享受。它不仅满足了味蕾的追求，还富含必要的营养成分，为您提供健康均衡的饮食选择。实用环保的包装设计，便于储存和携带，保持食品的新鲜度和最佳口感。无论是忙碌的工作日还是悠闲的周末，这款食品都能迅速补充能量，成为您享受便捷健康生活的理想伴侣。我们致力于通过创新配方和多样化产品线，迎合不同消费者的口味和饮食偏好，让每一次用餐都成为愉悦的体验。选择我们，让美食的快乐融入生活的每一个角落，增添无限精彩。"},
    {'productName': '脆脆鲨', 'priceTag': '299元', 'image': 'main5/food10.jpg','detail':"这款食品精选上等原料，经过严格质量控制与精心加工，确保每一口都是安全美味的享受。它不仅满足了味蕾的追求，还富含必要的营养成分，为您提供健康均衡的饮食选择。实用环保的包装设计，便于储存和携带，保持食品的新鲜度和最佳口感。无论是忙碌的工作日还是悠闲的周末，这款食品都能迅速补充能量，成为您享受便捷健康生活的理想伴侣。我们致力于通过创新配方和多样化产品线，迎合不同消费者的口味和饮食偏好，让每一次用餐都成为愉悦的体验。选择我们，让美食的快乐融入生活的每一个角落，增添无限精彩。"},
    {'productName': '芝士蛋黄酥', 'priceTag': '217元', 'image': 'main5/food11.jpg','detail':"这款食品精选上等原料，经过严格质量控制与精心加工，确保每一口都是安全美味的享受。它不仅满足了味蕾的追求，还富含必要的营养成分，为您提供健康均衡的饮食选择。实用环保的包装设计，便于储存和携带，保持食品的新鲜度和最佳口感。无论是忙碌的工作日还是悠闲的周末，这款食品都能迅速补充能量，成为您享受便捷健康生活的理想伴侣。我们致力于通过创新配方和多样化产品线，迎合不同消费者的口味和饮食偏好，让每一次用餐都成为愉悦的体验。选择我们，让美食的快乐融入生活的每一个角落，增添无限精彩。"},
    {'productName': '卤蛋', 'priceTag': '107元', 'image': 'main5/food12.jpg','detail':"这款食品精选上等原料，经过严格质量控制与精心加工，确保每一口都是安全美味的享受。它不仅满足了味蕾的追求，还富含必要的营养成分，为您提供健康均衡的饮食选择。实用环保的包装设计，便于储存和携带，保持食品的新鲜度和最佳口感。无论是忙碌的工作日还是悠闲的周末，这款食品都能迅速补充能量，成为您享受便捷健康生活的理想伴侣。我们致力于通过创新配方和多样化产品线，迎合不同消费者的口味和饮食偏好，让每一次用餐都成为愉悦的体验。选择我们，让美食的快乐融入生活的每一个角落，增添无限精彩。"},
    {'productName': '蛋黄酥', 'priceTag': '161元', 'image': 'main5/food13.jpg','detail':"这款食品精选上等原料，经过严格质量控制与精心加工，确保每一口都是安全美味的享受。它不仅满足了味蕾的追求，还富含必要的营养成分，为您提供健康均衡的饮食选择。实用环保的包装设计，便于储存和携带，保持食品的新鲜度和最佳口感。无论是忙碌的工作日还是悠闲的周末，这款食品都能迅速补充能量，成为您享受便捷健康生活的理想伴侣。我们致力于通过创新配方和多样化产品线，迎合不同消费者的口味和饮食偏好，让每一次用餐都成为愉悦的体验。选择我们，让美食的快乐融入生活的每一个角落，增添无限精彩。"},
    {'productName': '卤蛋（独立包装）', 'priceTag': '58元', 'image': 'main5/food14.jpg','detail':"这款食品精选上等原料，经过严格质量控制与精心加工，确保每一口都是安全美味的享受。它不仅满足了味蕾的追求，还富含必要的营养成分，为您提供健康均衡的饮食选择。实用环保的包装设计，便于储存和携带，保持食品的新鲜度和最佳口感。无论是忙碌的工作日还是悠闲的周末，这款食品都能迅速补充能量，成为您享受便捷健康生活的理想伴侣。我们致力于通过创新配方和多样化产品线，迎合不同消费者的口味和饮食偏好，让每一次用餐都成为愉悦的体验。选择我们，让美食的快乐融入生活的每一个角落，增添无限精彩。"},
    {'productName': '海味鱼豆腐', 'priceTag': '274元', 'image': 'main5/food15.jpg','detail':"这款食品精选上等原料，经过严格质量控制与精心加工，确保每一口都是安全美味的享受。它不仅满足了味蕾的追求，还富含必要的营养成分，为您提供健康均衡的饮食选择。实用环保的包装设计，便于储存和携带，保持食品的新鲜度和最佳口感。无论是忙碌的工作日还是悠闲的周末，这款食品都能迅速补充能量，成为您享受便捷健康生活的理想伴侣。我们致力于通过创新配方和多样化产品线，迎合不同消费者的口味和饮食偏好，让每一次用餐都成为愉悦的体验。选择我们，让美食的快乐融入生活的每一个角落，增添无限精彩。"},
  ];

  List<Map<String, String>> currentDisplayProducts = [];
  final TextEditingController searchFieldController = TextEditingController();
  final CartManager cartManager = CartManager();

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
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShoppingCartPage(cartManager: cartManager),
                    ),
                  );
                },
              ),
              if (cartManager.itemCount > 0)
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
                      '${cartManager.itemCount}',
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
                        builder: (context) => CardStyleProductDetail(item: currentDisplayProducts[index], cartManager: cartManager),
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
                              currentDisplayProducts[index]['image']!,
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


class CardStyleProductDetail extends StatefulWidget {
  final Map<String, String> item;
  final CartManager cartManager;

  CardStyleProductDetail({
    required this.item,
    required this.cartManager,
  });

  @override
  _CardStyleProductDetailState createState() => _CardStyleProductDetailState();
}

class _CardStyleProductDetailState extends State<CardStyleProductDetail> {
  String? selectedSize;
  final List<String> sizes = ['S', 'M', 'L', 'XL']; // 尺寸选项

  void _addToCart(BuildContext context) {
    if (selectedSize != null) {
      // 创建购物车商品项
      CartItem newItem = CartItem(
        name: widget.item['productName']!,
        price: widget.item['priceTag']!,
        image: widget.item['image']!,
        size: selectedSize!,
      );
      
      // 添加到购物车
      widget.cartManager.addItem(newItem);
      
      // 关闭底部弹窗
      Navigator.pop(context);
      
      // 显示提示
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('已添加到购物车')),
      );
      
      // 跳转到购物车页面
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ShoppingCartPage(cartManager: widget.cartManager),
        ),
      );
    } else {
      // 如果没有选择尺寸，显示提示
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('请选择尺寸')),
      );
    }
  }

  // 显示底部弹出菜单
  void _showOptionsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('选择尺寸', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    children: sizes.map((size) {
                      return ChoiceChip(
                        label: Text(size),
                        selected: selectedSize == size,
                        onSelected: (bool selected) {
                          setState(() {
                            selectedSize = selected ? size : null;
                          });
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: selectedSize != null 
                              ? () => _addToCart(context)
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                          ),
                          child: Text('加入购物车'),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: selectedSize != null 
                              ? () {
                                  _addToCart(context);
                                  // 可以直接跳转到结算页面
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
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

  @override
  Widget build(BuildContext context) {
    // 返回一个Scaffold作为主布局结构
    return Scaffold(
      // 设置AppBar，包含产品名称
      appBar: AppBar(
        title: Text(widget.item['productName']!),
        backgroundColor: Colors.blueAccent,
      ),
      // 使用SingleChildScrollView包裹Column，允许垂直滚动
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 显示产品图片，覆盖整个屏幕宽度，高度为300
            Image.asset(widget.item['image']!, fit: BoxFit.cover, width: double.infinity, height: 300),
            // 使用Padding包裹产品详细信息
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 显示产品名称，使用较大的字体和粗体
                  Text(widget.item['productName']!, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  // 显示产品价格，使用红色和较大的字体
                  Text(widget.item['priceTag']!, style: TextStyle(color: Colors.redAccent, fontSize: 20)),
                  SizedBox(height: 16),
                  // 显示“商品描述”标题，使用较大的字体和粗体
                  Text('商品描述', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  // 显示产品详细描述
                  Text(widget.item['detail']!),
                  SizedBox(height: 16),
                  // 显示两个按钮：“加入购物车”和“立即购买”
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
    );
  }
}

// 购物车商品模型
class CartItem {
  final String name;
  final String price;
  final String image;
  final String size;
  int quantity;

  CartItem({
    required this.name,
    required this.price,
    required this.image,
    required this.size,
    this.quantity = 1,
  });
}

// 购物车管理类
class CartManager extends ChangeNotifier {
  List<CartItem> _items = [];
  
  List<CartItem> get items => _items;
  
  int get itemCount => _items.length;
  
  double get totalAmount {
    return _items.fold(0, (sum, item) {
      double price = double.parse(item.price.replaceAll('元', ''));
      return sum + (price * item.quantity);
    });
  }
  
  void addItem(CartItem item) {
    // 检查是否已存在相同商品和规格
    int existingIndex = _items.indexWhere(
      (i) => i.name == item.name && i.size == item.size
    );
    
    if (existingIndex != -1) {
      _items[existingIndex].quantity += 1;
    } else {
      _items.add(item);
    }
    notifyListeners();
  }
  
  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }
  
  void updateQuantity(int index, int quantity) {
    if (quantity > 0) {
      _items[index].quantity = quantity;
      notifyListeners();
    }
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
        backgroundColor: Colors.blueAccent,
      ),
      body: ListenableBuilder(
        listenable: cartManager,
        builder: (context, child) {
          if (cartManager.items.isEmpty) {
            return Center(
              child: Text('购物车是空的', style: TextStyle(fontSize: 16)),
            );
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
                        leading: Image.asset(item.image, width: 60, height: 60, fit: BoxFit.cover),
                        title: Text(item.name),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('规格: ${item.size}'),
                            Text('价格: ${item.price}', style: TextStyle(color: Colors.redAccent)),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                if (item.quantity > 1) {
                                  cartManager.updateQuantity(index, item.quantity - 1);
                                }
                              },
                            ),
                            Text('${item.quantity}'),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                cartManager.updateQuantity(index, item.quantity + 1);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () => cartManager.removeItem(index),
                            ),
                          ],
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
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // 结算逻辑
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('结算成功')),
                        );
                        cartManager.clear();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
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
