import 'package:flutter/material.dart';

class Buttontext extends StatelessWidget {
  final void Function()? ontap;

  const Buttontext({super.key,
  required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      
      child: Container(
        padding: EdgeInsets.all(16),
      //  margin: EdgeInsets.only(right: 13),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
          
        ),

        child: Center(child: Icon(Icons.arrow_upward_outlined)),
      ),
    );
  }
}