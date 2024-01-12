import 'package:flutter/material.dart';
import 'package:news/constants.dart';
import 'package:news/models/article.dart';

class ArticleScreen extends StatelessWidget {
  final Article article;
  const ArticleScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('NEWS'),),
      body: ListView(
        padding: paddingAll16,
        children: [
          if (article.imageUrl!=null)
          ClipRRect(borderRadius: BorderRadius.circular(12),child: Image.network(article.imageUrl!, fit: BoxFit.contain,),),
          space16,
          Text(article.title??'',style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
          Text(article.content??''),
          space8,
          Text('By ${article.author!}', style: const TextStyle(fontSize: 16),),
          space8,
          FilledButton(onPressed: (){}, child: const Text('Read full article')),
        ],
      )
    );
  }
}
