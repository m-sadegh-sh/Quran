import 'package:flutter/widgets.dart';

class DrawerItemModel {
  String title;
  IconData icon;

  DrawerItemModel(this.title, this.icon);

  DrawerItemModel.withTitle(this.title);

  DrawerItemModel.withIcon(this.icon);
}
