import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:recipes/provider/favorite_provider.dart';
import 'package:recipes/utils/constants.dart';
import 'package:recipes/views/home/widgets/recipe_details_screen.dart';

class StartCookingAndFavoriteButton extends StatelessWidget {
  const StartCookingAndFavoriteButton({
    super.key,
    required this.provider,
    required this.widget,
  });

  final FavoriteProvider provider;
  final RecipeDetailsScreen widget;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: Colors.transparent,
      elevation: 0,
      onPressed: () {},
      label: Row(
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 85, vertical: 10),
                foregroundColor: Colors.white),
            child: const Text(
              "Start Cooking",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: () {
              provider.toggleFavorite(widget.documentSnapshot);
            },
            style: IconButton.styleFrom(
              shape: CircleBorder(
                side: BorderSide(
                  color: Colors.grey.shade300,
                  width: 2,
                ),
              ),
            ),
            icon: Icon(
              provider.isExist(widget.documentSnapshot)
                  ? Iconsax.heart5
                  : Iconsax.heart,
              color: provider.isExist(widget.documentSnapshot)
                  ? Colors.red
                  : Colors.black,
              size: 22,
            ),
          ),
        ],
      ),
    );
  }
}
