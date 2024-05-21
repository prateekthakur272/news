import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news/src/providers/news_provider.dart';
import 'package:provider/provider.dart';
import 'package:triton_extensions/triton_extensions.dart';

import 'article_view.dart';

class SearchArticleView extends StatefulWidget {
  const SearchArticleView({super.key});

  @override
  State<SearchArticleView> createState() => _SearchArticleViewState();
}

class _SearchArticleViewState extends State<SearchArticleView> {
  bool _searchFocused = false;
  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 16.paddingHorizontal,
      child: Column(
        children: [
          TextField(
            controller: _searchController,
            onChanged: (text) {
              setState(() {
                _searchFocused = text.isNotEmpty;
                Provider.of<NewsProvider>(context, listen: false).searchNews(_searchController.text.trim());
              });
            },
            decoration: InputDecoration(
                hintText: 'Search topics, headlines, places and more',
                prefixIcon: const Icon(FontAwesomeIcons.magnifyingGlass),
                suffixIcon: _searchFocused
                    ? IconButton(
                        onPressed: () {
                          _searchController.clear();
                          setState(() {
                            _searchFocused = false;
                          });
                        },
                        icon: const Icon(FontAwesomeIcons.xmark))
                    : null),
          ),
          4.space,
          if (_searchController.text.isNotEmpty)
            Expanded(child: Center(
              child: Consumer<NewsProvider>(builder: (context, prov, child) {
                if (prov.searchFeed == null) {
                  return const CircularProgressIndicator();
                }
                return ListView.builder(
                  itemCount: prov.searchFeed!.length,
                    itemBuilder: (context, index) =>
                        ArticleView(article: prov.searchFeed![index]));
              }),
            ))
        ],
      ),
    );
  }
}
