import 'package:flutter/material.dart';

class Button extends StatelessWidget implements PreferredSizeWidget {

  const Button(
      {Key? key,
        required this.ButtonText,
        required this.onTap,
        required this.fontSize,
      })
      : super(key: key);

  final String ButtonText;
  final Function? onTap;
  final double fontSize;

  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onTap!();
      },
      child: Text(
        ButtonText,
        style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 93, 87, 239),
        textStyle: TextStyle(fontSize: fontSize),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
      ),

    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(60.0);

// @override
// // TODO: implement preferredSize
// Size get preferredSize => throw UnimplementedError();

}