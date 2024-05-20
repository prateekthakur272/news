import 'package:flutter/material.dart';
import 'package:news/src/providers/news_provider.dart';
import 'package:news/src/widgets/article_view.dart';
import 'package:provider/provider.dart';

class AllFeeds extends StatefulWidget {
  const AllFeeds({super.key});

  @override
  State<AllFeeds> createState() => _AllFeedsState();
}

class _AllFeedsState extends State<AllFeeds> {

  late final NewsProvider newsProvider;
  late String? category;

  @override
  void initState() {
    super.initState();
    newsProvider = Provider.of<NewsProvider>(context, listen: false);
    newsProvider.fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: categories.length,
          child: TabBar(
            isScrollable: true,
            onTap: (index) {
              setState(() {
                category = index == 0 ? null : categories[index];
              });
              newsProvider.fetchNews(category);
            },
            tabs: categories
                .map((e) => Tab(
                      text: e ?? 'All',
                    ))
                .toList(),
          ),
        ),
        Expanded(
            child: Consumer<NewsProvider>(builder: (context, provider, child) {
          return Center(
            child: provider.news == null
                ? const CircularProgressIndicator()
                : ListView.builder(
                    itemCount: provider.news!.length,
                    itemBuilder: (context, index) =>
                        ArticleView(article: provider.news![index])),
          );
        })),
      ],
    );
  }
}

const categories = [
  null,
  'business',
  'entertainment',
  'general',
  'health',
  'science',
  'sports',
  'technology',
];
