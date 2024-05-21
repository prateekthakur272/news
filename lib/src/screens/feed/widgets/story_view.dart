import 'package:flutter/material.dart';
import 'package:news/src/models/article.dart';
import 'package:triton_extensions/triton_extensions.dart';

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
        if(story.imageUrl!=null)
        Image(image: NetworkImage(story.imageUrl!),fit: BoxFit.cover,),
        Padding(
          padding: 8.padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(story.title!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
              Text(story.description??'',)
            ],
          ),
        ),
      ],
    );
  }
}