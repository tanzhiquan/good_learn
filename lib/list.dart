import 'package:flutter/material.dart';
// import 'package:helloworld/widgets/theme_switcher.dart';

void main() => runApp(RecipeApp());

class RecipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '菜谱管理',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RecipeHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Recipe {
  final String id;
  String name;
  String category;
  String description;
  String ingredients;
  String steps;
  double rating;
  int favorites;
  List<String> comments;
  String image;

  Recipe({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.ingredients,
    required this.steps,
    this.rating = 0.0,
    this.favorites = 0,
    List<String>? comments,
    required this.image,
  }) : comments = comments ?? [];
}

class RecipeManager {
  List<Recipe> _recipes = [];
  List<Recipe> get recipes => _recipes;

  void addRecipe(Recipe recipe) {
    _recipes.add(recipe);
  }

  void removeRecipe(String id) {
    _recipes.removeWhere((recipe) => recipe.id == id);
  }

  void updateRecipe(Recipe recipe) {
    final index = _recipes.indexWhere((r) => r.id == recipe.id);
    if (index != -1) {
      _recipes[index] = recipe;
    }
  }

  List<Recipe> searchRecipes(String query) {
    return _recipes.where((recipe) => 
      recipe.name.toLowerCase().contains(query.toLowerCase())).toList();
  }

  List<Recipe> getRecipesByCategory(String category) {
    return _recipes.where((recipe) => recipe.category == category).toList();
  }

  void toggleFavorite(String id) {
    final recipe = _recipes.firstWhere((r) => r.id == id);
    recipe.favorites = recipe.favorites == 0 ? 1 : 0;
  }
}

class RecipeHomePage extends StatefulWidget {
  @override
  _RecipeHomePageState createState() => _RecipeHomePageState();
}

class _RecipeHomePageState extends State<RecipeHomePage> {
  final RecipeManager _recipeManager = RecipeManager();
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = '全部';
  List<String> categories = ['全部', '川菜', '粤菜', '苏菜', '浙菜', '闽菜'];

  @override
  void initState() {
    super.initState();
    _initializeDemoRecipes();
  }

