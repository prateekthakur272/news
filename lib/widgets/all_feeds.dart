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
    return DefaultTabController(
      initialIndex: 0,
      length: 5,
      child: Column(
        children: [
          const TabBar(isScrollable: true, tabs: [
            Tab(
              text: 'All',
            ),
            Tab(
              text: 'Sports',
            ),
            Tab(
              text: 'Entertainment',
            ),
            Tab(
              text: 'Science',
            ),
            Tab(
              text: 'Finance',
            ),
          ]),
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
      ),
    );
  }
}
