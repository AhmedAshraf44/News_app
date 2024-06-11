import 'package:flutter/material.dart';
import 'package:news_app_second/widgets/news_list_view_builder.dart';
import 'package:news_app_second/widgets/category_list_builder_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'News',
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
            Text(
              'Cloud',
              style: TextStyle(color: Colors.yellow, fontSize: 24),
            ),
          ],
        ),
      ),
      body:const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20,),
        child:  CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
           SliverToBoxAdapter(child:CategoryListBuilder(),),
           SliverToBoxAdapter(
            child: SizedBox(
              height: 32,
               ),
           ),
           NewsListViewBuilder(category: 'general'),
          ],
        ),
      ),
    );
  }

}
