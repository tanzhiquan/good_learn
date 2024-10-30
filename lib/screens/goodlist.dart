import 'package:flutter/material.dart';
import 'good_detail.dart';

class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final List<Map<String, String>> _allProducts = [
    {'name': '旗舰手机', 'price': '¥789', 'image': 'assets/phone.jpg'},
    {'name': '苹果', 'price': '¥100', 'image': 'assets/apple.jpg'},
    // 其他商品...
  ];

  List<Map<String, String>> _displayedProducts = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _displayedProducts = List.from(_allProducts);
  }

  void _searchProducts(String query) {
    setState(() {
      _displayedProducts = _allProducts
          .where((product) =>
              product['name']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('商品陈列'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0), // 修改padding值使搜索框变小
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: '搜索商品',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () => _searchProducts(_searchController.text),
                ),
                border: OutlineInputBorder(),
              ),
              onChanged: _searchProducts,
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: _displayedProducts.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(
                            product: _displayedProducts[index]),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 4, // 阴影效果
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // 圆角
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                            child: Image.asset(
                              _displayedProducts[index]['image']!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _displayedProducts[index]['name']!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 4), // 添加间距
                              Text(
                                _displayedProducts[index]['price']!,
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 14,
                                ),
                              ),
                            ],
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
