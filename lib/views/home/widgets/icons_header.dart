
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:recipes/widgets/icon_button.dart';

class IconsHeader extends StatelessWidget {
  const IconsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      left: 10,
      right: 10,
      child: Row(
        children: [
          TIconButton(
            icon: Icons.arrow_back_ios_new,
            onPressed: () => Navigator.pop(context),
          ),
          const Spacer(),
          TIconButton(
            icon: Iconsax.notification,
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
