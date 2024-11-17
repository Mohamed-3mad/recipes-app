
import 'package:flutter/material.dart';
import 'package:recipes/provider/quantity.dart';
import 'package:recipes/views/home/widgets/quantity_increment_decrement.dart';
import 'package:recipes/widgets/item_text.dart';

class IncreaseDecreaseIngredientsAmount extends StatelessWidget {
  const IncreaseDecreaseIngredientsAmount({
    super.key,
    required this.quantityProvider,
  });

  final QuantityProvider quantityProvider;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemText(text: "Ingredients", fSize: 20),
            ItemText(
                text: "How many servings?",
                fSize: 14,
                color: Colors.grey),
          ],
        ),
        const Spacer(),
        QuantityIncrementDecrement(
            currentNumber: quantityProvider.currentNumber,
            onAdd: () => quantityProvider.increaseQuantity(),
            onRemove: () => quantityProvider.decreaseQuantity())
      ],
    );
  }
}
