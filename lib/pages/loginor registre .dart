import 'package:flutter/material.dart';
import 'package:myapp/pages/login.dart';
import 'package:myapp/pages/registartion.dart';

class Loginorregistre  extends StatefulWidget {
  const Loginorregistre ({super.key});

  @override
  State<Loginorregistre> createState() => _LoginorregistreState();
}

class _LoginorregistreState extends State<Loginorregistre> {

 bool showwhere=true;



 void tooglegate(){
  setState(() {
    showwhere=!showwhere;
  });
 }

  @override
  Widget build(BuildContext context) {
    if(showwhere){
      return Login(showlogin: tooglegate);
    }
    else{
      return Registartion(show: tooglegate);
    }
  }
}