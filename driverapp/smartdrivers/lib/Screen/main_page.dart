import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smartdrivers/Screen/login_page.dart';
import 'package:smartdrivers/Screen/login_page.dart';
import 'package:smartdrivers/widgets/appbar.dart';
import 'package:smartdrivers/widgets/button.dart';
import 'package:smartdrivers/Screen/profile_page.dart';
import 'package:smartdrivers/Screen/auth_page.dart';

class MainPage extends StatelessWidget{
    const MainPage({Key? key}): super(key: key);
     @override
     Widget build(BuildContext context){
          return Scaffold(

            body: StreamBuilder<User?>(
               stream: FirebaseAuth.instance.authStateChanges(),
               builder: (context, snapshot){
                 if(snapshot.hasData)
                    return ProfilePage();
                 else{
                    return AuthPage();
                 }
               },
            ),
          );
     }
    }