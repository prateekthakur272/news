import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('By Prateek Thakur'),
            subtitle: const Text('prateekthakur.dev'),
            leading: const Icon(FontAwesomeIcons.link),
            onTap: (){
              launchUrl(Uri.parse('https://prateekthakur.dev'));
            },
          ),
          ListTile(
            title: const Text('Powered by NewsAPI'),
            subtitle: const Text('newsapi.org'),
            leading: const Icon(FontAwesomeIcons.sourcetree),
            onTap: (){
              launchUrl(Uri.parse('https://newsapi.org'));
            },
          ),
          ListTile(
            title: const Text('Source Code'),
            subtitle: const Text('View on GitHub'),
            leading: const Icon(FontAwesomeIcons.code),
            onTap: (){
              launchUrl(Uri.parse('https://github.com/prateekthakur272/news'));
            },
          ),
        ],
      ),
    );
  }
}