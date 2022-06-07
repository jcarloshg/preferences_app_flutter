import 'package:flutter/material.dart';
import 'package:preferences_app/share_preferences/share_preferences.dart';
import 'package:preferences_app/widgets/wigets.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'HomeScreen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      drawer: const SideMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('is DarkMode ${SharePreferences.isDarkMode}'),
          const Divider(),
          Text('Gender ${SharePreferences.gender}'),
          const Divider(),
          Text('User name ${SharePreferences.name}'),
          const Divider(),
        ],
      ),
    );
  }
}
