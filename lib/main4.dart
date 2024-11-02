// 1、登陆 done
// 列表 done
// 详情 done
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
    String adminUser = "";
    String adminPass = "";
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
        actions: [
                  TextButton(
                    child: Text('客服', style: TextStyle(color: Colors.amber)),
                    onPressed: () {
                      // Your customer service action here
                    },
                  ),
                ],
      ),
      body: Center(
        child: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('main4/bg.jpg'),
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
                      // Your forgot password action here
                    },
                    child: const Text('忘记密码?', style: TextStyle(color: Colors.amber)),
                  ),
                  TextButton(
                    onPressed: () {
                      // Your register action here
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
  // List of products
  final List<Map<String, String>> productList = [
    {'name': '运动相机', 'cost': '¥399', 'img': 'main4/apple.jpg','detail':'商品描述'},
    {'name': '电竞耳机', 'cost': '¥299', 'img': 'main4/phone.jpg','detail':'商品描述'},
    {'name': '运动相机', 'cost': '¥399', 'img': 'main4/apple.jpg','detail':'商品描述'},
    {'name': '电竞耳机', 'cost': '¥299', 'img': 'main4/phone.jpg','detail':'商品描述'},
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

// 详情页// 详情页
class DarkThemeProductDetail extends StatefulWidget {
  final Map<String, String> product;
  DarkThemeProductDetail({required this.product});

  @override
  _DarkThemeProductDetailState createState() => _DarkThemeProductDetailState();
}

class _DarkThemeProductDetailState extends State<DarkThemeProductDetail> {
  String? selectedSpec;
  final List<String> specs = ['规格一', '规格二']; // 配置的规格

  String _getProductValue(String key, [String defaultValue = '']) {
    final value = widget.product[key];
    if (key == 'img' && (value == null )) {
      return 'assets/default_image.png'; // 默认图片路径
    }
    return value ?? defaultValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(_getProductValue('name'), style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(_getProductValue('img'), fit: BoxFit.cover, width: double.infinity, height: 300),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_getProductValue('name'), style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                  SizedBox(height: 8),
                  Text(_getProductValue('price'), style: TextStyle(color: Colors.redAccent, fontSize: 20)),
                  SizedBox(height: 16),
                  Text('商品描述', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                  SizedBox(height: 8),
                  Text('${_getProductValue('detail')}', style: TextStyle(color: Colors.white70)),
                  SizedBox(height: 16),
                  SizedBox(height: 8),
                  SizedBox(height: 16),
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

  void _showOptionsBottomSheet(BuildContext context) {
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
                  Text('选择规格', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey[400])),
                  SizedBox(height: 8),
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
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: selectedSpec != null ? () => _addToCart(context) : null,
                          child: Text('加入购物车'),
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
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('已将 ${_getProductValue('name')} ($selectedSpec) 加入购物车', style: TextStyle(color: Colors.white))),
    );
  }

  void _buyNow(BuildContext context) {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('立即购买 ${_getProductValue('name')} ($selectedSpec)', style: TextStyle(color: Colors.white))),
    );
  }
}
