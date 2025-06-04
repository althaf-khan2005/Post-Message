import 'package:flutter/material.dart';

class textfiled extends StatelessWidget {

  final TextEditingController text1;
  final String name;
  final bool obscureText;


  final TextInputAction inputAction;
  final Function(String)? onSubmitted;
  final TextCapitalization capitalization;
  final int? minkes;
  final int? max;
  final TextInputType input;


   const textfiled({super.key,
   required this.text1,
   required this.name, 
   required this.obscureText,
   this.capitalization=TextCapitalization.sentences,
   this.inputAction=TextInputAction.none,
   this.onSubmitted,
   this.max=1,
   this.minkes=1,
   this.input=TextInputType.text,
   
   
   });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        minLines: minkes,
        maxLines: max,
          keyboardType:input ,

        textInputAction: inputAction,
       onSubmitted: onSubmitted,
        textCapitalization: capitalization,
        controller: text1,
        obscureText:obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          hintText: name,
          hintStyle: TextStyle(color: Colors.grey.shade500),
          fillColor: Colors.grey.shade200,
          filled: true,
        ),
        
      ),
    );
  }
}