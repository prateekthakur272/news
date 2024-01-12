import 'package:flutter/material.dart';
import 'package:news/api.dart';
import 'package:news/widgets/story_view.dart';

class StoriesPage extends StatefulWidget {
  const StoriesPage({super.key});

  @override
  State<StoriesPage> createState() => _StoriesPageState();
}

class _StoriesPageState extends State<StoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
          future: getNews(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final stories = snapshot.data!;
              return PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: stories.length,
                  itemBuilder: (context, index) =>
                      StoryView(story: stories[index]));
            }
            return CircularProgressIndicator();
          }),
    );
  }
}
