import 'package:flutter/material.dart';
import 'package:wan_flutter/common/api/home_api.dart';
import 'package:wan_flutter/common/models/app/article_list.dart';
import 'package:wan_flutter/common/models/home/banner.dart';
import 'package:wan_flutter/common/utils/show_dialog.dart';
import 'package:wan_flutter/common/widget/article_tile.dart';
import 'package:wan_flutter/common/widget/avatar_drawer.dart';
import 'package:wan_flutter/common/widget/carousel_image.dart';
import 'package:wan_flutter/pages/webview/index.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin{
  List<BannerInfo> bannerList = [];

  List<Article> articleList = [];

  int _currentPage = 0;

  final ScrollController  _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_handlerScroll);

    _requestBannerData();

    _loadArticleList();
  }

  _handlerScroll(){
    if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
      showLoadingBox(context);
      _loadArticleList().whenComplete((){
        if(mounted){
          Navigator.pop(context);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: const Color(0xFFf5f5f7),
      appBar: AppBar(
        surfaceTintColor: const Color(0xFFFFFFFF), // why ?
        backgroundColor: const Color(0xFFFFFFFF),
        title: const Text('首页'),
        elevation:1,
        shadowColor: Colors.white
      ),
      body: Padding(
        padding: const EdgeInsets.all(7),
          // solution1 https://segmentfault.com/a/1190000044394688
          // solution2 https://juejin.cn/post/7184955986224873531
          child: RefreshIndicator(
            onRefresh: _refreshArticleList,
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                    CarouselImage(
                        images: bannerList.map((img)=>img.imagePath ?? '').toList(),
                        height: 214
                    ),
                   ListView.builder(
                       // https://blog.csdn.net/ZuoYueLiang/article/details/131787672
                        shrinkWrap:true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context,index){
                          return ArticleTile(articleList[index],onTap: _openArticleLink);
                        },
                        itemCount: articleList.length
                    )
                ],
              ),
            ),
          ),
      ),
      drawer: const AvatarDrawer(),
    );
  }

  _openArticleLink(Article article){
    if(article.link!=null){
      Navigator.of(context).push(MaterialPageRoute(builder: (context){
        return WanWebBrowser(url: Uri.parse(article.link!), title: article.title ?? '');
      }));
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _requestBannerData() {
    HomeApi.requestBanner().then((value){
      setState(() {
          bannerList = value;
      });
    });
  }

  Future<void> _refreshArticleList(){
    articleList.clear();
    _currentPage = 0;
    return _loadArticleList();
  }

  Future<void> _loadArticleList() async {
    // 请求时展示Loading对话框
    // https://stackoverflow.com/questions/71626326/show-dialog-when-the-page-finish-init
    HomeApi.requestArticleList(_currentPage).then((value){
      var data = value.datas ?? [];
      setState(() {
        articleList.addAll(data);
      });
      debugPrint('加载${value.size}条数据，当前${articleList.length}条');
      _currentPage++;
    });
  }

  @override
  bool get wantKeepAlive => true;
}
