import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter/components/settings_tile.dart';
import 'package:twitter/themes/theme_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text("SETTINGS"),
        foregroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        children: [
          mySettingsTile(
            title: "Dark Mode",
            action: CupertinoSwitch(
              value: themeProvider.isDarkMode,
              onChanged: (value) {
                // temayı değiştir
                themeProvider.toggleTheme();
              },
            ),
          ),
        ],
      ),
    );
  }
}
