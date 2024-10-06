import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app_second/core/utils/widgets/custom_item.dart';
import 'package:news_app_second/core/utils/widgets/my_divider.dart';

class BuildList extends StatelessWidget {
  const BuildList({super.key, required this.item,this.isSearch = false});
  final List item; 
  final bool isSearch;
  @override
  Widget build(BuildContext context) {
    return  ConditionalBuilder(
          condition: item.isNotEmpty,
          builder: (context) => ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => CustomItem(article: 
            item[index],
                      ),
          separatorBuilder: (context, index) =>const MyDivider() , itemCount: item.length),
          fallback: (context) => isSearch ? const SizedBox():const Center(child: CircularProgressIndicator(
            color: Colors.deepOrange
          ),),
        );
  }
}