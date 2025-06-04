import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Usersdata extends StatelessWidget {
  const Usersdata({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("Users",style: TextStyle(
          color: Colors.grey.shade500,
          fontWeight: FontWeight.bold,
        ),),
        backgroundColor: Colors.grey.shade300,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Users").snapshots(),
          builder: (context, snapshots) {
            // if error

            if (snapshots.hasError) {
              return Text("Error: ${snapshots.hasError}");
            }

            // loading

            else if (snapshots.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            // if no data

            else if (snapshots.data == null) {
              return Text("No Data...");
            }

            // has data

            else if (snapshots.hasData) {
              // get all user so

              final data = snapshots.data!.docs;

              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final datas = data[index];

                    return Column(
                      children: [

                        Container(
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade200,
                          
                           
                          ),
                          child: ListTile(
                            trailing: Icon(Icons.person_4_sharp),
                            title: Text(datas["username"]),
                            subtitle: Text(datas["email"]),
                            
                          ),
                        
                          

                        ),
                        
                      ],
                    );
                  });
            }
            return Text("No data...");
          }),
    );
  }
}
