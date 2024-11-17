import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ItemText extends StatelessWidget {
  const ItemText({
    super.key,
    this.documentSnapshot,
    required this.text,
    this.fSize = 12,
    this.color,
  });

  final String text;
  final double fSize;
  final Color? color;

  final DocumentSnapshot<Object?>? documentSnapshot;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontWeight: FontWeight.bold, fontSize: fSize, color: color),
    );
  }
}
