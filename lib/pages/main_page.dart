import 'package:flutter/material.dart';
import 'package:kembang_belor_apps/pages/home_page.dart';
import 'package:kembang_belor_apps/pages/news_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _pages = [const HomePage(), const NewsPage()];

  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          const BottomNavigationBarItem(
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
