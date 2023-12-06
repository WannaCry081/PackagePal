import "package:provider/provider.dart";
import "package:flutter/material.dart";
import "package:frontend/views/CreateOrder/index.dart";
import "package:frontend/views/Home/index.dart";
import "package:frontend/views/OrdersList/index.dart";
import "package:frontend/views/Profile/index.dart";
import "package:frontend/views/Settings/index.dart";
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";

import "package:frontend/viewmodels/auth_viewmodel.dart";
import "package:frontend/core/providers/user_provider.dart";

class DashboardView extends StatelessWidget {
  DashboardView({Key? key}) : super(key: key);

  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        navBarStyle: NavBarStyle.style12,
        navBarHeight: 70,
        confineInSafeArea: true,
        screens: const [
          HomeView(),
          OrdersListView(),
          CreateOrderView(),
          SettingsView(),
          ProfileView()
        ],
        items: [
          PersistentBottomNavBarItem(
            icon: const Icon(FeatherIcons.home),
            iconSize: 24.0,
            contentPadding: 3.0,
            title: "Home",
            activeColorPrimary: Theme.of(context).colorScheme.primary,
            inactiveColorPrimary: Colors.grey
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(FeatherIcons.fileText),
            iconSize: 24.0,
            contentPadding: 3.0,
            title: "Orders",
            activeColorPrimary: Theme.of(context).colorScheme.primary,
            inactiveColorPrimary: Colors.grey
          ),
          PersistentBottomNavBarItem(
            icon: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.primary
              ),
              child: const Icon(FeatherIcons.plus)),
            iconSize: 24.0,
            contentPadding: 3.0,
            activeColorPrimary: Colors.white,
            inactiveColorPrimary: Colors.white
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(FeatherIcons.settings),
            iconSize: 24.0,
            contentPadding: 3.0,
            title: "Settings",
            activeColorPrimary: Theme.of(context).colorScheme.primary,
            inactiveColorPrimary: Colors.grey
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(FeatherIcons.user),
            iconSize: 24.0,
            contentPadding: 3.0,
            title: "Profile",
            activeColorPrimary: Theme.of(context).colorScheme.primary,
            inactiveColorPrimary: Colors.grey
          )
        ]
      )
    );
  }
}
