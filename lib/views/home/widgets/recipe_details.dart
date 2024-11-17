
import 'package:flutter/material.dart';

class RecipeDetails extends StatelessWidget {
  const RecipeDetails({
    super.key,
    required this.minLength,
    required this.ingredientImages,
    required this.ingredientNames,
    required this.ingredientAmounts,
  });

  final int minLength;
  final List ingredientImages;
  final List ingredientNames;
  final List<String> ingredientAmounts;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        minLength,
        (index) => Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Ingredient image
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      ingredientImages[index],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              // Ingredient name
              Expanded(
                child: Text(
                  ingredientNames[index],
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
              // Ingredient amount
              Text(
                "${ingredientAmounts[index]}gm",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
