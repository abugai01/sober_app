import 'package:flutter/material.dart';
import 'package:sober_app/config/style.dart';
import 'package:sober_app/helpers/screen_navigation.dart';
import 'package:sober_app/pages/friends/friends_page.dart';
import 'package:sober_app/pages/home_page.dart';
import 'package:sober_app/pages/profile/profile_page.dart';
import 'package:sober_app/pages/settings/settings_page.dart';

class BottomBar extends StatefulWidget {
  final int selectedIndex;

  BottomBar(this.selectedIndex);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  //final double verticalPadding = 5;

  @override
  Widget build(BuildContext context) {
    const double verticalPadding = 3;

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      elevation: 4,
      iconSize: 22,
      backgroundColor: white,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      selectedLabelStyle: const TextStyle(fontSize: 14.0),
      unselectedLabelStyle: const TextStyle(fontSize: 12.0),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Padding(
                padding: EdgeInsets.symmetric(vertical: verticalPadding),
                child: Icon(Icons.wine_bar)),
            label: 'Progress'),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.symmetric(vertical: verticalPadding),
            child: Icon(Icons.sports_kabaddi),
          ),
          label: 'Friends',
        ),
        BottomNavigationBarItem(
          icon: Padding(
              padding: EdgeInsets.symmetric(vertical: verticalPadding),
              child: Icon(Icons.settings)),
          label: 'Settings',
        ),
        BottomNavigationBarItem(
          icon: Padding(
              padding: EdgeInsets.symmetric(vertical: verticalPadding),
              child: Icon(Icons.person)),
          label: 'Profile',
        ),
      ],
      currentIndex: widget.selectedIndex,
      onTap: onItemTapped,
    );
  }

  void onItemTapped(int index) {
    if (index == widget.selectedIndex) return;

    switch (index) {
      case 0:
        changeScreenWithoutAnimation(context, HomePage());
        break;
      case 1:
        changeScreenWithoutAnimation(context, FriendsPage());
        break;
      case 2:
        changeScreenWithoutAnimation(context, SettingsPage());
        break;
      case 3:
        changeScreenWithoutAnimation(context, ProfilePage());
        break;
    }
  }
}
