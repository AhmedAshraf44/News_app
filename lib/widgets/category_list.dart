import 'package:flutter/material.dart';
import 'package:news_app_second/models/category_model.dart';
import 'package:news_app_second/views/category_view.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key, required this.categories,});
 
   final CategoryModel categories;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
        return CategoryView(categoryName: categories.categoryName);
        },),);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Container(
         height: 130,
         width: 170,
         decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          image: DecorationImage(image: AssetImage(categories.image),fit: BoxFit.fill),
         ),
         child: Center(
           child: Text(categories.categoryName,
           style:const TextStyle(
            color: Colors.white,
            fontSize: 18,
           ),),
         ),
        ),
      ),
    ) ;
    }
}

