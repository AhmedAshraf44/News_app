import 'package:flutter/material.dart';
import 'package:news_app_second/models/article_model.dart';

class ItemView extends StatelessWidget {
  const ItemView({super.key, required this.item});
 
  final ArticleModel item;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child:item.image != null ? Image.network(
                  item.image!,
                  height: 200,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              :const Text('null image'),
              ),
  //             CachedNetworkImage(
  //             imageUrl: item.image ?? "", 
  //             imageBuilder: (context, imageProvider) => Container(
  //             decoration: BoxDecoration( 
  //              image: DecorationImage(
  //             image: imageProvider,
  //             fit: BoxFit.cover,
  //         colorFilter:
  //            const ColorFilter.mode(Colors.red, BlendMode.colorBurn),),
  //   ),
  // ),
  //              placeholder: (context, url) =>const CircularProgressIndicator(),
  //             errorWidget: (context, url, error){
  //               return const Icon(Icons.error);
  //             },
  //             ),
              const SizedBox(
                height: 10,
              ),
              Text(
                item.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style:const TextStyle(
                  fontSize: 20,
                ),
              ),
             const SizedBox(
                height: 5,
              ),
              Text(
                item.description?? " ",
                 maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style:const TextStyle(color: Colors.grey),
              ),
            ],
          ),
    );
  }
}