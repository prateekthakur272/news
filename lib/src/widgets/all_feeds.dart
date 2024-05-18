import 'package:flutter/material.dart';
import 'package:news/api.dart';
import 'feeds_view.dart';

class AllFeeds extends StatefulWidget {
  const AllFeeds({super.key});

  @override
  State<AllFeeds> createState() => _AllFeedsState();
}

class _AllFeedsState extends State<AllFeeds> {
  late String? category;
  var articles = getNews();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: categories.length,
          child: TabBar(
            isScrollable: true, 
            onTap: (index){
              setState(() {
                category = index==0?null:categories[index];
                articles = getNews(category);
              });
            },
            tabs: categories.map((e) => Tab(text: e??'All',)).toList(),
          ),
        ),
        Expanded(
            child: Center(
          child: FeedsView(articles: articles)
        )),
      ],
    );
  }
}

const categories = [null, 'business', 'entertainment', 'general', 'health', 'science', 'sports', 'technology',];