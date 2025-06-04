import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/pages/like.dart';

class Wall extends StatefulWidget {

  
  final String email;
  final String Message;
  final void Function()? ontap;
  String postid;
  
  List<String> likes;


   Wall({super.key,
   required this.Message,
   required this.email,
   required this.ontap,
   required this.likes,
   required this.postid,
  
   });

  @override
  State<Wall> createState() => _WallState();
}

class _WallState extends State<Wall> {


  final currentUser=FirebaseAuth.instance.currentUser!;

   bool isliked =false;

   @override
   void initState(){
    super.initState();
    isliked=widget.likes.contains(currentUser.email);
   }

 void tooglegate(){
     setState(() {
         isliked= ! isliked;
          HapticFeedback.heavyImpact();
     });

     

     DocumentReference postref=FirebaseFirestore.instance.collection("Posts").doc(widget.postid);

     if(isliked){
      postref.update({
        "Likes":FieldValue.arrayUnion([currentUser.email]),
       
      });
       
       
     }
     else{
      postref.update({
        "Likes":FieldValue.arrayRemove([currentUser.email]),
      });
     }
 }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 13),
        GestureDetector(
          onLongPress: () {
           widget.ontap;
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey.shade200,
            ),
            child: Center(
              child: ListTile(
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // like button

                    
                   Like(isliked: isliked, ontap:tooglegate,
                    ),


                    SizedBox(width: 2),
                    Text(widget.likes.length.toString()),

                    // like count

                    

                  ],
                ),
                title: Text(widget.Message),
                subtitle: Text(
                  widget.email,
                  style: TextStyle(
                    color: Colors.grey.shade500,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 1),
      ],
    );
    
  }
}
