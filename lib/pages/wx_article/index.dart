import 'package:flutter/material.dart';
import 'package:wan_flutter/common/api/wx_article_api.dart';
import 'package:wan_flutter/common/models/wx_article/wx_article_chapter.dart';
import './article_list.dart';

class WxArticlePage extends StatefulWidget{
  const WxArticlePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _WxArticlePageState();
  }
}

class _WxArticlePageState extends State<WxArticlePage> with TickerProviderStateMixin,AutomaticKeepAliveClientMixin{
  List<WxArticleChapter> tabChapters = [];
  late TabController  _tabController;


  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TabBar(
                isScrollable: true,
                controller: _tabController,
                tabs: tabChapters.map((chapter)=>Tab(text: chapter.name),
            ).toList()),
            Expanded(
                child: TabBarView(
                    controller: _tabController,
                    children: tabChapters.map((chapter)=>WxArticleList(chapter)).toList()
                )
            )
          ],

        ),
      )
    );
  }

  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: 0, vsync: this);
    _getArticleChapters();
  }

  @override
  void dispose(){
    super.dispose();
    _tabController.dispose();
  }
  _getArticleChapters() async{
    var chapters = await WxArticleApi.getWxArticleChapters();
    setState(() {
       tabChapters = chapters;
      _tabController = TabController(length: tabChapters.length, vsync: this);
    });
  }

  @override
  bool get wantKeepAlive => true;
}