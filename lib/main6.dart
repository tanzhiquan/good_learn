import 'package:flutter/material.dart';

void main() => runApp(InkStyleApp());
// 定义一个名为InkStyleApp的无状态小部件类
class InkStyleApp extends StatelessWidget {
  // 重写build方法，返回一个MaterialApp实例
  @override
  Widget build(BuildContext context) {
    // 返回MaterialApp，配置应用的基本信息和主题
    return MaterialApp(
      title: '登录',
      home: InkLogin(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// 定义一个名为InkLogin的无状态小部件类，用于登录界面
class InkLogin extends StatelessWidget {
  // 声明用户名和密码的文本控制器
  final TextEditingController inkUser = TextEditingController();
  final TextEditingController inkPass = TextEditingController();

  // 处理登录逻辑的方法
  void handleLogin(BuildContext context) {
    // 如果用户名和密码都为空，则导航到产品页面
    if (inkUser.text == "" && inkPass.text == "") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => InkProduct()));
    } else {
      // 否则，显示SnackBar提示用户名或密码错误
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('用户名或密码错误')),
      );
    }
  }

  // 重写build方法，返回登录界面的布局
  @override
  Widget build(BuildContext context) {
    // 返回Scaffold，配置登录界面的背景、应用栏和主体内容
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('登录'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Container(
          // 设置容器的背景图片
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("main6/sky.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          // 添加内边距
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 用户名输入框
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
                // 密码输入框
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
                // 登录按钮
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
                // 注册按钮，暂未实现功能
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
    {'name': '手机1', 'price': '3456元', 'image': 'main6/phone1.jpg','detail':'iPhone手机以其精致的设计、强大的性能和直观的用户界面而闻名。它搭载了先进的A系列芯片，确保了流畅的操作体验和高效的多任务处理能力。高清视网膜显示屏提供出色的视觉体验，而其摄像头系统则以其卓越的成像质量和多功能摄影模式受到用户喜爱。iPhone还提供了安全的Face ID面部识别技术，以及持续的系统更新和丰富的应用程序生态系统，使其成为日常通讯、娱乐和生产力的强大工具。'},
    {'name': '手机2', 'price': '5678元', 'image': 'main6/phone2.jpg','detail':'iPhone手机以其精致的设计、强大的性能和直观的用户界面而闻名。它搭载了先进的A系列芯片，确保了流畅的操作体验和高效的多任务处理能力。高清视网膜显示屏提供出色的视觉体验，而其摄像头系统则以其卓越的成像质量和多功能摄影模式受到用户喜爱。iPhone还提供了安全的Face ID面部识别技术，以及持续的系统更新和丰富的应用程序生态系统，使其成为日常通讯、娱乐和生产力的强大工具。'},
    {'name': '手机3', 'price': '8910元', 'image': 'main6/phone3.jpg','detail':'iPhone手机以其精致的设计、强大的性能和直观的用户界面而闻名。它搭载了先进的A系列芯片，确保了流畅的操作体验和高效的多任务处理能力。高清视网膜显示屏提供出色的视觉体验，而其摄像头系统则以其卓越的成像质量和多功能摄影模式受到用户喜爱。iPhone还提供了安全的Face ID面部识别技术，以及持续的系统更新和丰富的应用程序生态系统，使其成为日常通讯、娱乐和生产力的强大工具。'},
    {'name': '手机4', 'price': '4321元', 'image': 'main6/phone4.jpg','detail':'iPhone手机以其精致的设计、强大的性能和直观的用户界面而闻名。它搭载了先进的A系列芯片，确保了流畅的操作体验和高效的多任务处理能力。高清视网膜显示屏提供出色的视觉体验，而其摄像头系统则以其卓越的成像质量和多功能摄影模式受到用户喜爱。iPhone还提供了安全的Face ID面部识别技术，以及持续的系统更新和丰富的应用程序生态系统，使其成为日常通讯、娱乐和生产力的强大工具。'},
    {'name': '手机5', 'price': '6789元', 'image': 'main6/phone5.jpg','detail':'iPhone手机以其精致的设计、强大的性能和直观的用户界面而闻名。它搭载了先进的A系列芯片，确保了流畅的操作体验和高效的多任务处理能力。高清视网膜显示屏提供出色的视觉体验，而其摄像头系统则以其卓越的成像质量和多功能摄影模式受到用户喜爱。iPhone还提供了安全的Face ID面部识别技术，以及持续的系统更新和丰富的应用程序生态系统，使其成为日常通讯、娱乐和生产力的强大工具。'},
    {'name': '手机6', 'price': '7654元', 'image': 'main6/phone6.jpg','detail':'iPhone手机以其精致的设计、强大的性能和直观的用户界面而闻名。它搭载了先进的A系列芯片，确保了流畅的操作体验和高效的多任务处理能力。高清视网膜显示屏提供出色的视觉体验，而其摄像头系统则以其卓越的成像质量和多功能摄影模式受到用户喜爱。iPhone还提供了安全的Face ID面部识别技术，以及持续的系统更新和丰富的应用程序生态系统，使其成为日常通讯、娱乐和生产力的强大工具。'},
    {'name': '手机7', 'price': '9876元', 'image': 'main6/phone7.jpg','detail':'iPhone手机以其精致的设计、强大的性能和直观的用户界面而闻名。它搭载了先进的A系列芯片，确保了流畅的操作体验和高效的多任务处理能力。高清视网膜显示屏提供出色的视觉体验，而其摄像头系统则以其卓越的成像质量和多功能摄影模式受到用户喜爱。iPhone还提供了安全的Face ID面部识别技术，以及持续的系统更新和丰富的应用程序生态系统，使其成为日常通讯、娱乐和生产力的强大工具。'},
    {'name': '手机8', 'price': '5432元', 'image': 'main6/phone8.jpg','detail':'iPhone手机以其精致的设计、强大的性能和直观的用户界面而闻名。它搭载了先进的A系列芯片，确保了流畅的操作体验和高效的多任务处理能力。高清视网膜显示屏提供出色的视觉体验，而其摄像头系统则以其卓越的成像质量和多功能摄影模式受到用户喜爱。iPhone还提供了安全的Face ID面部识别技术，以及持续的系统更新和丰富的应用程序生态系统，使其成为日常通讯、娱乐和生产力的强大工具。'},
    {'name': '手机9', 'price': '8765元', 'image': 'main6/phone9.jpg','detail':'iPhone手机以其精致的设计、强大的性能和直观的用户界面而闻名。它搭载了先进的A系列芯片，确保了流畅的操作体验和高效的多任务处理能力。高清视网膜显示屏提供出色的视觉体验，而其摄像头系统则以其卓越的成像质量和多功能摄影模式受到用户喜爱。iPhone还提供了安全的Face ID面部识别技术，以及持续的系统更新和丰富的应用程序生态系统，使其成为日常通讯、娱乐和生产力的强大工具。'},
    {'name': '手机0', 'price': '4567元', 'image': 'main6/phone10.jpg','detail':'iPhone手机以其精致的设计、强大的性能和直观的用户界面而闻名。它搭载了先进的A系列芯片，确保了流畅的操作体验和高效的多任务处理能力。高清视网膜显示屏提供出色的视觉体验，而其摄像头系统则以其卓越的成像质量和多功能摄影模式受到用户喜爱。iPhone还提供了安全的Face ID面部识别技术，以及持续的系统更新和丰富的应用程序生态系统，使其成为日常通讯、娱乐和生产力的强大工具。'},
    {'name': '手机1', 'price': '7890元', 'image': 'main6/phone11.jpg','detail':'iPhone手机以其精致的设计、强大的性能和直观的用户界面而闻名。它搭载了先进的A系列芯片，确保了流畅的操作体验和高效的多任务处理能力。高清视网膜显示屏提供出色的视觉体验，而其摄像头系统则以其卓越的成像质量和多功能摄影模式受到用户喜爱。iPhone还提供了安全的Face ID面部识别技术，以及持续的系统更新和丰富的应用程序生态系统，使其成为日常通讯、娱乐和生产力的强大工具。'},
    {'name': '手机2', 'price': '6543元', 'image': 'main6/phone12.jpg','detail':'iPhone手机以其精致的设计、强大的性能和直观的用户界面而闻名。它搭载了先进的A系列芯片，确保了流畅的操作体验和高效的多任务处理能力。高清视网膜显示屏提供出色的视觉体验，而其摄像头系统则以其卓越的成像质量和多功能摄影模式受到用户喜爱。iPhone还提供了安全的Face ID面部识别技术，以及持续的系统更新和丰富的应用程序生态系统，使其成为日常通讯、娱乐和生产力的强大工具。'},
    {'name': '手机3', 'price': '9012元', 'image': 'main6/phone13.jpg','detail':'iPhone手机以其精致的设计、强大的性能和直观的用户界面而闻名。它搭载了先进的A系列芯片，确保了流畅的操作体验和高效的多任务处理能力。高清视网膜显示屏提供出色的视觉体验，而其摄像头系统则以其卓越的成像质量和多功能摄影模式受到用户喜爱。iPhone还提供了安全的Face ID面部识别技术，以及持续的系统更新和丰富的应用程序生态系统，使其成为日常通讯、娱乐和生产力的强大工具。'},
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
        title: const Text('手机列表', style: TextStyle(color: Colors.white)),
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


class CartoonProductDetail extends StatefulWidget {
  final Map<String, String> item;
  CartoonProductDetail({required this.item});

  @override
  _CartoonProductDetailState createState() => _CartoonProductDetailState();
}

class _CartoonProductDetailState extends State<CartoonProductDetail> {
  String? chosenSize;
  String? chosenColor;
  final List<String> sizes = ['8G', '16G', '32G'];
  final List<String> yunyingshang = ['移动', '电信', '联通'];

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
        Text('选择内存', style: TextStyle(fontSize: 18)),
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
        Text('选择运营商', style: TextStyle(fontSize: 18)),
        Wrap(
          spacing: 8,
          children: yunyingshang.map((aa) {
            return ChoiceChip(
              label: Text(aa),
              selectedColor: Colors.blueAccent,
              selected: chosenColor == aa,
              onSelected: (bool selected) {
                setState(() {
                  chosenColor = selected ? aa : null;
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
