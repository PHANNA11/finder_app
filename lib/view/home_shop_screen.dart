import 'package:design_ui_app/view/build_home_tap.dart';
import 'package:design_ui_app/view/favorite_screen.dart';
import 'package:design_ui_app/view/profile_acc_screen.dart';
import 'package:design_ui_app/view/shippings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../router/router_nav.dart';

class HomeShopScreen extends StatefulWidget {
  const HomeShopScreen({super.key});

  @override
  State<HomeShopScreen> createState() => _HomeShopScreenState();
}

class _HomeShopScreenState extends State<HomeShopScreen> {
  PersistentTabController? controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    // final maxwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        leading: Container(
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://logowik.com/content/uploads/images/finder5988.jpg'))),
        ),
        leadingWidth: 90,
        title: controller!.index == 0
            ? CupertinoTextField(
                placeholder: 'Find what you want!',
                placeholderStyle: TextStyle(fontSize: 13, color: Colors.grey),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 240, 239, 239),
                    ),
                    color: const Color.fromARGB(255, 246, 245, 245),
                    borderRadius: BorderRadius.circular(10)),
                suffix: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              )
            : controller!.index == 1
                ? Text('Your`s Favorite')
                : controller!.index == 2
                    ? Text('Shopping Cart')
                    : Text('Profile Account'),
      ),
      body: PersistentTabView(
        context,
        controller: controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        handleAndroidBackButtonPress: true, // Default is true.

        resizeToAvoidBottomInset: true,
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardAppears: true,
        padding: const EdgeInsets.only(top: 0),
        backgroundColor: Colors.white,
        isVisible: true,
        animationSettings: const NavBarAnimationSettings(
          navBarItemAnimation: ItemAnimationSettings(
            // Navigation Bar's items animation properties.
            duration: Duration(milliseconds: 200),
            curve: Curves.linear,
          ),
          screenTransitionAnimation: ScreenTransitionAnimationSettings(
            // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            duration: Duration(milliseconds: 200),
            screenTransitionAnimationType: ScreenTransitionAnimationType.slide,
          ),
        ),
        confineToSafeArea: true,

        navBarHeight: kBottomNavigationBarHeight,
        //navBarStyle: _navBarStyle, // Choose the nav bar style with this property
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [
      BuildHomeTapScreen(),
      FavoriteScreen(),
      ShoppingsScreen(),
      ProfileAccountScreen()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        // scrollController: _scrollController1,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: "/",
          routes: RouterNav().getNavRouter,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.heart),
        title: ("Favorite"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        //scrollController: _scrollController2,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: "/",
          routes: RouterNav().getNavRouter,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.shopping_cart),
        title: ("Shoppings"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        //scrollController: _scrollController2,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
            initialRoute: "/", routes: RouterNav().getNavRouter),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.settings),
        title: ("Settings"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        //scrollController: _scrollController2,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
            initialRoute: "/", routes: RouterNav().getNavRouter),
      ),
    ];
  }
}
