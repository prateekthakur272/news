import 'package:flutter/material.dart';
import 'package:news/src/providers/news_provider.dart';
import 'package:news/src/screens/feed/widgets/story_view.dart';
import 'package:provider/provider.dart';

class StoriesPage extends StatefulWidget {
  const StoriesPage({super.key});

  @override
  State<StoriesPage> createState() => _StoriesPageState();
}

class _StoriesPageState extends State<StoriesPage> {

  @override
  void initState() {
    super.initState();
    Provider.of<NewsProvider>(context, listen: false).fetchStories();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<NewsProvider>(
          builder: (context, prov, child) {
            if (prov.stories!=null) {
              final stories = prov.stories!;
              return PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: stories.length,
                  itemBuilder: (context, index) =>
                      StoryView(story: stories[index]));
            }
            return const CircularProgressIndicator();
          }),
    );
  }
}
