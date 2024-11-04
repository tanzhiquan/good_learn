import 'package:flutter/material.dart';

void main() => runApp(MinimalApp());

class MinimalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'demo',
      home: MinimalLogin(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MinimalLogin extends StatelessWidget {
  final TextEditingController userCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();

  void signIn(BuildContext context) {
    String user = "";
    String pass = "";
    if (userCtrl.text == user && passCtrl.text == pass) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => MinimalProductList()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('登陆异常')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('登陆'), backgroundColor: const Color.fromARGB(221, 103, 63, 180)),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 背景图片
          Image.asset(
            "main7/yellow.jpg",
            fit: BoxFit.cover,
          ),
          // 登录表单
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: userCtrl,
                  decoration: InputDecoration(
                    labelText: '用户：',
                    filled: true,
                    fillColor: Colors.white10,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color.fromARGB(221, 103, 63, 180), width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color.fromARGB(221, 103, 63, 180), width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                TextField(
                  controller: passCtrl,
                  decoration: InputDecoration(
                    labelText: '密码：',
                    filled: true,
                    fillColor: Colors.white10,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(221, 103, 63, 180), width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white10, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                // 忘记密码和注册按钮
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('忘记密码功能尚未实现')),
                        );
                      },
                      child: const Text('忘记密码？', style: TextStyle(color: Colors.blue)),
                    ),
                    TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('注册完成')),
                        );
                      },
                      child: const Text('注册', style: TextStyle(color: Colors.blue)),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => signIn(context),
                  style: ButtonStyle(
                    alignment: Alignment.centerLeft,
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(const Color.fromARGB(221, 103, 63, 180)),
                  ),
                  child: const Text('登陆'),  
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MinimalProductList extends StatefulWidget {
  @override
  _MinimalProductListState createState() => _MinimalProductListState();
}

class _MinimalProductListState extends State<MinimalProductList> {
  final List<Map<String, String>> products = [
    {'title': '黑色中性笔', 'price': '¥299', 'image': 'main7/wenju1.jpg','description':'这款文具系列以其精致设计和实用性深受用户喜爱。每件文具都经过精心打造，不仅外观时尚，而且功能多样，满足日常学习和办公需求。'},
    {'title': '笔记本', 'price': '¥299', 'image': 'main7/wenju2.jpg','description':'这款文具系列以其精致设计和实用性深受用户喜爱。每件文具都经过精心打造，不仅外观时尚，而且功能多样，满足日常学习和办公需求。'},
    {'title': '考试专用笔', 'price': '¥299', 'image': 'main7/wenju3.jpg','description':'这款文具系列以其精致设计和实用性深受用户喜爱。每件文具都经过精心打造，不仅外观时尚，而且功能多样，满足日常学习和办公需求。'},
    {'title': '学生套尺', 'price': '¥299', 'image': 'main7/wenju4.jpg','description':'这款文具系列以其精致设计和实用性深受用户喜爱。每件文具都经过精心打造，不仅外观时尚，而且功能多样，满足日常学习和办公需求。'},
    {'title': '铅笔刀', 'price': '¥299', 'image': 'main7/wenju5.jpg','description':'这款文具系列以其精致设计和实用性深受用户喜爱。每件文具都经过精心打造，不仅外观时尚，而且功能多样，满足日常学习和办公需求。'},
    {'title': '橡皮擦', 'price': '¥299', 'image': 'main7/wenju6.jpg','description':'这款文具系列以其精致设计和实用性深受用户喜爱。每件文具都经过精心打造，不仅外观时尚，而且功能多样，满足日常学习和办公需求。'},
    {'title': '本子', 'price': '¥299', 'image': 'main7/wenju7.jpg','description':'这款文具系列以其精致设计和实用性深受用户喜爱。每件文具都经过精心打造，不仅外观时尚，而且功能多样，满足日常学习和办公需求。'},
    {'title': '订书机', 'price': '¥299', 'image': 'main7/wenju8.jpg','description':'这款文具系列以其精致设计和实用性深受用户喜爱。每件文具都经过精心打造，不仅外观时尚，而且功能多样，满足日常学习和办公需求。'},
    {'title': '笔袋', 'price': '¥299', 'image': 'main7/wenju9.jpg','description':'这款文具系列以其精致设计和实用性深受用户喜爱。每件文具都经过精心打造，不仅外观时尚，而且功能多样，满足日常学习和办公需求。'},
    {'title': '便利贴', 'price': '¥299', 'image': 'main7/wenju10.jpg','description':'这款文具系列以其精致设计和实用性深受用户喜爱。每件文具都经过精心打造，不仅外观时尚，而且功能多样，满足日常学习和办公需求。'},
  ];

