import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_second/core/utils/widgets/web_view_screen.dart';

class CustomItem extends StatelessWidget {
  const CustomItem({super.key, this.article,});
final dynamic article;
  @override
  Widget build(BuildContext context) {
    return article["title"]=="[Removed]"? const SizedBox() :
    Padding(
      padding: const EdgeInsets.all(20),
      child: InkWell(
        onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewScreen(url: article['url']),));
              },
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(imageUrl:'${article['urlToImage']}',
              width: 120,
              height: 120,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) =>const ColoredBox(color: Colors.grey,
              child: Icon(Icons.error,size: 30,color: Colors.deepOrange,),
              ),
              placeholder: (context, url) =>const ColoredBox(color: Colors.white,
              child: Center(child:  CircularProgressIndicator(
                color: Colors.deepOrange,
              )),
              ),
               ),
            ),
          const  SizedBox(width: 20),
            Expanded(
              child: SizedBox(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text('${article['title']}',
                      style:  Theme.of(context).textTheme.bodyMedium ,
                      maxLines: 3,overflow: TextOverflow.ellipsis,),
                    ),
                    Text('${article['publishedAt']}',style:const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}