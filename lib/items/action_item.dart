import 'package:flutter/widgets.dart';

import 'package:quran/delegates/generators.dart';
import 'action_child_item.dart';

class ActionItem {
  final GeneratorWNP<Widget> onGenerateChild;
  final String tooltip;
  final IconData icon;
  final List<ActionChildItem> children;

  ActionItem({
    this.onGenerateChild,
    this.tooltip,
    this.icon,
    this.children
  });
}
