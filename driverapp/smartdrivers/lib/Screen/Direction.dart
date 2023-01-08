import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latlg2;
import 'package:smartdrivers/widgets/appbar.dart';
import 'package:smartdrivers/widgets/button.dart';
import 'package:smartdrivers/Screen/google_direction.dart';

class DirectionPage extends StatelessWidget implements PreferredSizeWidget {


  const DirectionPage({Key? key,
    required this.hospiCardText,
  })
      : super(key: key);

  final String hospiCardText;
  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      appBar: Appbar(AppBarText: "Direction", mew: 26,),
     body: MyDirection(),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();

}

class MyDirection extends StatefulWidget {
  const MyDirection({super.key});

  @override
  State<MyDirection> createState() => _MyDirection();
}
class _MyDirection extends State<MyDirection> {
    String locationMessage = "";
    void getCurrentLocation() async{
        var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
       // var lastPosition = await Geolocator.getLastKnownPosition();


        setState(() {
            locationMessage = "$position.latitude, $position.longitude";
        });
    }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 300,
              child: FlutterMap(
                options: MapOptions(
                  center: latlg2.LatLng(20.803200, 78.136831),
                  zoom: 17.2,
                ),
                nonRotatedChildren: [
                  AttributionWidget.defaultWidget(
                    source: 'OpenStreetMap contributors',
                    onSourceTapped: null,
                  ),
                ],
                children: [
                  TileLayer(
                    urlTemplate: "https://api.mapbox.com/styles/v1/mrugank/clcliy2yj003t14o554ajeucx/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibXJ1Z2FuayIsImEiOiJjbGNsaGZpcmswbjllM3FwZnh3ZjI0Nms3In0.yl-wka9DTyKxwoovd3mvXw",
                    additionalOptions: {
                      'accessToken': 'pk.eyJ1IjoibXJ1Z2FuayIsImEiOiJjbGNsaGZpcmswbjllM3FwZnh3ZjI0Nms3In0.yl-wka9DTyKxwoovd3mvXw',
                      'id': 'mapbox.satellite'
                    },
                  ),
                ],

              ),
        ),
        Text("Position : $locationMessage"),

        Button(ButtonText: "get location", onTap: (){ MapScreen();}, fontSize: 25),
      ],
    );
  }
}
