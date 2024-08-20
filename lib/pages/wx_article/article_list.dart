import 'package:flutter/material.dart';
import 'package:wan_flutter/common/api/wx_article_api.dart';
import 'package:wan_flutter/common/models/app/article_list.dart';
import 'package:wan_flutter/common/models/wx_article/wx_article_chapter.dart';
import 'package:wan_flutter/common/utils/show_dialog.dart';
import 'package:wan_flutter/common/widget/article_tile.dart';
import 'package:wan_flutter/pages/webview/index.dart';

class WxArticleList extends StatefulWidget{
  final WxArticleChapter chapter;

  const WxArticleList(this.chapter,{super.key});

  @override
  State<StatefulWidget> createState() {
    return _WxArticleListState();
  }
}

class _WxArticleListState extends State<WxArticleList> with AutomaticKeepAliveClientMixin{
  int _currentPage = 0;
  List<Article> wxArticleList = [];
  final ScrollController _scrollController = ScrollController();


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return  Padding(
      padding: const EdgeInsets.all(7.0),
      child: RefreshIndicator(
        onRefresh: _refreshWxArticleList,
        child: ListView.builder(
            controller: _scrollController,
            itemBuilder: (context,index){
              return ArticleTile(wxArticleList[index],onTap: _openArticleLink);
            },
            itemCount: wxArticleList.length
        ),
      ),
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
  initState(){
    super.initState();

    _scrollController.addListener(_handlerScroll);
    _loadArticleList();
  }


  Future<void> _refreshWxArticleList(){
    _currentPage = 0;
    setState((){
      wxArticleList.clear();
    });

    return _loadArticleList();
  }

  _loadArticleList() async{
    var chapterId = widget.chapter.id;
    var articleListData  = await WxArticleApi.getWxArticleList(chapterId,_currentPage);
    setState(() {
      wxArticleList = articleListData.datas ?? [];
    });
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
  void dispose() {
    super.dispose();
    _scrollController.removeListener(_handlerScroll);
  }

  @override
  bool get wantKeepAlive => true;
}