import 'package:event_app/common/utils/palette.dart';
import 'package:event_app/core/navigation/bottom_navbar_card.dart';
import 'package:event_app/core/navigation/my_navbar_item.dart';
import 'package:event_app/features/auth/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  final _selectedIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      const HomePage(),
      const HomePage(),
      const HomePage(),
      const HomePage(),
    ];

    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: ValueListenableBuilder(
          valueListenable: _selectedIndex,
          builder: (context, _, __) => IndexedStack(
            index: _selectedIndex.value,
            children: pages.map((page) => page).toList(),
          ),
        ),
        bottomNavigationBar: ValueListenableBuilder(
          valueListenable: _selectedIndex,
          builder: (context, _, __) => BottomNavbarCard(
            children: [
              MyNavbarItem(
                index: 0,
                selectedIndex: _selectedIndex,
                label: 'Home',
                icon: Transform.scale(
                  scaleX: -1,
                  child: FaIcon(
                    FontAwesomeIcons.houseChimney,
                    size: 18,
                    color: _selectedIndex.value == 0
                        ? Palette.primary
                        : Palette.greyIcon,
                  ),
                ),
              ),
              MyNavbarItem(
                index: 1,
                selectedIndex: _selectedIndex,
                label: 'MyEvents',
                icon: Transform.scale(
                  scaleX: -1,
                  child: FaIcon(
                    FontAwesomeIcons.graduationCap,
                    size: 18,
                    color: _selectedIndex.value == 1
                        ? Palette.primary
                        : Palette.greyIcon,
                  ),
                ),
              ),
              MyNavbarItem(
                index: 2,
                selectedIndex: _selectedIndex,
                label: 'Information',
                icon: FaIcon(
                  FontAwesomeIcons.bullhorn,
                  size: 18,
                  color: _selectedIndex.value == 2
                      ? Palette.primary
                      : Palette.greyIcon,
                ),
              ),
              MyNavbarItem(
                index: 3,
                selectedIndex: _selectedIndex,
                label: 'Profile',
                icon: FaIcon(
                  FontAwesomeIcons.solidUser,
                  size: 18,
                  color: _selectedIndex.value == 3
                      ? Palette.primary
                      : Palette.greyIcon,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
