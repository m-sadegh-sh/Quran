import 'package:flutter/widgets.dart';

import 'package:quran/delegates/generator.delegate.dart';
import 'action_child.item.dart';

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
