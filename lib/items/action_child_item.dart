import 'package:flutter/widgets.dart';

class ActionChildItem {
  final String routeName;
  final String actionName;
  final Object value;
  final String text;
  final IconData icon;
  final bool enabled;

  ActionChildItem({
    this.routeName,
    this.actionName,
    this.value,
    this.text,
    this.icon,
    this.enabled = true
  });
}
