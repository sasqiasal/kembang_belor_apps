import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kembang_belor_apps/features/auth/presentation/provider/auth/bloc/auth_bloc.dart';
import 'package:kembang_belor_apps/features/auth/presentation/provider/login/bloc/login_bloc.dart';
import 'package:kembang_belor_apps/features/auth/presentation/provider/register/bloc/register_bloc.dart';
import 'package:kembang_belor_apps/features/home/presentation/pages/home_page.dart';
import 'package:kembang_belor_apps/features/home/presentation/pages/news_page.dart';
import 'package:kembang_belor_apps/features/home/presentation/providers/recently/bloc/recently_tourism_bloc.dart';
import 'package:kembang_belor_apps/features/home/presentation/providers/tourism/bloc/tourism_bloc.dart';
import 'package:kembang_belor_apps/features/payment/presentation/provider/payment/bloc/payment_bloc.dart';
import 'package:kembang_belor_apps/injection_container.dart';

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
      appBar: AppBar(),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: BlocBuilder<AuthBloc, AuthStates>(
                builder: (context, state) => Text(
                    'Welcome\n${state is AuthUserAuthenticated ? state.user.userMetadata!['name'] : 'User'}'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Edit Identitas'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('Riwayat Pembayaran'),
              onTap: () {},
            ),
            Spacer(),
            Divider(),
            ListTile(
              onTap: () {
                context.read<AuthBloc>().add(AuthLogoutButtonPressed());
              },
              leading: Icon(Icons.logout),
              title: Text('Keluar'),
            )
          ],
        ),
      ),
      body: BlocListener<AuthBloc, AuthStates>(
        listener: (context, state) {
          if (state is AuthUserUnauthenticated) {
            Navigator.of(context).popAndPushNamed('/login');
          }
        },
        child: PageView.builder(
          controller: _pageViewController,
          onPageChanged: _handlePageViewChanged,
          itemBuilder: (context, index) => _pages[index],
        ),
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
