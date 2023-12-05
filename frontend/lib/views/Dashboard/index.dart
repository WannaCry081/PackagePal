import "package:flutter/material.dart";
import "package:frontend/views/CreateOrder/index.dart";
import "package:frontend/views/Home/index.dart";
import "package:frontend/views/OrdersList/index.dart";
import "package:frontend/views/Profile/index.dart";
import "package:frontend/views/Settings/index.dart";
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";


class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        navBarStyle: NavBarStyle.style12,
        confineInSafeArea: true,
        navBarHeight: 55.0,
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
            iconSize: 20.0,
            contentPadding: 3.0,
            title: "Home",
            activeColorPrimary: Theme.of(context).colorScheme.tertiaryContainer,
            inactiveColorPrimary: Colors.grey
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(FeatherIcons.fileText),
            iconSize: 20.0,
            contentPadding: 3.0,
            title: "Orders",
            activeColorPrimary: Theme.of(context).colorScheme.tertiaryContainer,
            inactiveColorPrimary: Colors.grey
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(FeatherIcons.plus),
            iconSize: 20.0,
            contentPadding: 3.0,
            title: "",
            activeColorPrimary: Theme.of(context).colorScheme.tertiaryContainer,
            inactiveColorPrimary: Colors.grey
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(FeatherIcons.settings),
            iconSize: 20.0,
            contentPadding: 3.0,
            title: "Settings",
            activeColorPrimary: Theme.of(context).colorScheme.tertiaryContainer,
            inactiveColorPrimary: Colors.grey
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(FeatherIcons.user),
            iconSize: 20.0,
            contentPadding: 3.0,
            title: "Profile",
            activeColorPrimary: Theme.of(context).colorScheme.tertiaryContainer,
            inactiveColorPrimary: Colors.grey
          )
        ]
      )
    );
  }
}