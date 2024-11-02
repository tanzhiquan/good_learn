// 1、登陆 done
// 列表 done
// 详情 todo
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

// 登录页面
class ClassicalLogin extends StatelessWidget {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  void authenticateUser(BuildContext context) {
    String expectedUser = "";
    String expectedPass = "";
    if (userController.text == expectedUser && passController.text == expectedPass) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => ClassicalProductList()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('账号或密码不正确')),
      );
    }
  }

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
            image: AssetImage("main5/bg.jpg"), 
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
    {'productName': '智能手环', 'priceTag': '¥179', 'image': 'main5/apple.jpg','detail':"需要补充详情"},
    {'productName': '无线音箱', 'priceTag': '¥299', 'image': 'main5/apple.jpg','detail':"需要补充详情"},
    {'productName': '笔记本电脑', 'priceTag': '¥3599', 'image': 'main5/phone.jpg','detail':"需要补充详情"},
    {'productName': '空气净化器', 'priceTag': '¥799', 'image': 'main5/phone.jpg','detail':"需要补充详情"},
  ];

  List<Map<String, String>> currentDisplayProducts = [];
  final TextEditingController searchFieldController = TextEditingController();

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
                        builder: (context) => CardStyleProductDetail(item: currentDisplayProducts[index]),
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

// class CardStyleProductDetail extends StatelessWidget {
//   final Map<String, String> item;
//   CardStyleProductDetail({required this.item});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(item['productName']!)),
//       body: Center(child: Text('${item['productName']}的详细介绍')),
//     );
//   }
// }


class CardStyleProductDetail extends StatefulWidget {
  final Map<String, String> item;
  CardStyleProductDetail({required this.item});

  @override
  _CardStyleProductDetailState createState() => _CardStyleProductDetailState();
}

class _CardStyleProductDetailState extends State<CardStyleProductDetail> {
  String? selectedSize;
  String? selectedColor;
  final List<String> sizes = ['S', 'M', 'L'];
  final List<String> colors = ['红色', '蓝色', '黑色'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item['productName']!),
        backgroundColor: Colors.blueAccent,
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
                  Text(widget.item['productName']!, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text(widget.item['priceTag']!, style: TextStyle(color: Colors.redAccent, fontSize: 20)),
                  SizedBox(height: 16),
                  Text('商品描述', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text(widget.item['detail']!),
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
      context: context,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('选择规格', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('尺寸', style: TextStyle(fontSize: 16)),
                  Wrap(
                    spacing: 8,
                    children: sizes.map((size) {
                      return ChoiceChip(
                        label: Text(size),
                        selectedColor: Colors.blueAccent,
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
                  Text('颜色', style: TextStyle(fontSize: 16)),
                  Wrap(
                    spacing: 8,
                    children: colors.map((color) {
                      return ChoiceChip(
                        label: Text(color),
                        selectedColor: Colors.blueAccent,
                        selected: selectedColor == color,
                        onSelected: (bool selected) {
                          setState(() {
                            selectedColor = selected ? color : null;
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
                          onPressed: (selectedSize != null && selectedColor != null)
                              ? () => _addToCart(context)
                              : null,
                          child: Text('加入购物车'),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[800]),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: (selectedSize != null && selectedColor != null)
                              ? () => _buyNow(context)
                              : null,
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
      SnackBar(content: Text('已将 ${widget.item['productName']} ($selectedSize, $selectedColor) 加入购物车')),
    );
  }

  void _buyNow(BuildContext context) {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('立即购买 ${widget.item['productName']} ($selectedSize, $selectedColor)')),
    );
  }
}