  void _initializeDemoRecipes() {
    final demoRecipes = [
      Recipe(
        id: '1',
        name: '麻婆豆腐',
        category: '川菜',
        description: '麻婆豆腐是四川传统名菜，由豆腐、肉末、豆瓣酱等烹制而成，麻辣鲜香。',
        ingredients: '''
- 嫩豆腐 400g
- 猪肉末 200g
- 郫县豆瓣酱 2勺
- 花椒粉 适量
- 辣椒面 适量
- 葱花 适量
- 蒜末 适量
- 生抽 适量
- 盐 适量''',
        steps: '''
1. 豆腐切块，放入热水中焯烫
2. 锅中放油，爆香蒜末
3. 加入肉末翻炒
4. 加入豆瓣酱炒出红油
5. 加入豆腐块，翻炒均匀
6. 加入适量水，大火烧开
7. 加入调味料，收汁
8. 撒上花椒粉和葱花即可''',
        rating: 4.8,
        favorites: 1,
        image: 'https://img.zcool.cn/community/01a0bc5c8656bea801208f8b3c3db9.jpg',
        comments: ['太好吃了！', '正宗川菜味道'],
      ),
      Recipe(
        id: '2',
        name: '白切鸡',
        category: '粤菜',
        description: '白切鸡是一道广东名菜，以鸡肉鲜嫩著称，配以姜葱酱最为经典。',
        ingredients: '''
- 整鸡 1只
- 姜片 适量
- 葱段 适量
- 盐 适量
- 料酒 适量''',
        steps: '''
1. 鸡洗净，腹腔内塞入姜片和葱段
2. 锅中加水，放入姜片和葱段
3. 水开后放入整鸡
4. 煮至鸡肉熟透
5. 取出放入冰水中浸泡
6. 切块装盘，配以姜葱酱''',
        rating: 4.5,
        favorites: 0,
        image: 'https://img.zcool.cn/community/01639b5c8656bea801208f8b9cf0aa.jpg',
        comments: ['简单又美味'],
      ),
      Recipe(
        id: '3',
        name: '红烧狮子头',
        category: '苏菜',
        description: '红烧狮子头是江苏名菜，大块鲜嫩的肉丸子，口感细腻，味道浓郁。',
        ingredients: '''
- 猪肉馅 500g
- 冬笋 100g
- 香菇 50g
- 葱姜蒜 适量
- 料酒 适量
- 生抽 适量
- 老抽 适量
- 白胡椒粉 适量''',
        steps: '''
1. 肉馅加入调料搅拌均匀
2. 揉成大肉丸
3. 锅中放油煎至表面金黄
4. 加入调味料和适量水
5. 炖煮40分钟
6. 收汁即可''',
        rating: 4.6,
        favorites: 1,
        image: 'https://img.zcool.cn/community/016c5e5c8656bea801208f8b0697ee.jpg',
        comments: ['非常好吃', '肉质很嫩'],
      ),
      Recipe(
        id: '4',
        name: '西湖醋鱼',
        category: '浙菜',
        description: '西湖醋鱼是杭州名菜，以草鱼为主料，口感酸甜适中，肉质鲜美。',
        ingredients: '''
- 草鱼 1条
- 醋 适量
- 糖 适量
- 葱姜 适量
- 料酒 适量
- 生抽 适量''',
        steps: '''
1. 鱼洗净，斜刀切花
2. 锅中放油，将鱼煎至两面金黄
3. 加入调味料
4. 大火收汁
5. 淋上热油即可''',
        rating: 4.7,
        favorites: 0,
        image: 'https://img.zcool.cn/community/01f1ac5c8656bea801208f8b683473.jpg',
        comments: ['经典杭帮菜'],
      ),
      Recipe(
        id: '5',
        name: '佛跳墙',
        category: '闽菜',
        description: '佛跳墙是福建名菜，由多种山珍海味烹制而成，营养丰富，味道鲜美。',
        ingredients: '''
- 鱼翅 100g
- 鲍鱼 200g
- 海参 100g
- 花胶 50g
- 瑶柱 30g
- 香菇 50g
- 火腿 50g
- 料酒 适量
- 生抽 适量''',
        steps: '''
1. 各种食材分别处理备用
2. 砂锅中依次放入食材
3. 加入调味料和高汤
4. 小火炖煮3小时
5. 撒上葱花即可''',
        rating: 4.9,
        favorites: 1,
        image: 'https://img.zcool.cn/community/01f9575c8656bea801208f8b947d01.jpg',
        comments: ['太奢侈了', '味道确实一流'],
      ),
    ];

    for (var recipe in demoRecipes) {
      _recipeManager.addRecipe(recipe);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          '美食菜谱',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          // ThemeSwitcher(),
          IconButton(
            icon: Icon(Icons.sort, color: Colors.black87),
            onPressed: _showSortOptions,
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                // 搜索框
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: '搜索菜谱',
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    onChanged: (value) => setState(() {}),
                  ),
                ),
                SizedBox(height: 16),
                // 分类选项
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: categories.map((category) {
                      bool isSelected = _selectedCategory == category;
                      return Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: InkWell(
                          onTap: () => setState(() => _selectedCategory = category),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: isSelected ? Colors.green : Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: isSelected ? Colors.green : Colors.grey[300]!,
                              ),
                            ),
                            child: Text(
                              category,
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.black87,
                                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          // 菜谱列表
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: _getFilteredRecipes().length,
              itemBuilder: (context, index) {
                final recipe = _getFilteredRecipes()[index];
                return RecipeCard(
                  recipe: recipe,
                  onTap: () => _showRecipeDetail(recipe),
                  onFavorite: () => setState(() => _recipeManager.toggleFavorite(recipe.id)),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showAddRecipe,
        icon: const Icon(Icons.add),
        label: const Text('添加菜谱'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _showSortOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.sort_by_alpha),
              title: Text('按名称排序'),
              onTap: () {
                setState(() {
                  _recipeManager.recipes.sort((a, b) => a.name.compareTo(b.name));
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('按评分排序'),
              onTap: () {
                setState(() {
                  _recipeManager.recipes.sort((a, b) => b.rating.compareTo(a.rating));
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _showFilterOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: categories.map((category) {
            return ListTile(
              title: Text(category),
              onTap: () {
                setState(() {
                  _selectedCategory = category;
                });
                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      },
    );
  }

  void _showAddRecipe() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecipeEditPage(
          recipeManager: _recipeManager,
        ),
      ),
    );
  }

  void _showRecipeDetail(Recipe recipe) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecipeDetailPage(
          recipe: recipe,
          recipeManager: _recipeManager,
        ),
      ),
    );
  }

  List<Recipe> _getFilteredRecipes() {
    var recipes = _recipeManager.recipes;
    
    // 搜索过滤
    if (_searchController.text.isNotEmpty) {
      recipes = recipes.where((recipe) =>
        recipe.name.toLowerCase().contains(_searchController.text.toLowerCase())).toList();
    }
    
    // 分类过滤
    if (_selectedCategory != '全部') {
      recipes = recipes.where((recipe) => recipe.category == _selectedCategory).toList();
    }
    
    return recipes;
  }
}

// 更新菜谱卡片设计
class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  final VoidCallback onTap;
  final VoidCallback onFavorite;

  RecipeCard({
    required this.recipe,
    required this.onTap,
    required this.onFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.network(
                recipe.image,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          recipe.name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          recipe.favorites > 0 ? Icons.favorite : Icons.favorite_border,
                          color: recipe.favorites > 0 ? Colors.red : Colors.grey,
                        ),
                        onPressed: onFavorite,
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    recipe.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.green[50],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          recipe.category,
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      SizedBox(width: 4),
                      Text(
                        recipe.rating.toStringAsFixed(1),
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
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
}

// 添加菜谱详情页
class RecipeDetailPage extends StatefulWidget {
  final Recipe recipe;
  final RecipeManager recipeManager;

  RecipeDetailPage({
    required this.recipe,
    required this.recipeManager,
  });

  @override
  _RecipeDetailPageState createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage> {
  final TextEditingController _commentController = TextEditingController();
  double _userRating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // 顶部图片和应用栏
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: 'recipe-${widget.recipe.id}',
                child: Image.network(
                  widget.recipe.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            leading: CircleAvatar(
              backgroundColor: Colors.black26,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            actions: [
              CircleAvatar(
                backgroundColor: Colors.black26,
                child: IconButton(
                  icon: Icon(
                    widget.recipe.favorites > 0 
                        ? Icons.favorite 
                        : Icons.favorite_border,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      widget.recipeManager.toggleFavorite(widget.recipe.id);
                    });
                  },
                ),
              ),
              SizedBox(width: 8),
              CircleAvatar(
                backgroundColor: Colors.black26,
                child: IconButton(
                  icon: Icon(Icons.share, color: Colors.white),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('分享功能开发中')),
                    );
                  },
                ),
              ),
              SizedBox(width: 16),
            ],
          ),
          // 内容区域
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 标题和分类
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              widget.recipe.name,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green[50],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              widget.recipe.category,
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      // 评分和收藏
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber),
                          SizedBox(width: 4),
                          Text(
                            widget.recipe.rating.toStringAsFixed(1),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 16),
                          Icon(Icons.favorite, color: Colors.red),
                          SizedBox(width: 4),
                          Text(
                            '${widget.recipe.favorites}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      // 描述
                      Text(
                        '简介',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        widget.recipe.description,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                          height: 1.5,
                        ),
                      ),
                      SizedBox(height: 24),
                      // 食材
                      _buildSection(
                        title: '食材',
                        icon: Icons.restaurant,
                        content: widget.recipe.ingredients,
                      ),
                      SizedBox(height: 24),
                      // 步骤
                      _buildSection(
                        title: '步骤',
                        icon: Icons.format_list_numbered,
                        content: widget.recipe.steps,
                      ),
                      SizedBox(height: 24),
                      // 评分区域
                      Text(
                        '为这道菜评分',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: List.generate(5, (index) {
                          return IconButton(
                            icon: Icon(
                              index < _userRating
                                  ? Icons.star
                                  : Icons.star_border,
                              color: Colors.amber,
                              size: 32,
                            ),
                            onPressed: () {
                              setState(() {
                                _userRating = index + 1;
                                widget.recipe.rating = 
                                    (_userRating + widget.recipe.rating) / 2;
                              });
                            },
                          );
                        }),
                      ),
                      SizedBox(height: 24),
                      // 评论区域
                      Text(
                        '评论',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      // 评论列表
                      ...widget.recipe.comments.map((comment) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 12),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            comment,
                            style: TextStyle(fontSize: 16),
                          ),
                        );
                      }).toList(),
                      // 添加评论
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _commentController,
                              decoration: InputDecoration(
                                hintText: '添加评论...',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          IconButton(
                            icon: Icon(Icons.send, color: Colors.green),
                            onPressed: () {
                              if (_commentController.text.isNotEmpty) {
                                setState(() {
                                  widget.recipe.comments
                                      .add(_commentController.text);
                                  _commentController.clear();
                                });
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showEditRecipe(context),
        icon: Icon(Icons.edit),
        label: Text('编辑菜谱'),
        backgroundColor: Colors.green,
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required String content,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.green),
            SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            content,
            style: TextStyle(
              fontSize: 16,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }

  void _showEditRecipe(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecipeEditPage(
          recipe: widget.recipe,
          recipeManager: widget.recipeManager,
        ),
      ),
    );
  }
}

// 添加编辑菜谱页面
class RecipeEditPage extends StatefulWidget {
  final Recipe? recipe;
  final RecipeManager recipeManager;

  const RecipeEditPage({
    this.recipe,
    required this.recipeManager,
  });

  @override
  // ignore: library_private_types_in_public_api
  _RecipeEditPageState createState() => _RecipeEditPageState();
}

class _RecipeEditPageState extends State<RecipeEditPage> {
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _ingredientsController;
  late TextEditingController _stepsController;
  String _selectedCategory = '川菜';
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.recipe?.name ?? '');
    _descriptionController = TextEditingController(text: widget.recipe?.description ?? '');
    _ingredientsController = TextEditingController(text: widget.recipe?.ingredients ?? '');
    _stepsController = TextEditingController(text: widget.recipe?.steps ?? '');
    _selectedCategory = widget.recipe?.category ?? '川菜';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          widget.recipe == null ? '新建菜谱' : '编辑菜谱',
          style: TextStyle(color: Colors.black87),
        ),
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          TextButton.icon(
            onPressed: _saveRecipe,
            icon: Icon(Icons.save),
            label: Text('保存'),
            style: TextButton.styleFrom(
              foregroundColor: Colors.green, textStyle: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(width: 8),
        ],
      ),
      body: Stack(
        children: [
          Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                _buildCard(
                  title: '基本信息',
                  child: Column(
                    children: [
                      _buildTextFormField(
                        controller: _nameController,
                        label: '菜品名称',
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return '请输入菜品名称';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      _buildDropdownButton(),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                _buildCard(
                  title: '菜品描述',
                  child: _buildTextFormField(
                    controller: _descriptionController,
                    label: '简要描述这道菜',
                    maxLines: 3,
                  ),
                ),
                SizedBox(height: 16),
                _buildCard(
                  title: '食材清单',
                  child: _buildTextFormField(
                    controller: _ingredientsController,
                    label: '输入所需食材（每行一个）',
                    maxLines: 5,
                    helperText: '例如：\n- 豆腐 400g\n- 猪肉末 200g',
                  ),
                ),
                SizedBox(height: 16),
                _buildCard(
                  title: '烹饪步骤',
                  child: _buildTextFormField(
                    controller: _stepsController,
                    label: '详细的烹饪步骤（每步一行）',
                    maxLines: 8,
                    helperText: '例如：\n1. 豆腐切块\n2. 热锅下油',
                  ),
                ),
                SizedBox(height: 100), // 底部留白，防止被FAB遮挡
              ],
            ),
          ),
          if (_isLoading)
            Container(
              color: Colors.black26,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCard({required String title, required Widget child}) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String label,
    int maxLines = 1,
    String? helperText,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        helperText: helperText,
        helperMaxLines: 5,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.green),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      validator: validator,
    );
  }

  Widget _buildDropdownButton() {
    return DropdownButtonFormField<String>(
      value: _selectedCategory,
      decoration: InputDecoration(
        labelText: '菜品分类',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.green),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      items: ['川菜', '粤菜', '苏菜', '浙菜', '闽菜']
          .map((category) => DropdownMenuItem(
                value: category,
                child: Text(category),
              ))
          .toList(),
      onChanged: (value) {
        setState(() {
          _selectedCategory = value!;
        });
      },
    );
  }

  Future<void> _saveRecipe() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _isLoading = true);

    try {
      final recipe = Recipe(
        id: widget.recipe?.id ?? DateTime.now().toString(),
        name: _nameController.text,
        category: _selectedCategory,
        description: _descriptionController.text,
        ingredients: _ingredientsController.text,
        steps: _stepsController.text,
        image: widget.recipe?.image ?? 'https://via.placeholder.com/400x300',
        rating: widget.recipe?.rating ?? 0.0,
        favorites: widget.recipe?.favorites ?? 0,
      );

      if (widget.recipe == null) {
        widget.recipeManager.addRecipe(recipe);
      } else {
        widget.recipeManager.updateRecipe(recipe);
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('菜谱保存成功'),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('保存失败：$e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _ingredientsController.dispose();
    _stepsController.dispose();
    super.dispose();
  }
}
