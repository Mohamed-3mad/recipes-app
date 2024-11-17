import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:recipes/provider/favorite_provider.dart';
import 'package:recipes/widgets/item_text.dart';

class FavoriteListView extends StatefulWidget {
  const FavoriteListView({
    super.key,
    required this.favoriteItems,
  });

  final List<String> favoriteItems;

  @override
  State<FavoriteListView> createState() => _FavoriteListViewState();
}

class _FavoriteListViewState extends State<FavoriteListView> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return ListView.builder(
      itemCount: widget.favoriteItems.length,
      itemBuilder: (context, index) {
        String favorite = widget.favoriteItems[index];
        return FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance
                .collection("recipes")
                .doc(favorite)
                .get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (!snapshot.hasData || snapshot.data == null) {
                return const Center(child: Text("Error Loading favorites"));
              }
              var favoriteItem = snapshot.data!;
              return Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  favoriteItem['image'],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ItemText(text: favoriteItem['name'], fSize: 16),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  const Icon(Iconsax.flash_1,
                                      size: 16, color: Colors.grey),
                                  ItemText(
                                      documentSnapshot: favoriteItem,
                                      color: Colors.grey,
                                      text: "${favoriteItem['cal']} Cal"),
                                  const Text(
                                    " . ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const Icon(Iconsax.clock,
                                      size: 16, color: Colors.grey),
                                  const SizedBox(width: 5),
                                  ItemText(
                                      documentSnapshot: favoriteItem,
                                      color: Colors.grey,
                                      text: "${favoriteItem['time']} Min"),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    right: 30,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        setState(() {
                          provider.toggleFavorite(favoriteItem);
                        });
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 25,
                      ),
                    ),
                  ),
                ],
              );
            });
      },
    );
  }
}
