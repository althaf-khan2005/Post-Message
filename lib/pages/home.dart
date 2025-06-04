import 'package:flutter/material.dart';
import 'package:myapp/pages/authservices.dart';
import 'package:myapp/pages/buttontext.dart';
import 'package:myapp/pages/firestore.dart';
import 'package:myapp/pages/profile.dart';
import 'package:myapp/pages/textfiled.dart';
import 'package:myapp/pages/user.dart';
import 'package:myapp/pages/wall.dart';

class Home extends StatefulWidget {

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Authservices auth = Authservices();

  final text = TextEditingController();

  bool isliked=false;

  void post({String? doc}) {
    // checking the textfiled is empty

    if (text.text.trim().isNotEmpty) {
      Firestore().post(text.text.trim());

      // after getting the post we cleat the textflied


      // FocusScope.of(context).unfocus();

      text.clear();
    }

   


    // // update fucntion

  }
 



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(
          "Posts",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade500,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.grey[300],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  DrawerHeader(
                    child: Icon(
                      Icons.lock,
                      size: 80,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: ListTile(
                      leading: Icon(Icons.home),
                      title: Text(
                        "Home",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: ListTile(
                      leading: Icon(Icons.person_4_rounded),
                      title: Text(
                        "Profile",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Profile()));
                      },
                    ),
                  ),

                  // user to see how much member are there

                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: ListTile(
                      leading: Icon(Icons.group),
                      title: Text(
                        "Users",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Usersdata()));

                        // navigaitor after going to next page it will pop
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 25, bottom: 25),
                child: ListTile(
                  leading: Icon(Icons.logout),
                  title: Text(
                    "Logout",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Authservices().logout();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: textfiled(
                    input: TextInputType.multiline,
                    minkes: 1,
                    max: 15,
                      text1: text,
                      name: "Say Something...",
                      inputAction: TextInputAction.newline,
                      capitalization: TextCapitalization.sentences,
                      onSubmitted: (value){
                       // post();
                      },
                      obscureText: false),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(right: 10, top: 19),
                  child: Buttontext(ontap:(){ 
                    post();
                
                  }
                  )),
            ],
          ),
          StreamBuilder(
              stream: Firestore().readpost(),
              builder: (context, snaphots) {
                // loading...

                if (snaphots.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                final post = snaphots.data!.docs;

                if (snaphots.data == null || post.isEmpty) {
                  return Padding(
                    padding: EdgeInsets.all(25),
                    child: Center(
                      child: Text("No post are been posted..."),
                    ),
                  );
                }

                return Expanded(
                  child: ListView.builder(
                      itemCount: post.length,
                      itemBuilder: (context, index) {
                        // get indivuial data

                        final data = post[index];

                        // get the message or something

                        String message = data["Message"];
                        String email = data["email"];
                        // String like= data["Likes"];
                      //   int timesnap = data["Timesnap"];

                        // return in listview

                     

                        return Wall(
                          postid: data.id,
                          likes: List<String>.from(data["Likes"] ?? []),
                          Message: message,
                           email: email,
                          
                            ontap: (){
                              
                            });
                      }),
                );
              }),
        ],
      ),
    );
  }
}
