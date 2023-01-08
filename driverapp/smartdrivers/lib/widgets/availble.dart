import 'package:flutter/material.dart';

class Available extends StatelessWidget implements PreferredSizeWidget {

  const Available(
      {Key? key,
       required this.Width,
      })
      : super(key: key);

  final double Width;
  Widget build(BuildContext context) {
    double W = MediaQuery.of(context).size.width * Width;
    return Container(
     height: 40,
      width: W,
      child: Center(
        child: Text(
          "Available",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            fontFamily: 'Roboto',
          ),
        ),
      ),
     color: Colors.lightGreen,
    );

  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();


// @override
// // TODO: implement preferredSize
// Size get preferredSize => throw UnimplementedError();

}