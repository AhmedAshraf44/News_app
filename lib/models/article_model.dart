class ArticleModel {
  final String? image;
  final String title;
  final String? description;

  const ArticleModel(
      {required this.image, required this.title, required this.description});

  // factory ArticleModel.fromJsoin(dynamic article) {
  //   return ArticleModel(
  //       image: article['urlToImage'],
  //       title: article['title'],
  //       subTitle: article['description']);
  // }
}
