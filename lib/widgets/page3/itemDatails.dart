import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:janssen_delivery/app/extensions.dart';
import 'package:janssen_delivery/data/controller.dart';
import 'package:janssen_delivery/data/models/orders.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key, required this.order});
  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 238, 217, 177),
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(9)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              " ${order.clientName}",
                              style: const TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              " : الاسم",
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold),
                            ),
                            const Gap(11),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              order.phoneNum,
                              style: const TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              " : رقم التيليفون",
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold),
                            ),
                            const Gap(11),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              " ${order.adress}",
                              style: const TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              " : العنوان",
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold),
                            ),
                            const Gap(11),
                          ],
                        ),
                      ],
                    ),
                    const Gap(11),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context)
                                    .removePadding()
                                    .size
                                    .width *
                                .6,
                            decoration: BoxDecoration(border: Border.all()),
                            child: const Center(
                                child: Text(
                              "الصنف",
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold),
                            )),
                          ),
                          Container(
                            width: MediaQuery.of(context)
                                    .removePadding()
                                    .size
                                    .width *
                                .16,
                            decoration: BoxDecoration(border: Border.all()),
                            child: const Center(
                                child: Text(
                              "الكميه",
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold),
                            )),
                          ),
                          Container(
                            width: MediaQuery.of(context)
                                    .removePadding()
                                    .size
                                    .width *
                                .16,
                            decoration: BoxDecoration(border: Border.all()),
                            child: const Center(
                                child: Text(
                              "السعر",
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold),
                            )),
                          ),
                        ].reversed.toList(),
                      ),
                    ),
                    ...order.items.map(
                      (r) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context)
                                      .removePadding()
                                      .size
                                      .width *
                                  .6,
                              decoration: BoxDecoration(border: Border.all()),
                              child: Center(
                                  child: Text(
                                r.name,
                                style: const TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.bold),
                              )),
                            ),
                            Container(
                              width: MediaQuery.of(context)
                                      .removePadding()
                                      .size
                                      .width *
                                  .16,
                              decoration: BoxDecoration(border: Border.all()),
                              child: Center(
                                  child: Text(
                                "${r.quantitiy}",
                                style: const TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.bold),
                              )),
                            ),
                            Container(
                              width: MediaQuery.of(context)
                                      .removePadding()
                                      .size
                                      .width *
                                  .16,
                              decoration: BoxDecoration(border: Border.all()),
                              child: Center(
                                  child: Text(
                                "${r.price}",
                                style: const TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.bold),
                              )),
                            ),
                          ].reversed.toList(),
                        ),
                      ),
                    ),
                    const Gap(11),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(9)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${order.items.map((t) => t.price).count()} : اجمالى السعر",
                                style: const TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.bold),
                              ),
                            )),
                      ],
                    ),
                    const Gap(11)
                  ],
                ),
              ),
            ),
            //السوال عن الموقغ
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 66),
              child: TextButton(
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                          Color.fromARGB(255, 0, 5, 241))),
                  onPressed: () async {
                    launchWhatsAppString("01225462948");
                  },
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),
                        width: 44,
                        height: 44,
                        child: const Icon(Icons.location_on),
                      ),
                      const Gap(33),
                      const Text(
                        "السوال عن الموقع",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
            ),
            const Gap(11),
            // اتصال
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 66),
              child: TextButton(
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                          Color.fromARGB(255, 0, 5, 241))),
                  onPressed: () async {
                    final Uri launchUri = Uri(
                        scheme: 'https',
                        host: 'dart.dev',
                        path: 'guides/libraries/library-tour',
                        fragment: 'numbers');
                    await launchUrl(launchUri);
                  },
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),
                        width: 44,
                        height: 44,
                        child: const Icon(Icons.call),
                      ),
                      const Gap(33),
                      const Text(
                        "مكالمه",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
            ),
            const Gap(11),
            //تم التسليم
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 66),
              child: TextButton(
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                          Color.fromARGB(255, 33, 155, 74))),
                  onPressed: () async {
                    order.deleverd = true;
                    if (order.canceled == false && order.deleverd == false) {
                      context.read<OrderController>().updateRecord(order);
                      Navigator.pop(context);
                    }
                  },
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),
                        width: 44,
                        height: 44,
                        child: const Icon(Icons.check_box),
                      ),
                      const Gap(33),
                      const Text(
                        "تم التسليم",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
            ),
            const Gap(11),
            //كنسل الاوردر
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 66),
              child: TextButton(
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                          Color.fromARGB(255, 241, 0, 0))),
                  onPressed: () async {
                    if (order.canceled == false && order.deleverd == false) {
                      order.canceled = true;
                      context.read<OrderController>().updateRecord(order);
                      Navigator.pop(context);
                    }
                  },
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),
                        width: 44,
                        height: 44,
                        child: const Icon(Icons.cancel_presentation_outlined),
                      ),
                      const Gap(33),
                      const Text(
                        "كنسل الاوردر",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

launchWhatsAppString(String phoneNum) async {
//   final link = WhatsAppUnilink(
//     phoneNumber: '+2$phoneNum',
//     text: "Hey! I'm inquiring about the apartment listing",
//   );
//   await urlluncher.launchUrlString('$link');
// }

// lunchecall(String phoneNum) {
//   urlluncher.launchUrlString("tel:$phoneNum");
}
