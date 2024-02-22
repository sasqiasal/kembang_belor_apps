import 'package:flutter/material.dart';
import 'package:kembang_belor_apps/pages/home_page.dart';
import 'package:kembang_belor_apps/pages/news_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _pages = [HomePage(), NewsPage()];

  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'News',
          )
        ],
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
      ),
    );
  }
}
