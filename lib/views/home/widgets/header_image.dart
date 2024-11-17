
import 'package:flutter/material.dart';
import 'package:recipes/views/home/widgets/recipe_details_screen.dart';

class HeaderImage extends StatelessWidget {
  const HeaderImage({
    super.key,
    required this.widget,
  });

  final RecipeDetailsScreen widget;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.documentSnapshot['image'],
      child: Container(
        height: MediaQuery.of(context).size.height / 2.1,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(widget.documentSnapshot['image']),
          ),
        ),
      ),
    );
  }
}