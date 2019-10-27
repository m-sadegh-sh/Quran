import 'package:flutter/widgets.dart';

import 'package:quran/delegates/generator.delegate.dart';
import 'action_child.item.dart';

class ActionItem<TState> {
  final GeneratorWNP<Widget> onGenerateChild;
  final GeneratorW1P<TState, TState> onUpdateState;
  final String tooltip;
  final IconData icon;
  final List<ActionChildItem> children;

  ActionItem({
    this.onGenerateChild,
    this.onUpdateState,
    this.tooltip,
    this.icon,
    this.children
  });
}
