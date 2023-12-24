import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news/api.dart';
import 'package:news/constants.dart';
import 'package:news/widgets/all_feeds.dart';
import 'package:news/widgets/feeds_view.dart';

class SearchArticleView extends StatefulWidget {
  const SearchArticleView({super.key});

  @override
  State<SearchArticleView> createState() => _SearchArticleViewState();
}

class _SearchArticleViewState extends State<SearchArticleView> {
  bool _searchFocused = false;
  final _searchController = TextEditingController();
  var _articles = getNews();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingH16,
      child: Column(
        children: [
          TextField(
            controller: _searchController,
            onChanged: (text) {
              setState(() {
                _searchFocused = text.isNotEmpty;
                _articles = getNews(_searchController.text.trim());
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
          space4,
          if(_searchController.text.isNotEmpty)
          Expanded(child: Center(child: FeedsView(articles: _articles))),
        ],
      ),
    );
  }
}
