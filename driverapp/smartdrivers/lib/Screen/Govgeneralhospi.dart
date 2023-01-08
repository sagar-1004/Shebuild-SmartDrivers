import 'package:flutter/material.dart';

import 'package:smartdrivers/widgets/appbar.dart';
import 'package:smartdrivers/widgets/hospicontainer.dart';
import 'package:smartdrivers/hospilistapi.dart';

void main() {
  runApp(const GovApp());
}

class GovApp extends StatefulWidget {
  const GovApp({super.key});

  @override
  State<GovApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<GovApp> {
  late Future<List<Users>> users;
  var s;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    users = getUsers(1);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: const Appbar(
            AppBarText: "MultiSpeciality Hospital",
            mew: 28,
          ),
          body: Center(
            child: FutureBuilder<List<Users>>(
                future: users,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Column(children: [
                            HospiContainer(
                                HospiContainerText: snapshot.data![index].name,
                                AvailableValue: snapshot.data![index].icu),
                          ]);
                        });
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
          ),
        ),
      debugShowCheckedModeBanner: false,
    );
  }
}
