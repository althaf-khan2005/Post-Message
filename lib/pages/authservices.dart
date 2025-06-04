import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authservices {

  final FirebaseAuth user= FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn=GoogleSignIn();



  // login to account using firebase 

  Future<UserCredential?> Login(String email,pass) async{


   try{
     UserCredential userCredential= await user.signInWithEmailAndPassword(
      email: email,
       password: pass,
       );

   } on FirebaseException catch(e){
        throw (e.code);
   }
   return null;
   

  


  }


  // create account for a user

  Future<UserCredential?> createuser(String email,pass) async{
    try{
      UserCredential userCredential=await user.createUserWithEmailAndPassword(
        email: email,
         password: pass,
         );

         userCredential.user?.sendEmailVerification();
    } on FirebaseAuthException catch(e){
      throw(e.code);
    }
    return null;
   
  }

  // google sign in option

   Future signInWithGoogle()async {

    await _googleSignIn.signOut();

    final GoogleSignInAccount? guser=await _googleSignIn.signIn();

    if(guser==null){
      return;
    }
    

    final GoogleSignInAuthentication gauth= await guser.authentication;

    final Credential =GoogleAuthProvider.credential(
      accessToken: gauth.accessToken,
      idToken: gauth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(Credential);
     
  }

  

// singout from the app

Future<void> logout() async{
  await user.signOut();
}



// reset the password link

Future<void> reset(String email) async{
  
  try{

      await user.sendPasswordResetEmail(
        email: email
        );
    
  } on FirebaseAuthException catch(e){
      
      throw(e.code);
  }
  
}


// create the data to store in the cloud database in firebase

Future<void> storeincloud(String email,username) async{
    
    return   await FirebaseFirestore.instance.collection("Users").doc(email).set({
      "email":email,
      "username":username,
    });
}


}