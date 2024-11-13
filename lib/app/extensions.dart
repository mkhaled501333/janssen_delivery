import 'package:intl/intl.dart';

extension Dsd on DateTime {
  String formatt_yMd() {
    String formateeddate = DateFormat('dd-MM-yyyy').format(this);
    return formateeddate;
  }

  String formatt_yMd_hms() {
    String formateeddate = DateFormat('dd-MM-yyyy      HH:MM').format(this);
    return formateeddate;
  }

  int formatt_int() {
    String formateeddate = DateFormat('ddMMyyyy').format(this);
    return formateeddate.to_int();
  }

  String formatt_hms() {
    String formateeddate = DateFormat('hh:mm:ss a').format(this);
    return formateeddate;
  }
}

extension Fer on String {
  int to_int() {
    return int.tryParse(this) ?? 0;
  }

  double to_double() {
    return double.parse(this);
  }
}

extension Fdf on Iterable<num> {
  num count() {
    return isEmpty ? 0 : reduce((a, b) => a + b);
  }
}
