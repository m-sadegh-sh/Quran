import 'package:flutter/widgets.dart';

import 'package:quran/delegates/generators.dart';

class DrawerItem {
  final GeneratorWNP<Widget> onGenerateChild;
  final String title;
  final IconData icon;

  DrawerItem({
    this.onGenerateChild,
    this.title,
    this.icon
  });
}
