import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:janssen_delivery/app/extensions.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 238, 236, 231),
              border: Border.all(),
              borderRadius: BorderRadius.circular(11)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "وقت البدء : ${DateTime.now().formatt_yMd_hms()} ",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const Gap(15),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "عدد الاوردرات : ( 20 )",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Gap(15),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "تم التسليم : ( 22 ) ",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Gap(15),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "تم الالغاء : ( 1 ) ",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Gap(15),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "المتبقى : ( 3 ) ",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Gap(15),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
