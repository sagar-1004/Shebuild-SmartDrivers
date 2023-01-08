import 'package:flutter/material.dart';

import 'package:smartdrivers/widgets/appbar.dart';
import 'package:smartdrivers/widgets/hospicontainer.dart';
import 'package:smartdrivers/Constant/HospitalList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _HomeAppState();

}
class _HomeAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
   // int Listsize = Hospitals.length;
    return MaterialApp(
      home: Scaffold(
        appBar: const Appbar(AppBarText: "Women's Hospital",mew: 28,),
        body: ListView(
          children: [

            HospiContainer(HospiContainerText: "Namaha Women's Hospital", AvailableValue: 10),
            HospiContainer(HospiContainerText: "Sangli Government Hospital", AvailableValue: 10),
            HospiContainer(HospiContainerText: "Rathi Hospital", AvailableValue: 10),
            HospiContainer(HospiContainerText: "Shreekala Hospital", AvailableValue: 7),
            HospiContainer(HospiContainerText: "Prajkta Maternity & Sergical Hospital", AvailableValue: 0)

          ],
        ),
        backgroundColor: const Color.fromARGB(255, 226, 224, 255),
      ),
      debugShowCheckedModeBanner: false,
    );
  }


}
