import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {

   Profile({super.key});


 final  User? user= FirebaseAuth.instance.currentUser;

  // going to fecth data from the dabase

  Future<DocumentSnapshot<Map<String ,dynamic>>> getuserdetail() async{
    return await FirebaseFirestore.instance.collection("Users").
    doc(user!.email).
    get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("Profile",
        style: TextStyle(
          color: Colors.grey.shade500,
          fontWeight: FontWeight.bold,
        ),),
        backgroundColor: Colors.grey.shade300,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back))
      ),

      body: FutureBuilder<DocumentSnapshot<Map<String ,dynamic>>>(
        future: getuserdetail(), 
        builder: (context,snapshots){

          // loading

          if(snapshots.connectionState==ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          }

          //has error

          else if(snapshots.hasError){
           return Text("Error: ${snapshots.hasError}");
          }

          // has data

          else if(snapshots.hasData){
             Map <String, dynamic>? data = snapshots.data!.data();

             return Center(
               child: Column(
              //  mainAxisAlignment: MainAxisAlignment.center,
             // crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: 20),

                  Container(
                    padding: EdgeInsets.all(35),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey.shade200,
                    ),
                    child: Icon(Icons.person_4_sharp,
                    size: 45,
                    )),
                    
                    SizedBox(height: 20),

                  Text(data!["username"],style: TextStyle(
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.bold,

                  ),),

                  SizedBox(height: 5),
               
                  Text(data["email"],style: TextStyle(
                    color: Colors.lightBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),),
                 
                  
                ],
               ),
             );
          }
          else{
            return Text("No User found...");
          }
        
        } 
    
        
        ),

      
    );
  }
}

