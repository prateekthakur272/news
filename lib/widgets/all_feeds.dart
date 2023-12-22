import 'package:flutter/material.dart';
import 'package:news/api.dart';
import 'package:news/widgets/article_view.dart';

class AllFeeds extends StatefulWidget {
  const AllFeeds({super.key});

  @override
  State<AllFeeds> createState() => _AllFeedsState();
}

class _AllFeedsState extends State<AllFeeds> {
  var category = 'All';
  var articles = getNews();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: categories.length,
          child: TabBar(
            isScrollable: true, 
            onTap: (value){},
            tabs: categories.map((e) => Tab(text: e??'All',)).toList(),
          ),
        ),
        Expanded(
            child: Center(
          child: FutureBuilder(
              future: articles,
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  final data = snapshot.data!;
                  return Scrollbar(
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) =>
                          ArticleView(article: data[index]),
                    ),
                  );
                }
                return const CircularProgressIndicator();
              })),
        )),
      ],
    );
  }
}

const categories = [null, 'business', 'entertainment', 'general', 'health', 'science', 'sports', 'technology',];