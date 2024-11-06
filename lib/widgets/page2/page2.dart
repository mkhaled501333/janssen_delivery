import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:geolocator/geolocator.dart';
import 'package:janssen_delivery/widgets/page2/monydetails.dart';
import 'package:janssen_delivery/widgets/page2/orderdatails.dart';

class Page2 extends StatelessWidget {
  const Page2({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          children: [
            Gap(22),
            MonyDetails(),
            Center(
              child: IconButton(
                  onPressed: () async {
                    final p = await _determinePosition(context);
                    if (p != null) {
                      print(p.latitude);
                      print(p.longitude);
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
            OrderDetails()
          ],
        ),
      ),
    );
  }
}

Future<Position?> _determinePosition(BuildContext context) async {
  bool serviceEnabled;
  LocationPermission permission;
  final connection = await ConnectivityWrapper.instance.isConnected;
  //  await InternetConnection.createInstance(
  //   customCheckOptions: [
  //     InternetCheckOption(uri: Uri.parse('https://example.com')),
  //   ],
  // ).hasInternetAccess;
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (connection == true) {
    if (!serviceEnabled) {
      return null;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return null;
      }
    }
    if (permission == LocationPermission.deniedForever) {
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
