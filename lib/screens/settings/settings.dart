import 'package:flutter/material.dart';
import 'package:preferences_app/provider/theme_provider.dart';
import 'package:preferences_app/share_preferences/share_preferences.dart';
import 'package:preferences_app/widgets/wigets.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  static const String routeName = 'SettingsScreen';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // bool isDarkMode = false;
  // int gender = 1;
  // String userName = 'Fernanda';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      drawer: const SideMenu(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Adjust',
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const Divider(),
              SwitchListTile(
                value: SharePreferences.isDarkMode,
                title: const Text('Dark mode'),
                onChanged: (value) {
                  SharePreferences.isDarkMode = value;
                  final themeProvider = Provider.of<ThemeProvider>(
                    context,
                    listen: false,
                  );
                  value
                      ? themeProvider.setDarkMode()
                      : themeProvider.setLightMode();
                  setState(() {});
                },
              ),
              const Divider(),
              RadioListTile<int>(
                value: 1,
                groupValue: SharePreferences.gender,
                title: const Text('Male'),
                onChanged: (value) {
                  SharePreferences.gender = value ?? 1;
                  setState(() {});
                },
              ),
              const Divider(),
              RadioListTile<int>(
                value: 2,
                groupValue: SharePreferences.gender,
                title: const Text('Famale'),
                onChanged: (value) {
                  SharePreferences.gender = value ?? 2;
                  setState(() {});
                },
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  initialValue: SharePreferences.name,
                  onChanged: (value) {
                    SharePreferences.name = value;
                    setState(() {});
                  },
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    helperText: 'User name',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
