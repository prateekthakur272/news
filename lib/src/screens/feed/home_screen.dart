import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:news/src/navigation/navigation.dart';
import 'package:news/src/screens/feed/widgets/all_feeds.dart';
import 'package:news/src/screens/feed/widgets/search_view.dart';
import 'package:news/src/screens/feed/widgets/stories_page.dart';
import 'package:news/src/screens/settings/settings_screen.dart';
import 'package:news/src/shared/strings.dart';
import 'package:triton_extensions/triton_extensions.dart';


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
          IconButton(
              onPressed: () {
                context.pushNamed(Routes.settings.name);
              },
              icon: const Icon(FontAwesomeIcons.gear))
        ],
      ),
      body: IndexedStack(
        index: pageIndex,
        children: const [
          AllFeeds(),
          StoriesPage(),
          SearchArticleView()
        ],
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            indicatorColor: context.colorScheme.secondary.withOpacity(0.3)),
        child: NavigationBar(
          onDestinationSelected: (index) {
            setState(() {
              pageIndex = index;
            });
          },
          selectedIndex: pageIndex,
          destinations: [
            NavigationDestination(
                icon: const Icon(FontAwesomeIcons.newspaper),
                selectedIcon: Icon(
                  FontAwesomeIcons.solidNewspaper,
                  color: context.colorScheme.primary,
                ),
                label: 'Feed'),
            NavigationDestination(
                icon: const Icon(FontAwesomeIcons.chartLine),
                selectedIcon: Icon(
                  FontAwesomeIcons.chartLine,
                  color: context.colorScheme.primary,
                ),
                label: 'Stories'),
            NavigationDestination(
                icon: const Icon(FontAwesomeIcons.magnifyingGlass),
                selectedIcon: Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: context.colorScheme.primary,
                ),
                label: 'Search'),
          ],
        ),
      ),
    );
  }
}
