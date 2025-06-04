import 'package:flutter/material.dart';
import 'package:myapp/pages/authservices.dart';
import 'package:myapp/pages/button.dart';
import 'package:myapp/pages/forgot.dart';
import 'package:myapp/pages/textfiled.dart';

class Login extends StatefulWidget {
  final Function()? showlogin;

  const Login({super.key,required this.showlogin});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

final email=TextEditingController();
final pass=TextEditingController();





// this function call the button when create a account

void  loginto() async{

final Authservices auth=Authservices();
  
  // when login we show the circle to user interct
  showDialog(
    barrierDismissible: false,
      context: context,
       builder: (context)=>Center(
        child: CircularProgressIndicator(
          color: Colors.blue,
        ),
       ),
       );
 

  try{
    await auth.Login(
    email.text,
     pass.text
     );

     if(context.mounted){

   Navigator.pop(context);
     }

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 60),
          
              Icon(
                Icons.lock,
                size: 100,
              ),
          
              SizedBox(height: 50),
          
              // welcome back in app
          
              Text("    Welcome you where be missed  ",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
                fontWeight: FontWeight.bold,
          
              ),),
          
              SizedBox(height: 25),
            
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
          
                // forgot reset button
          
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Forgot()));
                        },
                        child: Text("Forgot password",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                    ),
                  ],
                ),
                  SizedBox(height: 30),
                
          
                // button to check the given data i correct or not
                     
                mybutton(text: "Login",
                ontap: loginto,
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
          
                SizedBox(height: 40),
          
                 // google singn button to sign in
          
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: ()=>Authservices().signInWithGoogle(),
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
                 
                 SizedBox(height: 40),
          
                 // already have a account
          
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't Have a account ? ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),),
                     GestureDetector(
                      onTap: widget.showlogin,
                       child: Text("Create a account",
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
