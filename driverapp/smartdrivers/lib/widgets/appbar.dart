import 'package:flutter/material.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {

  const Appbar(
      {Key? key,
        required this.AppBarText,
        required this.mew,
      })
      : super(key: key);

  final String AppBarText;
  final double mew;

  Widget build(BuildContext context) {
    return AppBar(

      title: Text(

        AppBarText,
        style: TextStyle(

          color: Colors.white,
          fontSize: mew,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
        ),
      ),

      backgroundColor: const Color.fromARGB(255, 93, 87, 239),
      centerTitle: true,

    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(65.0);

// @override
// // TODO: implement preferredSize
// Size get preferredSize => throw UnimplementedError();

}