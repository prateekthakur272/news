import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news/constants.dart';
import 'package:news/widgets/all_feeds.dart';

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
        ),
      body: IndexedStack(
        index: pageIndex,
        children: const [AllFeeds()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: primaryColor,
        showUnselectedLabels: true,
        unselectedItemColor: secondaryColor,
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
                    BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.gear),label: 'Settings'),
                  ]
              ),
    );
  }
}
