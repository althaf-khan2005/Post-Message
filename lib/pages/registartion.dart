import 'package:flutter/material.dart';
import 'package:myapp/pages/authservices.dart';
import 'package:myapp/pages/button.dart';
import 'package:myapp/pages/textfiled.dart';

class Registartion extends StatefulWidget {
  final Function()? show;
   const Registartion({super.key,required this.show});

  @override
  State<Registartion> createState() => _RegistartionState();
}

class _RegistartionState extends State<Registartion> {



final email=TextEditingController();
final USer=TextEditingController();
final pass=TextEditingController();
final confpass=TextEditingController();





// this function call the button when create a account

void  createit() async{

  // when login we show the circle to user interct
  final Authservices auth=Authservices();

 showDialog(
  barrierDismissible: false,
      context: context,
       builder: (context)=>Center(
        child: CircularProgressIndicator(
          color: Colors.blue,
        ),
       )
       );


if(pass.text==confpass.text){
 

  try{
   await  auth.createuser(
    email.text,
     pass.text
     );

   Navigator.pop(context);

   auth.storeincloud(email.text, USer.text);
  
  } catch (e){

    // when we get error stop the circle

       Navigator.pop(context);


    showDialog(
      context: context,
       builder: (context)=>AlertDialog(
        title: Text(e.toString()),
       ));
  }

}
else{
  
     Navigator.pop(context);
  
    showDialog(
      context: context,
       builder: (context)=>AlertDialog(
        title: Text("password Wrong"),
       ));
  }
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30),
          
              Icon(
                Icons.lock,
                size: 100,
              ),
          
              SizedBox(height: 40),
          
              // welcome back in app
          
              Text("    Welcome you where be missed  ",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
                fontWeight: FontWeight.bold,
          
              ),),
          
              SizedBox(height: 25),

              //username

              textfiled(text1: USer,
               name: "Username",
                obscureText: false
                ),
                
                SizedBox(height: 10),
            
            // email form 
          
             textfiled(text1: email,
              name: "E-mail",
               obscureText: false,
          
               ),
               
          
               SizedBox(height: 10),


          
               // password form
          
               textfiled(text1: pass,
               name: "Password",
                obscureText:true,
            
                ),
                
              
                 SizedBox(height: 10),
                 
               textfiled(text1: confpass,
               name: "Conform-Password",
                obscureText:true,
            
                ),
                
              
                 SizedBox(height: 10),
          
                // forgot reset button
          
              
                  SizedBox(height: 30),
                
          
                // button to check the given data i correct or not
                     
                mybutton(text: "Create a account",
                ontap: createit,
                ),
          
               
          
                SizedBox(height: 40),
               
          
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey,
                      )),
          
                      Text("Or Continue With",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),),
          
                      Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 0.5,
                      ))
                  ],
                ),
          
                SizedBox(height: 20),
          
                 // google singn button to sign in
          
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () =>Authservices().signInWithGoogle(),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.grey[200],
                        ),
                        child: Image.asset("lib/image/google.png",
                        fit: BoxFit.cover,
                        height: 40,
                        ),
                      ),
                    ),
                  ],
                 ),
                 
                 SizedBox(height: 20),
          
                 // already have a account
          
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Aready have a account? ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),),
                     GestureDetector(
                      onTap: widget.show,
          
                       child: Text("Login",
                       style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                       ),),
                     )
                  ],
                 ),
                  
          
            ],
          ),
        ),
      ),
    );
  }
}