import 'package:flutter/material.dart';
import 'package:flutter_take_5/ui/about/screen.dart';
import 'package:flutter_take_5/ui/breakpoints.dart';
import 'package:flutter_take_5/ui/home/screen.dart';
import 'package:flutter_take_5/ui/settings/screen.dart';

class TabHome extends StatefulWidget {
  @override
  _TabHomeState createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, dimens) {
      const kSideMenuWidth = 250.0;
      if (dimens.minWidth >= kDesktopBreakpoint) {
        return Material(
          child: Row(
            children: [
              Container(
                width: kSideMenuWidth,
                child: ListView(
                  children: [
                    ListTile(
                      selected: _currentIndex == 0,
                      title: Text('Home'),
                      leading: Icon(Icons.home),
                      onTap: () => _onTap(0),
                    ),
                    ListTile(
                      selected: _currentIndex == 1,
                      title: Text('About'),
                      leading: Icon(Icons.info_outline),
                      onTap: () => _onTap(1),
                    ),
                    ListTile(
                      selected: _currentIndex == 2,
                      title: Text('Settings'),
                      leading: Icon(Icons.settings),
                      onTap: () => _onTap(2),
                    ),
                  ],
                ),
              ),
              Expanded(child: buildBody())
            ],
          ),
        );
      }
      if (dimens.minWidth >= kTabletBreakpoint) {
        return Material(
          child: Row(
            children: [
              NavigationRail(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                selectedIconTheme: IconThemeData(color: _handleIconColor()),
                selectedLabelTextStyle: TextStyle(color: _handleIconColor()),
                labelType: NavigationRailLabelType.all,
                selectedIndex: _currentIndex,
                onDestinationSelected: _onTap,
                destinations: [
                  NavigationRailDestination(
                    label: Text('Home'),
                    icon: Icon(Icons.home),
                  ),
                  NavigationRailDestination(
                    label: Text('About'),
                    icon: Icon(Icons.info_outline),
                  ),
                  NavigationRailDestination(
                    label: Text('Settings'),
                    icon: Icon(Icons.settings),
                  ),
                ],
              ),
              Expanded(child: buildBody()),
            ],
          ),
        );
      }
      return Scaffold(
        body: buildBody(),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: _onTap,
          items: [
            BottomNavigationBarItem(
              title: Text('Home'),
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              title: Text('About'),
              icon: Icon(Icons.info_outline),
            ),
            BottomNavigationBarItem(
              title: Text('Settings'),
              icon: Icon(Icons.settings),
            ),
          ],
        ),
      );
    });
  }

  Color _handleIconColor({bool selected = true}) {
    if (selected) {
      switch (Theme.of(context).brightness) {
        case Brightness.light:
          return Theme.of(context).primaryColor;
        case Brightness.dark:
          return Theme.of(context).accentColor;
          break;
        default:
          return Theme.of(context).primaryColor;
      }
    } else {
      switch (Theme.of(context).brightness) {
        case Brightness.light:
          return Colors.black;
        case Brightness.dark:
          return Colors.white;
          break;
        default:
          return Colors.white;
      }
    }
  }

  void _onTap(int val) {
    if (mounted) {
      setState(() {
        _currentIndex = val;
      });
    }
  }

  IndexedStack buildBody() {
    return IndexedStack(
      index: _currentIndex,
      children: [
        HomeScreen(),
        AboutScreen(),
        SettingsScreen(),
      ],
    );
  }
}
