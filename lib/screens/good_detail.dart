import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  final Map<String, String> product;

  ProductDetailPage({required this.product});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  String? selectedColor;
  String? selectedSize;

  final List<String> colors = ['红色', '蓝色', '黑色', '白色'];
  final List<String> sizes = ['S', 'M', 'L', 'XL'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.product['name']!)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(widget.product['image']!,
                fit: BoxFit.cover, width: double.infinity, height: 300),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.product['name']!,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text(widget.product['price']!,
                      style: const TextStyle(color: Colors.red, fontSize: 20)),
                  SizedBox(height: 16),
                  Text('商品描述',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text(
                      '这是一个高品质的${widget.product['name']}，采用优质材料制作，舒适耐穿。适合各种场合穿着，是您的理想选择。'),
                  SizedBox(height: 16),
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ElevatedButton(
                            onPressed: () => _showSelectionBottomSheet(context),
                            child: const Text('选择颜色和尺寸'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSelectionBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.9
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('选择颜色',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: colors
                        .map((color) => ChoiceChip(
                              label: Text(color),
                              selected: selectedColor == color,
                              onSelected: (selected) {
                                setState(() {
                                  selectedColor = selected ? color : null;
                                });
                              },
                            ))
                        .toList(),
                  ),
                  SizedBox(height: 16),
                  Text('选择尺寸',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: sizes
                        .map((size) => ChoiceChip(
                              label: Text(size),
                              selected: selectedSize == size,
                              onSelected: (selected) {
                                setState(() {
                                  selectedSize = selected ? size : null;
                                });
                              },
                            ))
                        .toList(),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: (selectedColor != null && selectedSize != null)
                        ? () {
                            Navigator.pop(context);
                            _addToCart(context);
                          }
                        : null,
                    child: Text('加入购物车'),
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
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            '已将 ${widget.product['name']} ($selectedColor, $selectedSize) 加入购物车'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
