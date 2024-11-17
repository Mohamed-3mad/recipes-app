import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:recipes/provider/favorite_provider.dart';
import 'package:recipes/provider/quantity.dart';
import 'package:recipes/views/home/widgets/image_icons_header.dart';
import 'package:recipes/views/home/widgets/increase_decrease_ingredients_amount.dart';
import 'package:recipes/views/home/widgets/recipe_details.dart';
import 'package:recipes/views/home/widgets/start_cooking_favorite_button.dart';
import 'package:recipes/widgets/food_item_widget.dart';
import 'package:recipes/widgets/item_text.dart';

class RecipeDetailsScreen extends StatefulWidget {
  const RecipeDetailsScreen({super.key, required this.documentSnapshot});
  final DocumentSnapshot<Object?> documentSnapshot;

  @override
  State<RecipeDetailsScreen> createState() => _RecipeDetailsScreenState();
}

class _RecipeDetailsScreenState extends State<RecipeDetailsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final baseAmounts = widget.documentSnapshot['ingredientsAmount']
          .map<double>((amount) => double.parse(amount.toString()))
          .toList();
      Provider.of<QuantityProvider>(context, listen: false)
          .setBaseIngredientAmounts(baseAmounts);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    final quantityProvider = Provider.of<QuantityProvider>(context);

    // التأكد من تطابق الأطوال لتجنب الأخطاء
    final ingredientImages =
        widget.documentSnapshot['ingredientImage'] as List<dynamic>;
    final ingredientNames =
        widget.documentSnapshot['ingredientsName'] as List<dynamic>;
    final ingredientAmounts = quantityProvider.updateIngredientAmounts;

    final minLength = [
      ingredientImages.length,
      ingredientNames.length,
      ingredientAmounts.length
    ].reduce((value, element) => value < element ? value : element);

    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:
          StartCookingAndFavoriteButton(provider: provider, widget: widget),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageAndIconsHeader(widget: widget),
            // Handle drag
            Center(
              child: Container(
                width: 40,
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ItemText(text: widget.documentSnapshot['name'], fSize: 24),
                  const SizedBox(height: 10),
                  FoodItemsWidget(
                    documentSnapshot: widget.documentSnapshot,
                    fSize: 14,
                    iconSize: 20,
                  ),
                  const SizedBox(height: 10),

                  //rating

                  ratingMethod(),
                  const SizedBox(height: 10),
                  IncreaseDecreaseIngredientsAmount(
                      quantityProvider: quantityProvider),
                  const SizedBox(height: 10),
                  //ingredients info
                  RecipeDetails(
                      minLength: minLength,
                      ingredientImages: ingredientImages,
                      ingredientNames: ingredientNames,
                      ingredientAmounts: ingredientAmounts),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row ratingMethod() {
    return Row(
      children: [
        const Icon(Iconsax.star1, color: Colors.amberAccent),
        const SizedBox(width: 5),
        ItemText(
            documentSnapshot: widget.documentSnapshot,
            text: widget.documentSnapshot['rating']),
        ItemText(documentSnapshot: widget.documentSnapshot, text: "/5"),
        const SizedBox(width: 5),
        ItemText(
            documentSnapshot: widget.documentSnapshot,
            text: "${widget.documentSnapshot['reviews'].toString()} Reviews"),
      ],
    );
  }
}
