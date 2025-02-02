import 'package:design_ui_app/view/build_home_tap.dart';
import 'package:design_ui_app/view/profile_acc_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

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
        backgroundColor: Colors.white,
        leading: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://logowik.com/content/uploads/images/finder5988.jpg'))),
        ),
        leadingWidth: 100,
        title: Text(
          'Find You want!',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      body: PersistentTabView(
        context,
        controller: controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        handleAndroidBackButtonPress: true, // Default is true.

        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen on a non-scrollable screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardAppears: true,
        // popBehaviorOnSelectedNavBarItemPress: PopActionScreensType.all,
        padding: const EdgeInsets.only(top: 8),
        backgroundColor: Colors.grey.shade900,
        isVisible: true,
        animationSettings: const NavBarAnimationSettings(
          navBarItemAnimation: ItemAnimationSettings(
            // Navigation Bar's items animation properties.
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: ScreenTransitionAnimationSettings(
            // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            duration: Duration(milliseconds: 200),
            screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
          ),
        ),
        confineToSafeArea: true,
        navBarHeight: kBottomNavigationBarHeight,
        //navBarStyle: _navBarStyle, // Choose the nav bar style with this property
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [BuildHomeTapScreen(), ProfileAccountScreen()];
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
          routes: {
            "/first": (final context) => const BuildHomeTapScreen(),
            "/second": (final context) => const ProfileAccountScreen(),
          },
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.settings),
        title: ("Settings"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        //scrollController: _scrollController2,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: "/",
          routes: {
            "/first": (final context) => const BuildHomeTapScreen(),
            "/second": (final context) => const ProfileAccountScreen(),
          },
        ),
      ),
    ];
  }
}
