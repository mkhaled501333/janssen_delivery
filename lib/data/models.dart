// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/foundation.dart';

class CarModel {
  int ID;
  int carNum;
  int password;
  String carType;
  String drivername;
  String driverPhoneNum;
  String representative;
  CarModel({
    required this.ID,
    required this.carNum,
    required this.password,
    required this.carType,
    required this.drivername,
    required this.driverPhoneNum,
    required this.representative,
  });

  CarModel copyWith({
    int? ID,
    int? carNum,
    int? password,
    String? carType,
    String? drivername,
    String? driverPhoneNum,
    String? representative,
  }) {
    return CarModel(
      ID: ID ?? this.ID,
      carNum: carNum ?? this.carNum,
      password: password ?? this.password,
      carType: carType ?? this.carType,
      drivername: drivername ?? this.drivername,
      driverPhoneNum: driverPhoneNum ?? this.driverPhoneNum,
      representative: representative ?? this.representative,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ID': ID,
      'carNum': carNum,
      'password': password,
      'carType': carType,
      'drivername': drivername,
      'driverPhoneNum': driverPhoneNum,
      'representative': representative,
    };
  }

  factory CarModel.fromMap(Map<String, dynamic> map) {
    return CarModel(
      ID: map['ID'] as int,
      carNum: map['carNum'] as int,
      password: map['password'] as int,
      carType: map['carType'] as String,
      drivername: map['drivername'] as String,
      driverPhoneNum: map['driverPhoneNum'] as String,
      representative: map['representative'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CarModel.fromJson(String source) =>
      CarModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CarModel(ID: $ID, carNum: $carNum, password: $password, carType: $carType, drivername: $drivername, driverPhoneNum: $driverPhoneNum, representative: $representative)';
  }

  @override
  bool operator ==(covariant CarModel other) {
    if (identical(this, other)) return true;

    return other.ID == ID &&
        other.carNum == carNum &&
        other.password == password &&
        other.carType == carType &&
        other.drivername == drivername &&
        other.driverPhoneNum == driverPhoneNum &&
        other.representative == representative;
  }

  @override
  int get hashCode {
    return ID.hashCode ^
        carNum.hashCode ^
        password.hashCode ^
        carType.hashCode ^
        drivername.hashCode ^
        driverPhoneNum.hashCode ^
        representative.hashCode;
  }
}

class OrderModel {
  int id;
  int carNum;
  // cleint
  String clientName;
  String phoneNum;
  String governomate;
  String city;
  String adress;
  List<ItemModel> items;
  //shipping
  bool shipped;
  DateTime shippedTime;
  Location shippedLocation;

  bool canceled;
  String cancelReason;
  DateTime canceltime;
//2
  bool deleverd;
  Location deleverdLocation;
  DateTime deleverdTime;
//3
  bool closed;
  DateTime closedTime;
  //4
  bool payed;
  String payingWay;
  //
  String notes;
  OrderModel({
    required this.id,
    required this.carNum,
    required this.clientName,
    required this.phoneNum,
    required this.governomate,
    required this.city,
    required this.adress,
    required this.items,
    required this.shipped,
    required this.shippedTime,
    required this.shippedLocation,
    required this.canceled,
    required this.cancelReason,
    required this.canceltime,
    required this.deleverd,
    required this.deleverdLocation,
    required this.deleverdTime,
    required this.closed,
    required this.closedTime,
    required this.payed,
    required this.payingWay,
    required this.notes,
  });

  OrderModel copyWith({
    int? id,
    int? carNum,
    String? clientName,
    String? phoneNum,
    String? governomate,
    String? city,
    String? adress,
    List<ItemModel>? items,
    bool? shipped,
    DateTime? shippedTime,
    Location? shippedLocation,
    bool? canceled,
    String? cancelReason,
    DateTime? canceltime,
    bool? deleverd,
    Location? deleverdLocation,
    DateTime? deleverdTime,
    bool? closed,
    DateTime? closedTime,
    bool? payed,
    String? payingWay,
    String? notes,
  }) {
    return OrderModel(
      id: id ?? this.id,
      carNum: carNum ?? this.carNum,
      clientName: clientName ?? this.clientName,
      phoneNum: phoneNum ?? this.phoneNum,
      governomate: governomate ?? this.governomate,
      city: city ?? this.city,
      adress: adress ?? this.adress,
      items: items ?? this.items,
      shipped: shipped ?? this.shipped,
      shippedTime: shippedTime ?? this.shippedTime,
      shippedLocation: shippedLocation ?? this.shippedLocation,
      canceled: canceled ?? this.canceled,
      cancelReason: cancelReason ?? this.cancelReason,
      canceltime: canceltime ?? this.canceltime,
      deleverd: deleverd ?? this.deleverd,
      deleverdLocation: deleverdLocation ?? this.deleverdLocation,
      deleverdTime: deleverdTime ?? this.deleverdTime,
      closed: closed ?? this.closed,
      closedTime: closedTime ?? this.closedTime,
      payed: payed ?? this.payed,
      payingWay: payingWay ?? this.payingWay,
      notes: notes ?? this.notes,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'carNum': carNum,
      'clientName': clientName,
      'phoneNum': phoneNum,
      'governomate': governomate,
      'city': city,
      'adress': adress,
      'items': items.map((x) => x.toMap()).toList(),
      'shipped': shipped,
      'shippedTime': shippedTime.millisecondsSinceEpoch,
      'shippedLocation': shippedLocation.toMap(),
      'canceled': canceled,
      'cancelReason': cancelReason,
      'canceltime': canceltime.millisecondsSinceEpoch,
      'deleverd': deleverd,
      'deleverdLocation': deleverdLocation.toMap(),
      'deleverdTime': deleverdTime.millisecondsSinceEpoch,
      'closed': closed,
      'closedTime': closedTime.millisecondsSinceEpoch,
      'payed': payed,
      'payingWay': payingWay,
      'notes': notes,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'] as int,
      carNum: map['carNum'] as int,
      clientName: map['clientName'] as String,
      phoneNum: map['phoneNum'] as String,
      governomate: map['governomate'] as String,
      city: map['city'] as String,
      adress: map['adress'] as String,
      items: List<ItemModel>.from(
        (map['items'] as List<int>).map<ItemModel>(
          (x) => ItemModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      shipped: map['shipped'] as bool,
      shippedTime:
          DateTime.fromMillisecondsSinceEpoch(map['shippedTime'] as int),
      shippedLocation:
          Location.fromMap(map['shippedLocation'] as Map<String, dynamic>),
      canceled: map['canceled'] as bool,
      cancelReason: map['cancelReason'] as String,
      canceltime: DateTime.fromMillisecondsSinceEpoch(map['canceltime'] as int),
      deleverd: map['deleverd'] as bool,
      deleverdLocation:
          Location.fromMap(map['deleverdLocation'] as Map<String, dynamic>),
      deleverdTime:
          DateTime.fromMillisecondsSinceEpoch(map['deleverdTime'] as int),
      closed: map['closed'] as bool,
      closedTime: DateTime.fromMillisecondsSinceEpoch(map['closedTime'] as int),
      payed: map['payed'] as bool,
      payingWay: map['payingWay'] as String,
      notes: map['notes'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrderModel(id: $id, carNum: $carNum, clientName: $clientName, phoneNum: $phoneNum, governomate: $governomate, city: $city, adress: $adress, items: $items, shipped: $shipped, shippedTime: $shippedTime, shippedLocation: $shippedLocation, canceled: $canceled, cancelReason: $cancelReason, canceltime: $canceltime, deleverd: $deleverd, deleverdLocation: $deleverdLocation, deleverdTime: $deleverdTime, closed: $closed, closedTime: $closedTime, payed: $payed, payingWay: $payingWay, notes: $notes)';
  }

  @override
  bool operator ==(covariant OrderModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.carNum == carNum &&
        other.clientName == clientName &&
        other.phoneNum == phoneNum &&
        other.governomate == governomate &&
        other.city == city &&
        other.adress == adress &&
        listEquals(other.items, items) &&
        other.shipped == shipped &&
        other.shippedTime == shippedTime &&
        other.shippedLocation == shippedLocation &&
        other.canceled == canceled &&
        other.cancelReason == cancelReason &&
        other.canceltime == canceltime &&
        other.deleverd == deleverd &&
        other.deleverdLocation == deleverdLocation &&
        other.deleverdTime == deleverdTime &&
        other.closed == closed &&
        other.closedTime == closedTime &&
        other.payed == payed &&
        other.payingWay == payingWay &&
        other.notes == notes;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        carNum.hashCode ^
        clientName.hashCode ^
        phoneNum.hashCode ^
        governomate.hashCode ^
        city.hashCode ^
        adress.hashCode ^
        items.hashCode ^
        shipped.hashCode ^
        shippedTime.hashCode ^
        shippedLocation.hashCode ^
        canceled.hashCode ^
        cancelReason.hashCode ^
        canceltime.hashCode ^
        deleverd.hashCode ^
        deleverdLocation.hashCode ^
        deleverdTime.hashCode ^
        closed.hashCode ^
        closedTime.hashCode ^
        payed.hashCode ^
        payingWay.hashCode ^
        notes.hashCode;
  }
}

class Location {
  String lat;
  String lon;
  Location({
    required this.lat,
    required this.lon,
  });

  Location copyWith({
    String? lat,
    String? lon,
  }) {
    return Location(
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lat': lat,
      'lon': lon,
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      lat: map['lat'] as String,
      lon: map['lon'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Location.fromJson(String source) =>
      Location.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Location(lat: $lat, lon: $lon)';

  @override
  bool operator ==(covariant Location other) {
    if (identical(this, other)) return true;

    return other.lat == lat && other.lon == lon;
  }

  @override
  int get hashCode => lat.hashCode ^ lon.hashCode;
}

class ItemModel {
  int ID;
  String name;
  int quantitiy;
  double price;
  ItemModel({
    required this.ID,
    required this.name,
    required this.quantitiy,
    required this.price,
  });

  ItemModel copyWith({
    int? ID,
    String? name,
    int? quantitiy,
    double? price,
  }) {
    return ItemModel(
      ID: ID ?? this.ID,
      name: name ?? this.name,
      quantitiy: quantitiy ?? this.quantitiy,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ID': ID,
      'name': name,
      'quantitiy': quantitiy,
      'price': price,
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      ID: map['ID'] as int,
      name: map['name'] as String,
      quantitiy: map['quantitiy'] as int,
      price: map['price'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemModel.fromJson(String source) =>
      ItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ItemModel(ID: $ID, name: $name, quantitiy: $quantitiy, price: $price)';
  }

  @override
  bool operator ==(covariant ItemModel other) {
    if (identical(this, other)) return true;

    return other.ID == ID &&
        other.name == name &&
        other.quantitiy == quantitiy &&
        other.price == price;
  }

  @override
  int get hashCode {
    return ID.hashCode ^ name.hashCode ^ quantitiy.hashCode ^ price.hashCode;
  }
}
