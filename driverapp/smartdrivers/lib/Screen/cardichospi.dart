import 'package:flutter/material.dart';

import 'package:smartdrivers/widgets/appbar.dart';
import 'package:smartdrivers/widgets/hospicontainer.dart';
void main() {
  runApp(const CardiacApp());
}

class CardiacApp extends StatefulWidget {
  const CardiacApp({super.key});

  @override
  State<CardiacApp> createState() => _HomeAppState();

}
class _HomeAppState extends State<CardiacApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: const Appbar(AppBarText: "Cardiac Hospital", mew: 28,),
        body: ListView(

          children: [
            HospiContainer(HospiContainerText: "Kranti Cardiac Hospital", AvailableValue: 10),
            HospiContainer(HospiContainerText: "Shree Sai Heart Center", AvailableValue: 10),
            HospiContainer(HospiContainerText: "Horizon Multispeciality Hospital", AvailableValue: 10),
            HospiContainer(HospiContainerText: "Dr Mehul Patel Hospital", AvailableValue: 0),
            HospiContainer(HospiContainerText: "Dr Mehul Patel Hospital", AvailableValue: 0)

          ],
        ),
        backgroundColor: const Color.fromARGB(255, 226, 224, 255),
      ),
      debugShowCheckedModeBanner: false,
    );
  }


}
