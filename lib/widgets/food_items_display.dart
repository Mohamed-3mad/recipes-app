import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:recipes/provider/favorite_provider.dart';
import 'package:recipes/views/home/widgets/recipe_details_screen.dart';
import 'package:recipes/widgets/food_item_widget.dart';
class FoodItemsDisplay extends StatelessWidget {
  const FoodItemsDisplay({super.key, required this.documentSnapshot});

  final DocumentSnapshot<Object?> documentSnapshot;

  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    RecipeDetailsScreen(documentSnapshot: documentSnapshot)));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        width: 230,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: documentSnapshot['image'],
                  child: Container(
                    width: double.infinity,
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            documentSnapshot['image'],
                          )),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(documentSnapshot['name'],
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 17)),
                const SizedBox(height: 5),
                FoodItemsWidget(documentSnapshot: documentSnapshot),
              ],
            ),

            //Favorite Button
            Positioned(
              top: 5,
              right: 5,
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.white,
                child: IconButton(
                  onPressed: () {
                    provider.toggleFavorite(documentSnapshot);
                  },
                  icon: Icon(
                    provider.isExist(documentSnapshot)
                        ? Iconsax.heart5
                        : Iconsax.heart,
                    color: provider.isExist(documentSnapshot)
                        ? Colors.red
                        : Colors.black,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

