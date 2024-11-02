// 1、登陆 done
// 列表 done
// 详情 todo
import 'package:flutter/material.dart';

void main() => runApp(InkStyleApp());

class InkStyleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '登录',
      home: InkLogin(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class InkLogin extends StatelessWidget {
  final TextEditingController inkUser = TextEditingController();
  final TextEditingController inkPass = TextEditingController();

  void handleLogin(BuildContext context) {
    String correctUser = "";
    String correctPass = "";
    if (inkUser.text == correctUser && inkPass.text == correctPass) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => InkProduct()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('用户名或密码错误')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('登录'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("main6/bg.jpg"), 
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: inkUser,
                  decoration: InputDecoration(
                    labelText: '用户名',
                    filled: true,
                    fillColor: Colors.white60,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
                    prefixIcon: const Icon(Icons.person, color: Colors.black),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: inkPass,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: '密码',
                    filled: true,
                    fillColor: Colors.white60,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
                    prefixIcon: const Icon(Icons.lock, color: Colors.black),
                  ),
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () => handleLogin(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white70,
                    padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                    side: BorderSide(color: Colors.black, width: 1.5),
                  ),
                  child: const Text('登录', style: TextStyle(color: Colors.black, fontSize: 18)),
                ),
                ElevatedButton(
                  onPressed: () => (),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white70,
                    padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                    side: BorderSide(color: Colors.black, width: 1.5),
                  ),
                  child: const Text('注册', style: TextStyle(color: Colors.black, fontSize: 18)),
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
class InkProduct extends StatefulWidget {
  @override
  _InkProductPageState createState() => _InkProductPageState();
}

class _InkProductPageState extends State<InkProduct> {
 
  final List<Map<String, String>> catalogItems = [
    {'name': '毛绒玩具', 'price': '¥89', 'image': 'main6/phone.jpg','detail':'补充商品描述'},
    {'name': '拼图', 'price': '¥39', 'image': 'main6/apple.jpg','detail':'补充商品描述'},
    {'name': '彩色积木', 'price': '¥59', 'image': 'main6/phone.jpg','detail':'补充商品描述'},
    {'name': '模型车', 'price': '¥129', 'image': 'main6/apple.jpg','detail':'补充商品描述'},
  ];

  List<Map<String, String>> availableItems = [];
  final TextEditingController searchBoxController = TextEditingController();

  @override
  void initState() {
    super.initState();
    availableItems = List.from(catalogItems);
  }

  void searchCatalog(String keyword) {
    setState(() {
      availableItems = catalogItems
          .where((item) => item['name']!.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        title: const Text('卡通商品陈列', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchBoxController,
              decoration: InputDecoration(
                labelText: '查找商品',
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.search, color: Colors.orange),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
              onChanged: searchCatalog,
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.8,
              ),
              itemCount: availableItems.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartoonProductDetail(item: availableItems[index]),
                      ),
                    );
                  },
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(availableItems[index]['image']!),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            availableItems[index]['name']!,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Text(
                          availableItems[index]['price']!,
                          style: TextStyle(color: Colors.green, fontWeight: FontWeight.w700),
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

// class CartoonProductDetail extends StatelessWidget {
//   final Map<String, String> item;
//   CartoonProductDetail({required this.item});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(item['name']!),
//         backgroundColor: Colors.orange,
//       ),
//       body: Center(child: Text('这是${item['name']}的卡通风详情')),
//     );
//   }
// }


class CartoonProductDetail extends StatefulWidget {
  final Map<String, String> item;
  CartoonProductDetail({required this.item});

  @override
  _CartoonProductDetailState createState() => _CartoonProductDetailState();
}

class _CartoonProductDetailState extends State<CartoonProductDetail> {
  String? chosenSize;
  String? chosenColor;
  final List<String> sizes = ['S', 'M', 'L'];
  final List<String> colors = ['红色', '蓝色', '黑色'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.item['name']!)),
      body: Column(
        children: [
          Image.asset(widget.item['image']!, width: double.infinity, height: 300),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.item['name']!, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Text(widget.item['price']!, style: TextStyle(color: Colors.redAccent, fontSize: 20)),
                // 商品详情，灰色，小号字体
                Text(widget.item['detail']!, style: TextStyle(color: Colors.grey, fontSize: 12)),
                // 下面的内容固定在屏幕底部
                const Divider(),
                _buildActionButtons(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      // 下面两个按钮，布局固定到屏幕到最底部
      children: [
        Expanded(child: ElevatedButton(onPressed: () => _showSpecificationSheet(context), child: Text('加入购物车'))),
        SizedBox(width: 8),
        Expanded(child: ElevatedButton(onPressed: () => _showSpecificationSheet(context), child: Text('立即购买'))),
      ],
    );
  }

  void _showSpecificationSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return _buildSpecificationOptions();
      },
    );
  }

  Widget _buildSpecificationOptions() {
    return StatefulBuilder(
      builder: (context, setState) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSizeOptions(setState),
              _buildColorOptions(setState),
              _buildBottomActionButtons(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSizeOptions(StateSetter setState) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('选择尺寸', style: TextStyle(fontSize: 18)),
        Wrap(
          spacing: 8,
          children: sizes.map((size) {
            return ChoiceChip(
              label: Text(size),
              selectedColor: Colors.blueAccent,
              selected: chosenSize == size,
              onSelected: (bool selected) {
                setState(() {
                  chosenSize = selected ? size : null;
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildColorOptions(StateSetter setState) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('选择颜色', style: TextStyle(fontSize: 18)),
        Wrap(
          spacing: 8,
          children: colors.map((color) {
            return ChoiceChip(
              label: Text(color),
              selectedColor: Colors.blueAccent,
              selected: chosenColor == color,
              onSelected: (bool selected) {
                setState(() {
                  chosenColor = selected ? color : null;
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildBottomActionButtons() {
    return Row(
      children: [
        Expanded(child: ElevatedButton(onPressed: (chosenSize != null && chosenColor != null) ? _confirmAddToCart : null, child: Text('加入购物车'))),
        SizedBox(width: 8),
        Expanded(child: ElevatedButton(onPressed: (chosenSize != null && chosenColor != null) ? _confirmBuyNow : null, child: Text('立即购买'))),
      ],
    );
  }

  void _confirmAddToCart() {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('加入购物车成功')));
  }

  void _confirmBuyNow() {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('立即购买成功')));
  }
}
