import 'package:flutter/material.dart';
import 'package:news_app_second/models/article_model.dart';
import 'package:news_app_second/services/news_services.dart';
import 'package:news_app_second/widgets/news_list_view.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, required this.category});
    
  final String category;
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  
var future;



  @override
  void initState() {
    super.initState();
   future =  NewsServices().getNews(categoryName: widget.category);
  }
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: future,
     builder: (context,snapshot){
      if (snapshot.hasData) {
      return NewsListView(articleList: snapshot.data!
      );
      }else if (snapshot.hasError)
      {
       return const SliverToBoxAdapter(child: Text('oops is error , try agin'));
      }
      else
      {
       return const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator( ),),); 
      }    
      });
  }
}