import 'package:flutter/material.dart';
import 'package:news_app_second/models/category_model.dart';
import 'package:news_app_second/widgets/category_list.dart';


class CategoryListBuilder extends StatelessWidget {
  const CategoryListBuilder({super.key});
 

 
 final List<CategoryModel> categoriesList = const [
    CategoryModel(
      image: 'assets/entertaiment.avif',
      categoryName: 'Entertainment',
    ),
        CategoryModel(
      image: 'assets/health.avif',
      categoryName: 'Health',
    ),
        CategoryModel(
      image: 'assets/science.avif',
      categoryName: 'Science',
    ),
    //     CategoryModel(
    //   image: 'assets/sports.avif',
    //   categoryName: 'Sports',
    // ),
        CategoryModel(
      image: 'assets/technology.jpeg',
      categoryName: 'Technology',
    ),
    //     CategoryModel(
    //   image: 'assets/general.avif',
    //   categoryName: 'General',
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        physics:const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categoriesList.length,
          itemBuilder: (context, index) {
            return CategoryList(categories: categoriesList[index]);
          },),
    );
  }
}
