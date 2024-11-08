import 'package:flutter/material.dart';
import 'package:janssen_delivery/data/models.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

class LoginController extends ChangeNotifier {
  bool loggedIn = false;
  int? carNum;

  Login() {
    // final supabase = Supabase.instance.client;
    // supabase.from("cars").insert({
    //   'body': CarModel(
    //           ID: 4545445,
    //           carNum: 54,
    //           password: 111,
    //           carType: '',
    //           drivername: "drivername",
    //           driverPhoneNum: '5544',
    //           representative: "representative")
    //       .toMap()
    // });
    //   FirebaseDatabase.instance
    //       .ref()
    //       .child("cars")
    //       .orderByValue()
    //       .equalTo(3)
    //       .get()
    //       .then((v) {
    //     print(v.value);
    //     print(v.key);
    //     print(v.exists);
    //     print(v.children);
    //   });
  }
}
