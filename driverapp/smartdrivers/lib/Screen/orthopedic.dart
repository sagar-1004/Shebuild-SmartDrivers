import 'package:flutter/material.dart';

import 'package:smartdrivers/widgets/appbar.dart';
import 'package:smartdrivers/widgets/hospicontainer.dart';
void main() {
  runApp(const OrthoApp());
}

class OrthoApp extends StatefulWidget {
  const OrthoApp({super.key});

  @override
  State<OrthoApp> createState() => _HomeAppState();

}
class _HomeAppState extends State<OrthoApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: const Appbar(AppBarText: "Orthopedic Hospital",mew: 28,),
        body: ListView(
          children: [
            HospiContainer(HospiContainerText: "Khilare Orthopedic & general Hospital", AvailableValue: 10),
            HospiContainer(HospiContainerText: "Horizon Multispeciality Hospital", AvailableValue: 4),
            HospiContainer(HospiContainerText: "Naik Orthopeic hospital", AvailableValue: 0),
            HospiContainer(HospiContainerText: "Dr Karnalkar Orthopedic hospital", AvailableValue: 0)

          ],
        ),
        backgroundColor: const Color.fromARGB(255, 226, 224, 255),
      ),

      debugShowCheckedModeBanner: false,
    );
  }


}
