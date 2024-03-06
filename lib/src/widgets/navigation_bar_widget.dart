import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
        selectedIndex: 1,
        destinations: [
          NavigationDestination(
            icon: SvgPicture.asset(
              'assets/clipboard-list.svg',
              height: 20,
              width: 20,
            ),
            label: 'Заявки',
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              'assets/home.svg',
              height: 20,
              width: 20,
            ),
            label: 'Головна',
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              'assets/user.svg',
              height: 20,
              width: 20,
            ),
            label: 'Особисті дані',
          ),
        ]);
  }
}
