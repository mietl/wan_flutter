import 'package:flutter/material.dart';

class MainPageView extends StatefulWidget{
  const MainPageView({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _MainPageViewState();
  }
}

class _MainPageViewState extends State<MainPageView>{
  int _selectedIndex = 0;
  late final PageController _pageController;
  
  @override
  void initState() {
    _pageController = PageController(initialPage: _selectedIndex);

    super.initState();
  }
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
        onPageChanged: _onPageChanged,
        children: const [
          Center(child: Text('首页')),
          Center(child: Text('文章')),
          Center(child: Text('收藏')),
          Center(child: Text('我的')),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: onDestinationSelected,
        selectedIndex: _selectedIndex,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.cottage_outlined), label: '首页',selectedIcon: Icon(Icons.cottage)),
          NavigationDestination(icon: Icon(Icons.rss_feed), label: '文章',selectedIcon: Icon(Icons.rss_feed)),
          NavigationDestination(icon: Icon(Icons.star_border_outlined), label: '收藏',selectedIcon: Icon(Icons.star)),
          NavigationDestination(icon: Icon(Icons.account_box_outlined), label: '我的',selectedIcon: Icon(Icons.account_box)),
        ]
      ),
    );

  }
  
  _onPageChanged(index){
    setState(() {
      _selectedIndex = index;
    });
  }

  onDestinationSelected(index){
    _pageController.jumpToPage(index);
  }
  
}