import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news/src/screens/settings_screen.dart';
import 'package:news/src/widgets/search_view.dart';
import 'package:triton_extensions/triton_extensions.dart';

import '../shared/strings.dart';
import '../widgets/all_feeds.dart';
import '../widgets/stories_page.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const SettingsScreen()));
          }, icon: const Icon(FontAwesomeIcons.gear))
        ],
        ),
      body: IndexedStack(
        index: pageIndex,
        children: const [AllFeeds(),StoriesPage(),SearchArticleView()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: context.colorScheme.primary,
        showUnselectedLabels: true,
        unselectedItemColor: context.colorScheme.secondary,
        showSelectedLabels: true,
        currentIndex: pageIndex,
                onTap: (index){
                  setState(() {
                    pageIndex = index;
                  });
                },
                  items: const [
                    BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.solidNewspaper,),label: 'Feed'),
                    BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.chartLine,),label: 'Stories'),
                    BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.magnifyingGlass),label: 'Search'),
                  ]
              ),
    );
  }
}
