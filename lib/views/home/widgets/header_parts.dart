
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:recipes/widgets/icon_button.dart';

class HeaderParts extends StatelessWidget {
  const HeaderParts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "What are you\ncooking today?",
          style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              height: 1),
        ),
        const Spacer(),
        TIconButton(
          icon: Iconsax.notification,
          onPressed: () {},
        ),
      ],
    );
  }
}
