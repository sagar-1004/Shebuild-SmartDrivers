import 'package:flutter/material.dart';
import 'package:smartdrivers/widgets/appbarmain.dart';
import 'package:smartdrivers/widgets/rowcontain.dart';
import 'package:smartdrivers/widgets/button.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      home: Scaffold(
         appBar: const Appbar(AppBarText: "Smart Drivers",
         ),
         body: Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
              // SizedBox(height: 30,),
               RowCard(RowCardText: "WOMEN'S HOSPITAL"),
               SizedBox(height: 15,),
               RowCard(RowCardText: "MULTISPECIALITY HOSPITAL"),
               SizedBox(height: 15,),
               RowCard(RowCardText: "CARDIC HOSPITAL"),
               SizedBox(height: 15,),
               RowCard(RowCardText: "ORTHOPEDIC HOSPITAL"),
             ],
           ),
         ),
        backgroundColor: const Color.fromARGB(255, 226, 224, 255),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

