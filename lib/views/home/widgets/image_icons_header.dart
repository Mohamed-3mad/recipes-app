
import 'package:flutter/material.dart';
import 'package:recipes/views/home/widgets/header_image.dart';
import 'package:recipes/views/home/widgets/icons_header.dart';
import 'package:recipes/views/home/widgets/recipe_details_screen.dart';

class ImageAndIconsHeader extends StatelessWidget {
  const ImageAndIconsHeader({
    super.key,
    required this.widget,
  });

  final RecipeDetailsScreen widget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Image
        HeaderImage(widget: widget),
        const IconsHeader(),
        Positioned(
          left: 0,
          right: 0,
          top: MediaQuery.of(context).size.width / 1.3,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ],
    );
  }
}
