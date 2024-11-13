import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:janssen_delivery/data/models/orders.dart';
import 'package:janssen_delivery/widgets/page1/page1.dart';
import 'package:janssen_delivery/widgets/page3/itemDatails.dart';

class ItemHeader extends StatelessWidget {
  const ItemHeader({super.key, required this.order});
  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    Color blue = const Color.fromARGB(255, 0, 5, 241);
    Color green = const Color.fromARGB(255, 20, 177, 57);
    Color red = const Color.fromARGB(255, 241, 0, 20);
    Color colorc() {
      if (order.canceled == true) {
        return red;
      } else if (order.deleverd == true) {
        return green;
      } else {
        return blue;
      }
    }

    String text() {
      if (order.canceled == true) {
        return "canceld";
      } else if (order.deleverd == true) {
        return "deleverd";
      } else {
        return "On my way";
      }
    }

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ItemDetails(order: order)));
      },
      child: Padding(
        padding: const EdgeInsets.only(
          left: 9,
          right: 9,
          top: 5,
        ),
        child: Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 233, 224, 108),
              border: Border.all(color: colorc(), width: 2.5),
              borderRadius: const BorderRadius.all(
                Radius.circular(9),
              )),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 7, top: 11, left: 5, right: 11),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Gap(7),
                        Container(
                          decoration: BoxDecoration(
                              color: colorc(),
                              borderRadius: BorderRadius.circular(50)),
                          width: 25,
                          height: 25,
                          child: Center(
                              child: Text(
                            "${order.orderNum}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w900),
                          )),
                        ),
                        const Gap(7),
                        Text(
                          order.phoneNum,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w900),
                        ),
                        const Gap(7),
                        Icon(
                          CupertinoIcons.flame_fill,
                          color: HexColor("FE4206"),
                        ),
                      ],
                    ),
                    const Gap(5),
                    Row(
                      children: [
                        Text(
                          " ج م ${order.items.map((e) => e.price).reduce((a, b) => a + b).toStringAsFixed(2)}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w900),
                        ),
                        const Gap(6),
                        Container(
                          decoration: BoxDecoration(
                              color: colorc(),
                              borderRadius: BorderRadius.circular(6)),
                          width: 100,
                          height: 25,
                          child: Center(
                              child: Text(
                            text(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w900),
                          )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 3,
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.location_on_rounded,
                      color: Colors.grey,
                    ),
                    Column(
                      children: [
                        Text(
                          order.governomate,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 7, 84, 226)),
                        ),
                        Row(
                          children: [
                            Text(
                              ",${order.city}",
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 68, 2, 209)),
                            ),
                            Text(
                              order.adress,
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ].reversed.toList(),
                        )
                      ],
                    )
                  ].reversed.toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
