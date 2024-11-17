import 'package:flutter/material.dart';

class TIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const TIconButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  IconButton(
      style: IconButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius:   BorderRadius.circular(15)),
        backgroundColor: Colors.white,
        fixedSize:const Size(50, 50),
         
      ),
      onPressed: onPressed,
      icon:Icon(icon) ,
    );
  }
}