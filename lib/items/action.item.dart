import 'package:flutter/widgets.dart';
import 'package:redux/redux.dart';

import 'package:quran/delegates/generator.delegate.dart';
import 'package:quran/states/root.state.dart';
import 'action_child.item.dart';

class ActionItem {
  final GeneratorWNP<Widget> onGenerateChild;
  final GeneratorW1P<Store<RootState>, void> onDispatchAction;
  final String tooltip;
  final IconData icon;
  final List<ActionChildItem> children;

  ActionItem({
    this.onGenerateChild,
    this.onDispatchAction,
    this.tooltip,
    this.icon,
    this.children
  });
}
