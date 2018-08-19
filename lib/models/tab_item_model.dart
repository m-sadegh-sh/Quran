import 'package:flutter/widgets.dart';

class TabItemModel {
  String text;
  IconData icon;

  TabItemModel(this.text, this.icon);

  TabItemModel.withText(this.text);

  TabItemModel.withIcon(this.icon);
}
