 import 'package:flutter/material.dart';
import 'package:smartdrivers/Screen/login_page.dart';
 //import 'package:smartdrivers/widgets/appbar.dart';
 import 'package:smartdrivers/Screen/register.dart';

 class AuthPage extends StatefulWidget{
   const AuthPage({Key? key}):super(key: key);
   @override
   State<AuthPage> createState() => _AuthPageState();
 }
 class _AuthPageState extends State<AuthPage>{
  bool showLoginPage = true;
  void toggleScreen(){
    setState(() {
       showLoginPage = ! showLoginPage;
    });
  }
   @override
   Widget build(BuildContext context){
      if(showLoginPage){
         return LoginPage(showRegisterPage: toggleScreen);
      }
      else{
         return RegisterPage(showLoginPage: toggleScreen);
      }
   }
 }