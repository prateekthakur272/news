import 'package:flutter/material.dart';
import 'package:news/constants.dart';
import 'package:news/models/article.dart';
import 'package:news/screens/article_screen.dart';

class ArticleView extends StatelessWidget {
  final Article article;
  const ArticleView({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> ArticleScreen(article: article,)));
      },
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        surfaceTintColor: surfaceColor,
        child: Padding(
          padding: paddingAll24,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(article.imageUrl!=null && article.imageUrl!.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                article.imageUrl!,
                width: 160,
                height: 200,
                fit: BoxFit.cover,
              )),
              space16,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title ?? '',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(article.source??'Unknown', style: TextStyle(color: Colors.grey.shade800),),
                    Text(article.description ?? ''),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
