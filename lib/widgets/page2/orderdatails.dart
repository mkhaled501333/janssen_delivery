import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:janssen_delivery/app/extensions.dart';
import 'package:janssen_delivery/data/controller.dart';
import 'package:provider/provider.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderController>(
      builder: (context, myType, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 238, 236, 231),
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
                          "وقت البدء : ${myType.orders.values.isEmpty || myType.orders.values.first.shippedTime.year == -1 ? '' : myType.orders.values.first.shippedTime.formatt_yMd_hms()} ",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const Gap(15),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "عدد الاوردرات : ( ${myType.totalOrders} )",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const Gap(15),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "تم التسليم : ( ${myType.deleverd} ) ",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const Gap(15),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "تم الالغاء : ( ${myType.canceled} ) ",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const Gap(15),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "المتبقى : ( ${myType.totalOrders - myType.deleverd - myType.canceled} ) ",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const Gap(15),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
