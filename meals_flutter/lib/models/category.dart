import 'package:flutter/material.dart';

class Category {
  final String id;
  final String tilte;
  final Color color;

  const Category({@required this.id, @required this.tilte, this.color = Colors.orange});
}