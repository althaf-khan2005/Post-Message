import 'package:flutter/material.dart';
import 'package:myapp/pages/authservices.dart';
import 'package:myapp/pages/button.dart';
import 'package:myapp/pages/textfiled.dart';

class Forgot extends StatefulWidget {
  const Forgot({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {

  
  final email = TextEditingController();

  void reset() async {

    Authservices authservices = Authservices();

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) =>  Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              ),
            );

    //reset link

    try {
      await authservices.reset(
        email.text.trim(),
      );


      Navigator.pop(context);

      showDialog(
        barrierDismissible: false,
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Succes"),
                content: Text("Password Reset link sent! Check your email."),
                actions: [
                  TextButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: Text("Ok",style: TextStyle(
                
                  ),
                  ),
                  ),
                ],
              ));
              
    


    } catch (e) {

      Navigator.pop(context);

      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          //  mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 80),
              child: Text(
                "Enter you Email we will send you a Password  Reset Link",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
                textAlign: TextAlign.center,
              ),
            ),
        
            SizedBox(height: 20),
        
            Container(
              margin: EdgeInsets.only(top: 70),
              child: textfiled(
                text1: email,
                name: "Email",
                obscureText: false,
              ),
            ),
        
            SizedBox(height: 50),
        
            // this is button to   resend
        
            mybutton(
              text: "Reset Password",
              ontap: () {
                reset();
              },
            )
          ],
        ),
      ),
    );
  }
}
