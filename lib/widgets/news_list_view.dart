import 'package:flutter/material.dart';
import 'package:news_app_second/models/article_model.dart';
import 'package:news_app_second/widgets/item_view.dart';



class NewsListView extends StatelessWidget {
const NewsListView({super.key, required this.articleList});

  
 
final List<ArticleModel> articleList ;

  //  final List<ArticleModel> itemList = [
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articleList.length,
        (context, index) {
      return ItemView(item: articleList[index],);
    }),
    );
  }
}







// SliverList.builder(
    //   itemCount: itemList.length ,
    //   itemBuilder: (context, index) {
    //        return ItemView(item: itemList[index]);   
    //        },);
    //        ListView.builder(
    //   shrinkWrap: true,
    //   physics:const NeverScrollableScrollPhysics(),
    //   itemCount: itemList.length,
    //   itemBuilder: (context, index) {
    //     return ItemView(item: itemList[index]);
    //   },
    // );