import 'package:flutter/material.dart';

class EquiCard extends StatelessWidget implements PreferredSizeWidget {

  const EquiCard(
      {Key? key,
        required this.EquipmentText,
        required this.ans,
      })
      : super(key: key);

  final String EquipmentText;
  final bool ans;

  Widget build(BuildContext context) {
    String emoji = '';
    if(ans == true)
        emoji = '✅';
    else
       emoji ='❌';
      double width70 = MediaQuery.of(context).size.width * 0.70;
      double width10 = MediaQuery.of(context).size.width * 0.10;
      double width08 = MediaQuery.of(context).size.width * 0.02;
      return Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 30.0),
            margin: EdgeInsets.only(left: width10,  top:width08, bottom:width08),
            height: 50,
            width: width70,
            child: Row(
              children:[
                Text(EquipmentText,
                  style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                    fontFamily: 'Roboto',
                ),
              ),

            ]

            ),
            color: const Color.fromARGB(255, 174, 172, 239),

    ),

          Container(
             // padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 30.0),
              margin: EdgeInsets.only( top:width08, bottom:width08, right: width08),
              height: 50,
              width: width10,
              child: Center(child: Text(emoji)),
              color: const Color.fromARGB(255, 174, 172, 239),
          ),

        ],
      );

  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();


// @override
// // TODO: implement preferredSize
// Size get preferredSize => throw UnimplementedError();

}