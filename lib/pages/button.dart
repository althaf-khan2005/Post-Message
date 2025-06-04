import 'package:flutter/material.dart';

class mybutton extends StatelessWidget {

final String text;
final Function()? ontap;


  const mybutton({super.key,
  required this.text,
  required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25 ),
        child: Container(
          padding: EdgeInsets.all(25),
         decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
          
         ),child: Center(
           child: Text(text,
           style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
           ),),
         ),
        ),
      ),
    );
  }
}