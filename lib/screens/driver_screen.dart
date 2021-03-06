import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kool18_new/screens/home/home_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class DriverScreen extends StatefulWidget {
  @override
  DriverScreenState createState() => DriverScreenState();
}

class DriverScreenState extends State<DriverScreen> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      Container(child: Center(child: Text('Video'),),),
      Container(child: Center(child: Text('MarkPlace'),),),
      Container(child: Center(child: Text('Group'),),),
      Container(child: Center(child: Text('Notification'),),),
      Container(child: Center(child: Text('Dashboard'),),),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems () {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.play_rectangle),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.cart),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.person_3),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.bell),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.square_grid_2x2),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 500),
        ),
        navBarStyle: NavBarStyle.style3, // Choose the nav bar style with this property.
    );
  }
}