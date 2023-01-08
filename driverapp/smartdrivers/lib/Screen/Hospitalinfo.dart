import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import 'package:smartdrivers/widgets/appbar.dart';
import 'package:smartdrivers/Constant/Equipment.dart';

import 'package:smartdrivers/widgets/availble.dart';
import 'package:smartdrivers/widgets/partiallyavai.dart';
import 'package:smartdrivers/widgets/unavailable.dart';
import 'package:smartdrivers/widgets/button.dart';



import 'package:smartdrivers/widgets/equipmentrow.dart';

// here also calculate the current location and get direction
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';


class HospiPage extends StatelessWidget implements PreferredSizeWidget {
  const HospiPage({Key? key,
    required this.HospiCardText,
    required this.fs,
    required this.available,
  })
      : super(key: key);

  final String HospiCardText;
  final double fs;
  final int available;

  Widget build(BuildContext context) {


    return Scaffold(
          appBar: Appbar(AppBarText: HospiCardText,mew: fs,),
          body:  MyStatefulWidget(hospiCardText: HospiCardText,fs: fs, available: available,),

      backgroundColor: const Color.fromARGB(255, 226, 224, 255),
    );

  }
  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();

}

class MyStatefulWidget extends StatefulWidget {


  const MyStatefulWidget({Key? key,
    required this.hospiCardText,
    required this.fs,
    required this.available,
  })
      : super(key: key);
  final String hospiCardText;
  final double fs;
  final int available;
  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState(HospiCardText: hospiCardText, fs: fs, available: available);
}
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  _MyStatefulWidgetState({Key? key,
    required this.HospiCardText,
    required this.fs,
    required this.available,
  }) ;


  final String HospiCardText;
  final double fs;
  final int available;

  //redirect
  GoogleMapController? _controller;
  Location currentLocation = Location();

  double lat = 0.0;
  double lon = 0.0;
  double dlat = 0.0;
  double dlon = 0.0;
  String ll = '';
  String lo = '';
  String dll = '';
  String dlo = '';

  String url = '';
  String phone = 'tel:+919096688086';

  void getLocation() async{

    currentLocation.onLocationChanged.listen((LocationData loc){

      _controller?.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
        target: LatLng(loc.latitude ?? 0.0,loc.longitude?? 0.0),
        zoom: 12.0,
      )));



      lat = loc.latitude!;
      ll = lat.toString();

      lon = loc.longitude!;
      lo = lon.toString();
         
      dlat = 16.874223085859203;
      dll = lat.toString();

      dlon = 74.5804241227424;
      dlo = lon.toString();


      url = 'https://www.google.com/maps/dir/?api=1&origin=$ll,$lo&destination=$dlat,$dlon &travelmode=driving&dir_action=navigate';

    });
  }

  @override
  void initState(){
    super.initState();
    setState(() {
      getLocation();
    });
  }


  _launchURL(String url) async {
    Uri u= Uri.parse(url);
    if (await canLaunchUrl(u)) {
      await launchUrl(u);
    } else {
      throw 'Could not launch $url';
    }
  }
  
  _llaunchURL(String phone) async {
    Uri u= Uri.parse(phone);
    if (await canLaunchUrl(u)) {
      await launchUrl(u);
    } else {
      throw 'Could not launch $url';
    }
  }
 

  


  @override
  Widget build(BuildContext context) {
    double width80 = MediaQuery.of(context).size.width * 0.80;
    double width5 = MediaQuery.of(context).size.width * 0.04;
    // Map<String, bool> eq = main();
    return Column(
      children: [
        if(available == 10)
          Available(Width: width80)
        else
          if(available == 0)
            Unavailable(Width: width80)
          else
            PartialAvailable(Width: width80, Aval: available),
        Container(
          margin: EdgeInsets.symmetric(vertical: width5, horizontal: width5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Button(ButtonText: "Direction", onTap: ()async{_launchURL(url);}, fontSize: 20),
              SizedBox(width: width5),
              Button(ButtonText: 'call', onTap: () async{
                  FlutterPhoneDirectCaller.callNumber('+91 9970306741');
              }, fontSize: 20),
            ],
          ),

        ),
        // for (String key in eq.keys)
        //   EquiCard(EquipmentText: key, ans: false),


      ],
    );

  }
}
