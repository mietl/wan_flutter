import 'package:flutter/material.dart';
import 'package:wan_flutter/pages/home/index.dart';

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
          HomePage(),
          Center(child: Text('文章')),
          Center(child: Text('收藏')),
          Center(child: Text('我的')),
        ],
      ),
      bottomNavigationBar:Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 5,
              offset: const Offset(0, 2), // 向下偏移 2 个像素
            ),
          ],
        ),
        child: NavigationBar(
            indicatorColor: const Color(0xFFcfc2ca),
            backgroundColor: Colors.white,
            onDestinationSelected: onDestinationSelected,
            selectedIndex: _selectedIndex,
            destinations: const [
              NavigationDestination(icon: Icon(Icons.cottage_outlined), label: '首页',selectedIcon: Icon(Icons.cottage)),
              NavigationDestination(icon: Icon(Icons.sticky_note_2), label: '文章',selectedIcon: Icon(Icons.rss_feed)),
              NavigationDestination(icon: Icon(Icons.star_border_outlined), label: '收藏',selectedIcon: Icon(Icons.star)),
              NavigationDestination(icon: Icon(Icons.info_outline), label: '我的',selectedIcon: Icon(Icons.info_outline_rounded)),
            ]
        ),
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