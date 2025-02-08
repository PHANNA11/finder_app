import 'package:design_ui_app/view/favorite_screen.dart';
import 'package:design_ui_app/view/shippings.dart';
import 'package:flutter/material.dart';

import '../view/build_home_tap.dart';
import '../view/profile_acc_screen.dart';

class RouterNav {
  Map<String, Widget Function(BuildContext)>? get getNavRouter => {
        "/home": (final context) => const BuildHomeTapScreen(),
        "/favorite": (final context) => const FavoriteScreen(),
        "/shoping": (final context) => const ShoppingsScreen(),
        "/setting": (final context) => const ProfileAccountScreen(),
      };
}
