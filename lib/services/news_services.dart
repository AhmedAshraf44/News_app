import 'package:dio/dio.dart';
import 'package:news_app_second/models/article_model.dart';
import 'dart:developer';


class NewsServices 
{
final Dio dio = Dio();
Future<List<ArticleModel>> getNews({required String categoryName}) async {
  
  try {
  ArticleModel? articleModel;
   Response response = await dio.get('https://newsapi.org/v2/top-headlines?country=us&apiKey=084a387cd5f64a3ea0dc927241196e9d&category=$categoryName');
   
   Map<String,dynamic> jsonData = response.data;
  
  
   // data is list of map , it convered to list of object with for loop
   List<dynamic>  articles = jsonData['articles'];
  
   List<ArticleModel> articleList=[];
  
  // first: create object from class and enter data in object ;
  //  for (var article in articles) {
  //   articleModel = ArticleModel.fromJsoin(article);
  //    articleList.add(articleModel);
  //  }
  for (var article in articles) {
    
    articleModel =
    ArticleModel(image: article['urlToImage'],
     title: article['title'],
      description: article['description']);
      articleList.add(articleModel);
  }
  return articleList;
} catch (e) {
  
 log("error is : $e");
}
return [];
 }

}













