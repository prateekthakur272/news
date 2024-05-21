import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:news/src/navigation/navigation.dart';
import 'package:news/src/providers/authentication_provider.dart';
import 'package:news/src/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          SwitchListTile(
            value: themeProvider.isDark,
            onChanged: (value) {
              themeProvider.toggleTheme();
            },
            title: const Text('Dark Mode'),
            subtitle: const Text('Enable dark mode'),
          ),
          ListTile(
            title: Text('LogOut', style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.red.shade500
            ),),
            // leading: const Icon(FontAwesomeIcons.link),
            onTap: () {
              Provider.of<AuthenticationProvider>(context,listen: false).signOut();
              context.goNamed(Routes.home.name);
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('By Prateek Thakur'),
            subtitle: const Text('prateekthakur.dev'),
            leading: const Icon(FontAwesomeIcons.link),
            onTap: () {
              launchUrl(Uri.parse('https://prateekthakur.dev'));
            },
          ),
          ListTile(
            title: const Text('Powered by NewsAPI'),
            subtitle: const Text('newsapi.org'),
            leading: const Icon(FontAwesomeIcons.sourcetree),
            onTap: () {
              launchUrl(Uri.parse('https://newsapi.org'));
            },
          ),
          ListTile(
            title: const Text('Source Code'),
            subtitle: const Text('View on GitHub'),
            leading: const Icon(FontAwesomeIcons.code),
            onTap: () {
              launchUrl(Uri.parse('https://github.com/prateekthakur272/news'));
            },
          ),
        ],
      ),
    );
  }
}
