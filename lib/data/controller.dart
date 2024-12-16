import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:janssen_delivery/app/extensions.dart';
import 'package:janssen_delivery/data/models/orders.dart';
import 'package:janssen_delivery/widgets/login/loginController.dart';

class OrderController extends ChangeNotifier {
  Map<String, OrderModel> orders = {};
  getData() {
    once();
    // update();
  }

  once() async {
    print('once');
    DatabaseReference ref = FirebaseDatabase.instance.ref("orders/");
    final d = ref.orderByChild('closed').equalTo(false);
    d.once().then((onValue) {
      print('once 2');
      for (var element in onValue.snapshot.children) {
        final order = OrderModel.fromJson(jsonEncode(element.value));
        if (order.carNum == carNum) {
          orders.addAll({order.id.toString(): order});
        }
      }
      notifyListeners();
    });
  }

  update() {
    FirebaseDatabase.instance.ref("orders").onChildChanged.listen((onValue) {
      Map<String, dynamic> data =
          jsonDecode(jsonEncode(onValue.snapshot.value));
      final record = OrderModel.fromMap(data);
      orders.addAll({record.id.toString(): record});
      notifyListeners();
    });
    FirebaseDatabase.instance.ref("orders").onChildAdded.listen((onValue) {
      Map<String, dynamic> data =
          jsonDecode(jsonEncode(onValue.snapshot.value));
      final record = OrderModel.fromMap(data);
      orders.addAll({record.id.toString(): record});
      notifyListeners();
    });
  }

  updateRecord(OrderModel order) {
    FirebaseDatabase.instance.ref("orders/${order.id}").set(order.toMap());
    notifyListeners();
  }

  int get totalOrders => orders.length;
  int get deleverd => orders.values.where((e) => e.deleverd == true).length;
  int get canceled => orders.values.where((e) => e.canceled == true).length;
  num get totalReserved =>
      orders.values.expand((e) => e.items).map((e) => e.price).count();
  num get cargedAmount => orders.values.map((e) => e.chargedamount).count();
  int pageindex = 0;
  refreshUI() => notifyListeners();
}
