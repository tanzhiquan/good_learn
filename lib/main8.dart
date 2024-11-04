import 'package:flutter/material.dart';

void main() => runApp(MinimalApp());

class MinimalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '登陆',
      home: _MinimalLogin(),
      debugShowCheckedModeBanner: false,
    );
  }
}
// 忽略必须是不可变的警告，因为这个类需要处理状态变化
// ignore: must_be_immutable
class _MinimalLogin extends StatelessWidget {
  // 文本控制器，用于获取用户输入的用户名和密码
  final TextEditingController userCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();

  // 用户名和密码变量，初始化为空字符串
  late Object user = "";
  late Object pass = "";

  /**
   * 登录方法
   * 检查用户输入的用户名和密码是否与存储的值匹配
   * 如果匹配，则导航到ProList页面，否则显示登录错误的SnackBar
   */
  void signIn(BuildContext context) {
    if (userCtrl.text == user && passCtrl.text == pass) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ProList()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('登陆错误')),
      );
    }
  }

  /**
   * 注册方法
   * 获取用户的输入，并将其存储在全局变量中
   * 然后显示一个弹窗，提示用户输入的信息
   */
  void register(BuildContext context) {
    // 获取用户的输入，并将其存储在全局变量中
    user = userCtrl.text;
    pass = passCtrl.text;
    // 显示弹窗提示用户输入的信息
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('注册信息'),
          content: Text('用户名: $user\n密码: $pass'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // 关闭弹窗
              },
              child: const Text('关闭'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('登陆'),
        backgroundColor: Colors.black87,
        actions: [
          IconButton(
            icon: const Icon(Icons.support, color: Colors.white),
            // 改为文字 “ 客服”，不要icon
            tooltip: '客服',
            onPressed: () {
              // Your customer service action here
            },
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "main8/sea.jpg",
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Flex(
              direction: Axis.vertical,
              children: [
                const SizedBox(height: 100),
                const Text(
                  '欢迎回来!',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 40),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: userCtrl,
                        decoration: InputDecoration(
                          labelText: '用户名',
                          labelStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.black54,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: passCtrl,
                        decoration: InputDecoration(
                          labelText: '密码',
                          labelStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.black54,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {

                            },
                            child: const Text('忘记密码?',
                                style: TextStyle(color: Colors.white)),
                          ),
                          TextButton(
                            onPressed: () => register(context),
                            child: const Text('注册',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () => signIn(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('登陆', style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProList extends StatefulWidget {
  const ProList({super.key});

  @override
  _ProListState createState() => _ProListState();
}

class _ProListState extends State<ProList> {
  final List<Map<String, String>> inventory = [
    {'product': '鞋子', 'cost': '¥199', 'oldcost': '¥299', 'img': 'main8/xiezi1.jpg', 'desc': '这款鞋子采用优质材料制作，设计时尚，舒适合脚。其耐磨鞋底和透气鞋面提供了良好的支撑和透气性，适合日常穿着和各种户外活动。流线型设计不仅美观，还能减少运动阻力，提升穿着体验。无论是休闲出行还是运动健身，都是理想的选择。'},
    {'product': '鞋子', 'cost': '¥199', 'oldcost': '¥299', 'img': 'main8/xiezi3.jpg', 'desc': '这款鞋子采用优质材料制作，设计时尚，舒适合脚。其耐磨鞋底和透气鞋面提供了良好的支撑和透气性，适合日常穿着和各种户外活动。流线型设计不仅美观，还能减少运动阻力，提升穿着体验。无论是休闲出行还是运动健身，都是理想的选择。'},
    {'product': '鞋子', 'cost': '¥199', 'oldcost': '¥299', 'img': 'main8/xiezi4.jpg', 'desc': '这款鞋子采用优质材料制作，设计时尚，舒适合脚。其耐磨鞋底和透气鞋面提供了良好的支撑和透气性，适合日常穿着和各种户外活动。流线型设计不仅美观，还能减少运动阻力，提升穿着体验。无论是休闲出行还是运动健身，都是理想的选择。'},
    {'product': '鞋子', 'cost': '¥199', 'oldcost': '¥299', 'img': 'main8/xiezi5.jpg', 'desc': '这款鞋子采用优质材料制作，设计时尚，舒适合脚。其耐磨鞋底和透气鞋面提供了良好的支撑和透气性，适合日常穿着和各种户外活动。流线型设计不仅美观，还能减少运动阻力，提升穿着体验。无论是休闲出行还是运动健身，都是理想的选择。'},
    {'product': '鞋子', 'cost': '¥199', 'oldcost': '¥299', 'img': 'main8/xiezi6.jpg', 'desc': '这款鞋子采用优质材料制作，设计时尚，舒适合脚。其耐磨鞋底和透气鞋面提供了良好的支撑和透气性，适合日常穿着和各种户外活动。流线型设计不仅美观，还能减少运动阻力，提升穿着体验。无论是休闲出行还是运动健身，都是理想的选择。'},
    {'product': '鞋子', 'cost': '¥199', 'oldcost': '¥299', 'img': 'main8/xiezi7.jpg', 'desc': '这款鞋子采用优质材料制作，设计时尚，舒适合脚。其耐磨鞋底和透气鞋面提供了良好的支撑和透气性，适合日常穿着和各种户外活动。流线型设计不仅美观，还能减少运动阻力，提升穿着体验。无论是休闲出行还是运动健身，都是理想的选择。'},
    {'product': '鞋子', 'cost': '¥199', 'oldcost': '¥299', 'img': 'main8/xiezi8.jpg', 'desc': '这款鞋子采用优质材料制作，设计时尚，舒适合脚。其耐磨鞋底和透气鞋面提供了良好的支撑和透气性，适合日常穿着和各种户外活动。流线型设计不仅美观，还能减少运动阻力，提升穿着体验。无论是休闲出行还是运动健身，都是理想的选择。'},
    {'product': '鞋子', 'cost': '¥199', 'oldcost': '¥299', 'img': 'main8/xiezi9.jpg', 'desc': '这款鞋子采用优质材料制作，设计时尚，舒适合脚。其耐磨鞋底和透气鞋面提供了良好的支撑和透气性，适合日常穿着和各种户外活动。流线型设计不仅美观，还能减少运动阻力，提升穿着体验。无论是休闲出行还是运动健身，都是理想的选择。'},
  ];

  List<Map<String, String>> shownItems = [];
  final TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    shownItems = List.from(inventory);
  }

  void filterList(String input) {
    setState(() {
      shownItems = inventory
          .where((item) =>
              item['product']!.toLowerCase().contains(input.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('商品陈列'),
        backgroundColor: Colors.grey.shade800,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                hintText: '搜索产品',
                prefixIcon: Icon(Icons.search, color: Colors.grey.shade600),
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: filterList,
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 0.8,
              ),
              itemCount: shownItems.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MinimalProductDetail(item: shownItems[index]),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Image.asset(
                              shownItems[index]['img']!,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(
                            shownItems[index]['product']!,
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                        Text(
                          shownItems[index]['cost']!,
                          style: TextStyle(color: Colors.blue.shade700),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(
                            '${shownItems[index]['oldcost']!} ',
                            // 删除字体
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey.shade600),
                          ),
                        )
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


class MinimalProductDetail extends StatefulWidget {
  final Map<String, String> item;
  MinimalProductDetail({required this.item});

  @override
  _CardStyleProductDetailState createState() => _CardStyleProductDetailState();
}

class _CardStyleProductDetailState extends State<MinimalProductDetail> {
  String? selectedSize;
  String? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.item['product']!)),
      body: Column(
        children: [
          Image.asset(widget.item['img']!, width: double.infinity, height: 300),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.item['product']!,
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Text(widget.item['cost']!,
                    style: TextStyle(color: Colors.redAccent, fontSize: 20)),
                Text(widget.item['desc']!, style: TextStyle(fontSize: 16)),
                SizedBox(height: 16),
                _buildPurchaseButtons(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPurchaseButtons() {
    return Row(
      children: [
        Expanded(
            child: ElevatedButton(
                onPressed: () => _openOptionSelector(context),
                child: Text('加入购物车'))),
        SizedBox(width: 8),
        Expanded(
            child: ElevatedButton(
                onPressed: () => _openOptionSelector(context),
                child: Text('立即购买'))),
      ],
    );
  }

  void _openOptionSelector(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => _optionSelector(),
    );
  }

  Widget _optionSelector() {
    return StatefulBuilder(
      builder: (context, setState) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSizeOptions(setState),
              SizedBox(height: 16),
              _buildColorOptions(setState),
              SizedBox(height: 16),
              _buildFinalButtons(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSizeOptions(StateSetter setState) {
    final sizes = ['37码', '38码', '39码'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('选择尺寸', style: TextStyle(fontSize: 18)),
        Wrap(
          spacing: 8,
          children: sizes.map((size) {
            return ChoiceChip(
              label: Text(size),
              selected: selectedSize == size,
              onSelected: (selected) {
                setState(() => selectedSize = selected ? size : null);
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildColorOptions(StateSetter setState) {
    final colors = ['白色', '黑色'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('选择颜色', style: TextStyle(fontSize: 18)),
        Wrap(
          spacing: 8,
          children: colors.map((color) {
            return ChoiceChip(
              label: Text(color),
              selected: selectedColor == color,
              onSelected: (selected) {
                setState(() => selectedColor = selected ? color : null);
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildFinalButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: (selectedSize != null && selectedColor != null)
                ? _confirmAddToCart
                : null,
            child: Text('加入购物车'),
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: ElevatedButton(
            onPressed: (selectedSize != null && selectedColor != null)
                ? _confirmBuyNow
                : null,
            child: Text('立即购买'),
          ),
        ),
      ],
    );
  }

  void _confirmAddToCart() {
    Navigator.pop(context);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('已将商品加入购物车')));
  }

  void _confirmBuyNow() {
    Navigator.pop(context);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('立即购买成功')));
  }
}
