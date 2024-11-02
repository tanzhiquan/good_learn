// 1、登陆 done
// 列表 done
// 详情 done
import 'package:flutter/material.dart';

void main() => runApp(AppMain());

class AppMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '学习项目',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

// 登录页
class LoginScreen extends StatelessWidget {
  final TextEditingController usernameField = TextEditingController();
  final TextEditingController passwordField = TextEditingController();

  void performLogin(BuildContext context) {
    String correctUsername = "admin";
    String correctPassword = "123456";
    if (usernameField.text == correctUsername && passwordField.text == correctPassword) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Products()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('密码或账号错误')),
      );
    }
  }

  void performRegister(BuildContext context) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('完成注册')),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('登录')),
      body: Center(
        // 添加背景图片 下面已经有child属性了

        // 添加背景图片
        child: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('main2/bg.jpg'), 
              fit: BoxFit.cover,
            ),
          ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: usernameField,
                decoration: InputDecoration(
                  labelText: '账号',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
                  prefixIcon: Icon(Icons.person, color: Colors.blue),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: passwordField,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: '密码',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
                  prefixIcon: Icon(Icons.lock, color: Colors.blue),
                ),
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () => performLogin(context),
                child: const Text('登陆', style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                ),
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () => performRegister(context),
                child: const Text('注册', style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                ),
              ),
              const SizedBox(height: 16.0),
              TextButton(
                onPressed: () {},
                child: const Text('忘记密码?'),
                style: TextButton.styleFrom(foregroundColor: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    ));
  } 
  
}

class Products extends StatefulWidget {
  @override
  _SimpleProductListState createState() => _SimpleProductListState();
}
class _SimpleProductListState extends State<Products> {
  final List<Map<String, String>> productCatalog = [
    {'title': '智能手表', 'price': '¥299', 'image': 'assets/apple.jpg'},
    {'title': '数码相机', 'price': '¥899', 'image': 'assets/camera.jpg'},
    {'title': '蓝牙耳机', 'price': '¥199', 'image': 'assets/earphone.jpg'},
    {'title': '平板电脑', 'price': '¥499', 'image': 'assets/tablet.jpg'},
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SimpleProductDetail(item: visibleProducts[i]),
                    ),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                          child: Image.asset(
                            visibleProducts[i]['image']!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          visibleProducts[i]['title']!,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          visibleProducts[i]['price']!,
                          style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.w600),
                        ),
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
  final List<String> specs = ['32GB', '64GB', '128GB'];

  final List<String> colors = ['红色', '蓝色', '黑色', '白色'];
  final List<String> sizes = ['S', 'M', 'L', 'XL'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.item['title']!)),
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
                  Text(widget.item['title']!, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
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
                          onPressed: () => _showOptionsBottomSheet(context),
                          child: Text('加入购物车'),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => _showOptionsBottomSheet(context),
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

  void _showOptionsBottomSheet(BuildContext context) {
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
                  Text('选择规格', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: specs.map((spec) {
                      return ChoiceChip(
                        label: Text(spec),
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
                  Text('选择颜色', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: colors.map((color) {
                      return ChoiceChip(
                        label: Text(color),
                        selected: selectedSpec != null && selectedSpec!.contains(color),
                        onSelected: (bool selected) {
                          setState(() {
                            selectedSpec = selected ? (selectedSpec ?? '') + color : (selectedSpec ?? '').replaceAll(color, '');
                          });
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16),
                  Text('选择尺寸', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: sizes.map((size) {
                      return ChoiceChip(
                        label: Text(size),
                        selected: selectedSpec != null && selectedSpec!.contains(size),
                        onSelected: (bool selected) {
                          setState(() {
                            selectedSpec = selected ? (selectedSpec ?? '') + size : (selectedSpec ?? '').replaceAll(size, '');
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
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: selectedSpec != null ? () => _buyNow(context) : null,
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

  void _addToCart(BuildContext context) {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('已将 ${widget.item['title']} ($selectedSpec) 加入购物车')),
    );
  }

  void _buyNow(BuildContext context) {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('立即购买 ${widget.item['title']} ($selectedSpec)')),
    );
  }
}
