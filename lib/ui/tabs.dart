import 'package:flutter/material.dart';
import 'package:flutter_take_5/generated/i18n.dart';
import 'package:flutter_take_5/ui/about/screen.dart';
import 'package:flutter_take_5/ui/common/index.dart';
import 'package:flutter_take_5/ui/contacts/screen.dart';
import 'package:flutter_take_5/ui/home/screen.dart';
import 'package:flutter_take_5/ui/settings/screen.dart';

class TabHome extends StatefulWidget {
  @override
  _TabHomeState createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> {
  final _tabsController = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: _tabsController,
      builder: (context, index, child) => AdaptiveScaffold(
        tabs: [
          TabItem(
            title: I18n.of(context).homeTitle,
            iconData: Icons.home,
            body: HomeScreen(),
          ),
          TabItem(
            title: I18n.of(context).aboutTitle,
            iconData: Icons.info,
            body: AboutScreen(),
          ),
          TabItem(
            title: I18n.of(context).contactsTitle,
            iconData: Icons.contacts,
            body: ContactsScreen(),
          ),
          TabItem(
            title: I18n.of(context).settingsTitle,
            iconData: Icons.settings,
            body: SettingsScreen(),
          ),
        ],
        selectedIndex: index,
        onSelectionChanged: (val) => _tabsController.value = val,
      ),
    );
  }
}
