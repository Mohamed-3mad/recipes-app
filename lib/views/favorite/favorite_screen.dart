import 'package:flutter/material.dart';
import 'package:recipes/provider/favorite_provider.dart';
import 'package:recipes/utils/constants.dart';
import 'package:recipes/views/favorite/widgets/favorite_list_view.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    final favoriteItems = provider.favorites;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        centerTitle: true,
        title: const Text(
          "Favorites",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: favoriteItems.isEmpty
          ? const Center(
              child: Text(
                "No Favorites yet",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          : FavoriteListView(favoriteItems: favoriteItems),
    );
  }
}
