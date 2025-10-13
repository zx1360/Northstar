import 'package:flutter/material.dart';

class DirectoryItem {
  final IconData icon;
  final String title;
  final String path;
  final Color color;

  DirectoryItem({
    required this.icon,
    required this.title,
    required this.path,
    required this.color,
  });
}