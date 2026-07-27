import 'package:flutter/material.dart';
import '../utility/constant.dart';
import 'home_tab.dart';
import 'spending_tab.dart';
import 'cards_tab.dart';
import 'profile_tab.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomeTab(),
          SpendingTab(),
          CardsTab(),
          ProfileTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int i) {
          setState(() => _currentIndex = i);
          _pageController.jumpToPage(i);
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppConstant.primaryColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined),       label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart_outlined),  label: 'Reports'),
          BottomNavigationBarItem(icon: Icon(Icons.credit_card_outlined),label: 'Cards'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline),      label: 'Profile'),
        ],
      ),
    );
  }
}