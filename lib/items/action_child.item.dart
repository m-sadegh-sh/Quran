import 'package:flutter/widgets.dart';

import 'package:quran/delegates/generator.delegate.dart';
import 'package:quran/enumerations/action_child_item_type.dart';

class ActionChildItem {
  final GeneratorWNP<Widget> onGenerateChild;
  final ActionChildItemType actionChildItemType;
  final Object value;
  final String text;
  final IconData icon;
  final bool enabled;

  ActionChildItem({
    this.onGenerateChild,
    this.actionChildItemType,
    this.value,
    this.text,
    this.icon,
    this.enabled = true
  });
}
