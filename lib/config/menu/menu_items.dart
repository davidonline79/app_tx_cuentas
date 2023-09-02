import 'package:flutter/material.dart';

class MenuItem {
  final String link;
  final IconData icon;

  const MenuItem({
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
    link: 'entry_screen',
    icon: Icons.add_box_outlined,
  ),
  MenuItem(
    link: 'trips_screen',
    icon: Icons.car_crash_outlined,
  ),
  MenuItem(
    link: 'closed_screen',
    icon: Icons.close_outlined,
  ),
];
