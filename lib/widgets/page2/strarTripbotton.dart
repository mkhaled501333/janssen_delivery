import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:janssen_delivery/data/controller.dart';
import 'package:janssen_delivery/data/models/location.dart';
import 'package:provider/provider.dart';

class startTripbotton extends StatelessWidget {
  const startTripbotton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderController>(
      builder: (context, myType, child) {
        return Visibility(
            visible: myType.orders.values.isEmpty
                ? false
                : myType.orders.values.first.shipped == false,
            child: Column(
              children: [
                Center(
                  child: IconButton(
                      onPressed: () async {
                        final p = await _determinePosition(context);
                        if (p != null) {
                          for (var e in myType.orders.values) {
                            e.shipped = true;
                            e.shippedTime = DateTime.now();
                            e.shippedLocation = Location(
                                lat: p.latitude.toString(),
                                lon: p.longitude.toString());
                            myType.updateRecord(e);
                          }
                        }
                      },
                      icon: Container(
                        decoration: const BoxDecoration(
                            color: Colors.teal, shape: BoxShape.circle),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                              color: Colors.white,
                              size: 99,
                              Icons.power_settings_new),
                        ),
                      )),
                ),
                const Text('اضغط لبدء الرحله'),
              ],
            ));
      },
    );
  }
}

Future<Position?> _determinePosition(BuildContext context) async {
  bool serviceEnabled;
  LocationPermission permission;
  final connection = await ConnectivityWrapper.instance.isConnected;
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (connection == true) {
    // if location is not opended
    if (!serviceEnabled) {
      Geolocator.openLocationSettings();
      return null;
    }
    permission = await Geolocator.requestPermission();
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      print(3);

      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print("permition is denied ");

        return null;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      print("permition is denied for ever");

      return null;
    }

    return await Geolocator.getCurrentPosition();
  } else {
    showDialog(
        context: context,
        builder: (c) => AlertDialog(
              content: Container(
                child: const Text("لا يوجد اتصال ب الانترنت"),
              ),
            ));
    return null;
  }
}
