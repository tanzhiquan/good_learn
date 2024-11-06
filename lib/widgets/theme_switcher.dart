import 'package:flutter/material.dart';
import 'package:helloworld/providers/theme_provider.dart';
import 'package:provider/provider.dart';
// import 'theme_provider.dart'; // 注释掉不存在的文件引用

class ThemeSwitcher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return PopupMenuButton<ThemeMode>(
          icon: Icon(
            themeProvider.themeMode == ThemeMode.system
                ? Icons.brightness_auto
                : themeProvider.isDarkMode
                    ? Icons.dark_mode
                    : Icons.light_mode,
          ),
          onSelected: themeProvider.setThemeMode,
          itemBuilder: (context) => [
            PopupMenuItem(
              value: ThemeMode.system,
              child: ListTile(
                leading: Icon(Icons.brightness_auto),
                title: Text('跟随系统'),
              ),
            ),
            PopupMenuItem(
              value: ThemeMode.light,
              child: ListTile(
                leading: Icon(Icons.light_mode),
                title: Text('浅色模式'),
              ),
            ),
            PopupMenuItem(
              value: ThemeMode.dark,
              child: ListTile(
                leading: Icon(Icons.dark_mode),
                title: Text('深色模式'),
              ),
            ),
          ],
        );
      },
    );
  }
} 