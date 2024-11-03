
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
              image: AssetImage('main2/weixin.jpg'),
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
    {'title': '宠物玩具', 'price': '5元', 'image': 'main2/pig2.jpg'},
    {'title': '猫咪屋', 'price': '109元', 'image': 'main2/pig1.jpg'},
    {'title': '猫咪零食', 'price': '100元', 'image': 'main2/pig3.jpg'},
    {'title': '小狗玩具', 'price': '100元', 'image': 'main2/pig4.jpg'},
    {'title': '零食', 'price': '100元', 'image': 'main2/pig5.jpg'},
    {'title': '包包', 'price': '100元', 'image': 'main2/pig6.jpg'},
    {'title': '猫咪背包', 'price': '100元', 'image': 'main2/pig7.jpg'},
    {'title': '玩具', 'price': '100元', 'image': 'main2/pig8.jpg'},
    {'title': '猫咪玩具', 'price': '100元', 'image': 'main2/pig9.jpg'},
    {'title': '零食', 'price': '100元', 'image': 'main2/pig10.jpg'},
    {'title': '逗猫棒', 'price': '100元', 'image': 'main2/pig11.jpg'},
    {'title': '毛线球', 'price': '100元', 'image': 'main2/pig12.jpg'},
    {'title': '背包', 'price': '100元', 'image': 'main2/pig13.jpg'},
    {'title': '猫咪床', 'price': '100元', 'image': 'main2/pig14.jpg'},
    {'title': '猫抓板', 'price': '100元', 'image': 'main2/pig15.jpg'},
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
  // 构建应用界面
  Widget build(BuildContext context) {
    // 返回一个带有应用栏和滚动内容的脚手架
    return Scaffold(
      // 设置应用栏，标题从传入的item字典中获取
      appBar: AppBar(title: Text(widget.item['title']!)),
      // 设置一个可以垂直滚动的单ChildScrollView
      body: SingleChildScrollView(
        // 列布局，子部件沿水平方向对齐
        child: Column(
          // 设置子部件的对齐方式
          crossAxisAlignment: CrossAxisAlignment.start,
          // 列布局的子部件
          children: [
            // 显示图片，图片路径从传入的item字典中获取
            // 图片充满整个宽度，高度为300
            Image.asset(widget.item['image']!, fit: BoxFit.cover, width: double.infinity, height: 300),
            // 设置一个内边距为16.0的Padding
            Padding(
              padding: const EdgeInsets.all(16.0),
              // 列布局，用于显示详细信息
              child: Column(
                // 设置子部件的对齐方式
                crossAxisAlignment: CrossAxisAlignment.start,
                // 列布局的子部件
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
                  ..._buildChoiceChips('选择规格', specs, (spec) => setState(() => selectedSpec = spec)),
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

  List<Widget> _buildChoiceChips(String title, List<String> options, Function(String) onSelected) {
    return [
      // 标题文本，使用较大的字体和加粗样式以突出显示
      Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      // 在标题和选项之间添加一定的垂直间距
      SizedBox(height: 8),
      // 使用Wrap布局来自动换行显示选项，每个选项之间水平间距为8
      Wrap(
        spacing: 8,
        children: options.map((option) {
          // 为每个选项生成一个选择芯片
          return ChoiceChip(
            label: Text(option),
            // 根据当前选中的选项来决定这个芯片是否应该显示为选中状态
            selected: selectedSpec != null && selectedSpec!.contains(option),
            // 当芯片的选中状态改变时，调用传入的回调函数
            onSelected: (bool selected) {
              onSelected(selected ? option : '');
            },
          );
        }).toList(),
      ),
      // 在选项下方添加一定的垂直间距，以区分不同的选项组
      SizedBox(height: 16),
    ];
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
