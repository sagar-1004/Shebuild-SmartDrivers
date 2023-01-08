import 'package:flutter/material.dart';
import 'package:smartdrivers/widgets/rowcontain.dart';
import 'package:smartdrivers/widgets/button.dart';
import 'package:smartdrivers/widgets/availble.dart';
import 'package:smartdrivers/widgets/unavailable.dart';
import 'package:smartdrivers/widgets/partiallyavai.dart';
import 'package:smartdrivers/Screen/Hospitalinfo.dart';
class HospiContainer extends StatelessWidget implements PreferredSizeWidget {

  const HospiContainer(
      {Key? key,
        required this.HospiContainerText,
        required this.AvailableValue,
      })
      : super(key: key);

  final String HospiContainerText;
  final int AvailableValue;

  Widget build(BuildContext context) {
    double fs =  MediaQuery.of(context).size.width * 0.045;
    if(HospiContainerText.length>25)
        fs = MediaQuery.of(context).size.width * 0.035;
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: 18, horizontal: 18),
        child: Center(
          child: Column(
             children: [
               RowCard(RowCardText: HospiContainerText),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,

                 children: [
                   if(AvailableValue == 10)
                     Available(Width: 0.50)
                   else if(AvailableValue == 0)
                     Unavailable(Width: 0.50)
                   else
                     PartialAvailable(Width: 0.50,Aval: AvailableValue,),
                   SizedBox(width: 15,),

                   Button(ButtonText: "More", onTap: (){Navigator.of(context).push(
                       MaterialPageRoute(builder: (context) =>
                           HospiPage(HospiCardText:HospiContainerText,fs: fs, available: AvailableValue, ),
                       ));
                     }, fontSize: 20)
                 ],
               )
             ],
          ),
        ),
       padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
     //  width: width90,
       color: Colors.white,
    );

  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();


// @override
// // TODO: implement preferredSize
// Size get preferredSize => throw UnimplementedError();

}