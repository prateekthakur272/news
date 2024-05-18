import 'package:flutter/material.dart';
import 'package:news/src/models/article.dart';
import 'article_view.dart';

class FeedsView extends StatelessWidget {
  final Future<List<Article>> articles;
  const FeedsView({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    return FutureBuilder(
              future: articles,
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  final data = snapshot.data!;
                  return Scrollbar(
                    controller: scrollController,
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: data.length,
                      itemBuilder: (context, index) =>
                          ArticleView(article: data[index]),
                    ),
                  );
                }else if(snapshot.hasError){
                  return const Text('Some error occurred', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),);
                }
                return const CircularProgressIndicator();
              }));
  }
}