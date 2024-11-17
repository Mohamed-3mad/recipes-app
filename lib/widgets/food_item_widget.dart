import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:recipes/widgets/item_text.dart';

class FoodItemsWidget extends StatelessWidget {
  const FoodItemsWidget({
    super.key,
    required this.documentSnapshot,
    this.iconSize = 16,
    this.fSize = 12,
  });

  final double iconSize;
  final double fSize;
  final DocumentSnapshot<Object?> documentSnapshot;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Iconsax.flash_1, size: iconSize, color: Colors.grey),
        ItemText(
            fSize: fSize,
            documentSnapshot: documentSnapshot,
            color: Colors.grey,
            text: "${documentSnapshot['cal']} Cal"),
        const Text(
          " . ",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Colors.grey,
          ),
        ),
        Icon(Iconsax.clock, size: iconSize, color: Colors.grey),
        const SizedBox(width: 5),
        ItemText(
            fSize: fSize,
            documentSnapshot: documentSnapshot,
            color: Colors.grey,
            text: "${documentSnapshot['time']} Min"),
      ],
    );
  }
}
