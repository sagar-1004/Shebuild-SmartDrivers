import 'package:flutter/material.dart';

class PartialAvailable extends StatelessWidget implements PreferredSizeWidget {

  const PartialAvailable(
      {Key? key,
        required this.Width,
        required this.Aval,
      })
      : super(key: key);

  final double Width;
  final int Aval;
  Widget build(BuildContext context) {
    double W = MediaQuery.of(context).size.width * Width;
    String s = Aval.toString();
    return Container(
      height: 40,
      width: W,
      child: Center(
        child: Text(
          "Available "+ s+"/10",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            fontFamily: 'Roboto',
          ),
        ),
      ),
      color: Colors.yellow,
    );

  }
  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();


// @override
// // TODO: implement preferredSize
// Size get preferredSize => throw UnimplementedError();

}