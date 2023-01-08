import 'package:flutter/material.dart';
import 'package:smartdrivers/Screen/main_page.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {

  const Appbar(
      {Key? key,
        required this.AppBarText,
        })
      : super(key: key);

  final String AppBarText;


  Widget build(BuildContext context) {
    return AppBar(

      title: Text(

        AppBarText,
        style: TextStyle(

            color: Colors.white,
            fontSize: 28,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.person),
          tooltip: 'login Icon',
          onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MainPage()));},
        ),
      ],
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