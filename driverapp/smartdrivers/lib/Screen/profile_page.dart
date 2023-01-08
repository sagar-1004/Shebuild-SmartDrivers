import 'package:flutter/material.dart';
import 'package:smartdrivers/widgets/appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smartdrivers/widgets/button.dart';

class ProfilePage extends StatefulWidget{
     const ProfilePage({Key? key}):super(key: key);
     @override
     State<ProfilePage> createState() => _HomePageState();
}
class _HomePageState extends State<ProfilePage>{
    final user = FirebaseAuth.instance.currentUser!;
    @override
    Widget build(BuildContext context){
       return Scaffold(
         appBar: Appbar(AppBarText: "Sign in Profile Page", mew: 28,),
         backgroundColor: const Color.fromARGB(255, 226, 224, 255),
         body: Center(
             child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('🚑',
                    style: TextStyle(
                      fontSize: 80
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text('Your Now Smart Driver!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  ),

                  SizedBox(height: 20,),

                  Button(ButtonText: "Sign out", onTap:() { FirebaseAuth.instance.signOut();}, fontSize: 25)

           ],
         )),
       );
    }
}