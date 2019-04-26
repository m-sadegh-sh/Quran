import 'package:flutter/widgets.dart';

import 'action_child_item.dart';

class ActionItem {
  final String routeName;
  final String tooltip;
  final IconData icon;
  final List<ActionChildItem> children;

  ActionItem({
    this.routeName,
    this.tooltip,
    this.icon,
    this.children
  });
}
