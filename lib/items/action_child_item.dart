import 'package:flutter/widgets.dart';

import 'package:quran/delegates/generators.dart';

class ActionChildItem {
  final GeneratorWNP<Widget> onGenerateChild;
  final String actionName;
  final Object value;
  final String text;
  final IconData icon;
  final bool enabled;

  ActionChildItem({
    this.onGenerateChild,
    this.actionName,
    this.value,
    this.text,
    this.icon,
    this.enabled = true
  });
}