  List<Map<String, String>> filteredProducts = [];
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredProducts = List.from(products);
  }

  void searchItems(String query) {
    setState(() {
      filteredProducts = products
          .where((product) => product['title']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('商品清单'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purpleAccent.withOpacity(0.3), Colors.blueAccent.withOpacity(0.3)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  labelText: '搜索商品',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  fillColor: Colors.white.withOpacity(0.9),
                  filled: true,
                ),
                onChanged: searchItems,
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(10),
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
                          builder: (context) => GradientProductDetail(item: filteredProducts[index]),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.85),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)],
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                              child: Image.asset(
                                filteredProducts[index]['image']!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              filteredProducts[index]['title']!,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            filteredProducts[index]['price']!,
                            style: TextStyle(color: Colors.red),
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
      ),
    );
  }
}



class GradientProductDetail extends StatefulWidget {
  final Map<String, String> item;
  GradientProductDetail({required this.item});

  @override
  _CardStyleProductDetailState createState() => _CardStyleProductDetailState();
}
// 商品详情页面的样式类
class _CardStyleProductDetailState extends State<GradientProductDetail> {
  // 当前选择的尺码
  String? currentSize;
  // 当前选择的颜色
  String? currentColor;

  // 构建商品详情页面的UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.item['title']!)),
      body: Column(
        children: [
          Image.asset(widget.item['image']!, width: double.infinity, height: 300),
          _productDetails(),
          _orderActions(),
        ],
      ),
    );
  }

  // 显示商品详细信息的Widget
  Widget _productDetails() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.item['title']!, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Text(widget.item['price']!, style: TextStyle(color: Colors.redAccent, fontSize: 20)),
          // 添加商品详情，灰色小号字体
          Text(widget.item['description']!, style: TextStyle(color: Colors.grey, fontSize: 16)),
        ],
      ),
    );
  }

  // 显示订单操作按钮的Widget
  Widget _orderActions() {
    return Row(
      children: [
        Expanded(child: ElevatedButton(onPressed: () => _openOptionsSheet(context), child: Text('加入购物车'))),
        Expanded(child: ElevatedButton(onPressed: () => _openOptionsSheet(context), child: Text('立即购买'))),
      ],
    );
  }

  // 打开底部选项弹窗
  void _openOptionsSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return _buildOptions();
      },
    );
  }

  // 构建底部弹窗内的选项内容
  Widget _buildOptions() {
    return StatefulBuilder(
      builder: (context, setState) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _colorSelector(setState),
              _bottomButtons(),
            ],
          ),
        );
      },
    );
  }


  Widget _colorSelector(StateSetter setState) {
    final colors = ['白色', '蓝色', '黄色'];
    return Wrap(
      spacing: 8,
      children: colors.map((color) {
        return ChoiceChip(
          label: Text(color),
          selected: currentColor == color,
          onSelected: (selected) {
            setState(() {
              currentColor = selected ? color : null;
            });
          },
        );
      }).toList(),
    );
  }

  Widget _bottomButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: (currentSize != null && currentColor != null) ? () => _finalizeCart(context) : null,
            child: Text('加入购物车'),
          ),
        ),
        Expanded(
          child: ElevatedButton(
            onPressed: (currentSize != null && currentColor != null) ? () => _finalizeBuy(context) : null,
            child: Text('立即购买'),
          ),
        ),
      ],
    );
  }

  void _finalizeCart(BuildContext context) {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('加入购物车成功')));
  }

  void _finalizeBuy(BuildContext context) {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('立即购买成功')));
  }
}

