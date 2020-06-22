import 'package:flutter/material.dart';
import 'package:flutter_take_5/src/classes/settings.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _settings = Provider.of<Settings>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings Screen'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('Dark mode'),
            value: _settings.isDark,
            onChanged: _settings.updateIsDark,
          )
        ],
      ),
    );
  }
}
