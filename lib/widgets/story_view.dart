import 'package:flutter/material.dart';
import 'package:news/constants.dart';
import 'package:news/models/article.dart';

class StoryView extends StatelessWidget {
  final Article story;
  const StoryView({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image(image: NetworkImage(story.imageUrl!),fit: BoxFit.cover,),
        Padding(
          padding: paddingAll8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(story.title!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
              Text(story.description!,)
            ],
          ),
        ),
      ],
    );
  }
}