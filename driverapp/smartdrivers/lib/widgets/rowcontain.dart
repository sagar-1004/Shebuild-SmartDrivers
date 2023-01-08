import 'package:flutter/material.dart';
import 'package:smartdrivers/Screen/womenhospi.dart';
import 'package:smartdrivers/Screen/Govgeneralhospi.dart';
import 'package:smartdrivers/Screen/cardichospi.dart';
import 'package:smartdrivers/Screen/orthopedic.dart';
class RowCard extends StatelessWidget implements PreferredSizeWidget {

  const RowCard(
      {Key? key,
        required this.RowCardText,
      })
      : super(key: key);

  final String RowCardText;

  Widget build(BuildContext context) {
    double width80 = MediaQuery.of(context).size.width * 0.80;
    return InkWell(

      splashColor:Colors.indigoAccent,
      onTap: () {
        if(RowCardText == "WOMEN'S HOSPITAL")
           Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MyApp()));
        else if(RowCardText == "MULTISPECIALITY HOSPITAL")
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const GovApp()));
        else if(RowCardText == "CARDIC HOSPITAL")
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CardiacApp()));
        else if(RowCardText == "ORTHOPEDIC HOSPITAL")
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const OrthoApp()));

      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        height: 80,
        width: width80,

        child: Center(
          child: Text(
            RowCardText,

            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,

              fontFamily: 'Roboto',
            ),

          ),
        ),
        color: const Color.fromARGB(255, 174, 172, 239),

        // decoration: BoxDecoration(
        //   borderRadius: const BorderRadius.all(const Radius.circular(5)),
        // ),
          
      ),
    );

  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();


// @override
// // TODO: implement preferredSize
// Size get preferredSize => throw UnimplementedError();

}