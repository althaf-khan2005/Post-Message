import 'package:flutter/material.dart';

class Like extends StatelessWidget {
  final bool isliked;
  final void Function()? ontap;

  const Like({super.key,
  required this.isliked,
  required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Icon(
        isliked ? Icons.favorite: Icons.favorite_border,
        color: isliked ? Colors.red : Colors.grey,
      ),
    );
  }
}