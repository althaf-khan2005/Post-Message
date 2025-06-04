import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Firestore {

// we are you perfore the task in backend - database in the operation like the CRUD operation 



// user data

User? user =FirebaseAuth.instance.currentUser!;

// post message in cloud

Future<void> post(String message){
  return FirebaseFirestore.instance.collection("Posts").add({
    "email":user!.email,
    "Message":message,
    "Timesnap":Timestamp.now(),
    "Likes":[],
  });
}

//query snapshots

Stream<QuerySnapshot> readpost(){

  final Stream=FirebaseFirestore.instance.collection("Posts").
  orderBy("Timesnap",descending: true).
  snapshots();
  
  return Stream;
}

// update data 

Future<void> update(String doc,newMeassage){
  return FirebaseFirestore.instance.collection("Posts").doc(doc).update(newMeassage);
  }




// delete the post 

Future<void> delete (String doc){
  return FirebaseFirestore.instance.collection("Posts").doc(doc).delete();
}


}