import 'package:flutter/material.dart';
import 'package:wan_flutter/common/models/home/article_list.dart';
import 'package:wan_flutter/common/values/color.dart';

class ArticleTile extends StatefulWidget{
  final Article article;

  const ArticleTile(this.article,{super.key});

  @override
  State<StatefulWidget> createState() {
    return _ArticleTileState();
  }
}

class _ArticleTileState extends State<ArticleTile>{
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 14,left: 14,right: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(widget.article.author ?? '--',style: const TextStyle(
                  fontSize: 16,
                )),
                const SizedBox(width: 7),
                Text('${widget.article.superChapterName} / ${widget.article.chapterName}',style: const TextStyle(
                    fontSize: 14,
                    color: WanColor.onSurfaceGray
                )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7.0),
              child: Text(
                  widget.article.title ?? '',
                  style: const TextStyle(
                      fontSize: 16
                  ),
              ),
            ),
            Row(
              children: [
                const Icon(Icons.date_range_rounded,size: 21),
                const SizedBox(width: 4),
                Text(widget.article.niceDate??'',style: const TextStyle(fontSize: 14)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  icon: const Icon(Icons.star_border),
                  label: const Text("收藏"),
                  style: const ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    padding: WidgetStatePropertyAll(EdgeInsets.zero)
                  ),
                  onPressed: () {  },
                ),
                // https://andyli.tw/flutter-remove-padding/
                const IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    style: ButtonStyle(tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                    onPressed: null,
                    icon: Icon(Icons.more_horiz),
                )
              ],
            ),
          ],
        ),
      )
    );
  }
  
}