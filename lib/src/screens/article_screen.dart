import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news/src/models/article.dart';
import 'package:share_plus/share_plus.dart';
import 'package:triton_extensions/triton_extensions.dart';
import 'article_web_view.dart';

class ArticleScreen extends StatelessWidget {
  final Article article;
  const ArticleScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('NEWS'),
          actions: [
            IconButton(
                onPressed: () {
                  Share.share('Check out this article ${article.articleUrl}',);
                }, icon: const Icon(FontAwesomeIcons.share))
          ],
        ),
        body: ListView(
          padding: 16.padding,
          children: [
            if (article.imageUrl != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  article.imageUrl!,
                  fit: BoxFit.contain,
                ),
              ),
            16.space,
            Text(
              article.title ?? '',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(article.content ?? ''),
            8.space,
            Text(
              'By ${article.author!}',
              style: const TextStyle(fontSize: 16),
            ),
            8.space,
            if(article.articleUrl!=null)
            FilledButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ArticleWebView(articleUrl: article.articleUrl!,)));
                }, child: const Text('Read full article')),
          ],
        ));
  }
}
