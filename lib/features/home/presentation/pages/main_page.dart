import 'package:flutter/material.dart';
import 'package:kembang_belor_apps/features/home/presentation/pages/home_page.dart';
import 'package:kembang_belor_apps/features/home/presentation/pages/news_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;
  final _pages = [const HomePage(), const NewsPage()];
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: IndexedStack(
      //   index: currentPage,
      //   children: _pages,
      // ),
      body: PageView.builder(
        controller: _pageViewController,
        onPageChanged: _handlePageViewChanged,
        itemBuilder: (context, index) => _pages[index],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'News',
          )
        ],
        onTap: (value) {
          setState(() {
            _currentPageIndex = value;
            _pageViewController.animateToPage(value,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut);
          });
        },
      ),
    );
  }

  void _handlePageViewChanged(int currentPageIndex) {
    _tabController.index = currentPageIndex;
    setState(() {
      _currentPageIndex = currentPageIndex;
    });
  }
}
