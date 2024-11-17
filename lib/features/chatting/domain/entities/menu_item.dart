import 'package:flutter/material.dart';

class MenuItem {
  final int id;
  final String label;
  final IconData icon;

  MenuItem(this.id, this.label, this.icon);
}

List<MenuItem> menuItems = [
  MenuItem(1, 'Add New Chat', Icons.add),
  MenuItem(2, 'Archive', Icons.archive_rounded),
  MenuItem(3, 'History', Icons.history),
];
