import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:loyalty/shared/SessionVariables.dart';
import 'package:loyalty/shared/style.dart';
import 'package:loyalty/views/rewards_view.dart';
import 'package:loyalty/views/home_company_view.dart';
import 'package:loyalty/views/home_view.dart';
import 'package:loyalty/views/profile_view.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class TabsView extends StatefulWidget {
  @override
  _TabsViewState createState() => _TabsViewState();
}

class _TabsViewState extends State<TabsView> {
  var _selectedTab = _SelectedTab.home;
  Widget screen = SessionVariables.user['role'] == 'company'
      ? HomeCompanyView()
      : HomeView();

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
      switch (i) {
        case 0:
          screen = SessionVariables.user['role'] == 'company'
              ? HomeCompanyView()
              : HomeView();
          break;
        case 1:
          screen = RewardsView();
          break;
        case 2:
          screen = ProfileView();
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screen,
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _SelectedTab.values.indexOf(_selectedTab),
          onTap: _handleIndexChanged,
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: Icon(LineIcons.home),
              title: Text("Home"),
              unselectedColor: Colors.grey[500],
              selectedColor: Style.themeColor,
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: Icon(LineIcons.heart_o),
              title: Text("Rewards"),
              unselectedColor: Colors.grey[500],
              selectedColor: Style.themeColor,
            ),

            /// Search
            // SalomonBottomBarItem(
            //   icon: Icon(Icons.search),
            //   title: Text("Search"),
            //   selectedColor: Colors.orange,
            // ),

            /// Profile
            SalomonBottomBarItem(
              icon: Icon(LineIcons.user),
              title: Text("Profile"),
              unselectedColor: Colors.grey[500],
              selectedColor: Style.themeColor,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
}

enum _SelectedTab { home, likes, profile }
