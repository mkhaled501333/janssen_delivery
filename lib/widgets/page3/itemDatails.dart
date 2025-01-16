// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:janssen_delivery/app/extensions.dart';
import 'package:janssen_delivery/data/controller.dart';
import 'package:janssen_delivery/data/models/orders.dart';

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
                              " ${order.orderNum}",
                              style: const TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              " : رقم الاوردر",
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
                            child: const Center(
                                child: Text(
                              "",
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
                            child: const Center(
                                child: Text(
                              "",
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
                            decoration: BoxDecoration(
                                border: Border.all(),
                                color:
                                    const Color.fromARGB(255, 139, 139, 125)),
                            child: Center(
                                child: Text(
                              "${order.items.map((t) => t.price).count()}",
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold),
                            )),
                          ),
                        ].reversed.toList(),
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
                                "${order.items.map((e) => e.requiredcharged,).reduce((value, element) => value+element,)} : المطلوب تحصيله",
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
                    int phone = 01225462948;
                    var whatsappUrl =
                        "whatsapp://send?phone=$phone&text=${Uri.encodeFull("السلام عليكم \n مع حضرتك ${order.driverName}  \n من فظلك ارسل بيانات الموقع")}";
                    await launchUrl(Uri.parse(whatsappUrl));
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
                      scheme: 'tel',
                      path: '01225462948',
                    );
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
                    deleverd(context, order);
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
                    TextEditingController controller = TextEditingController();
                    showDialog(
                        context: context,
                        builder: (c) => AlertDialog(
                              content: SizedBox(
                                height: 200,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      // ignore: prefer_const_constructors
                                      Text("هل انت متاكد ؟"),
                                      TextFormField(
                                        maxLines: null,
                                        controller: controller,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'ملاحظات',
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          ElevatedButton(
                                              style: const ButtonStyle(
                                                  backgroundColor:
                                                      WidgetStatePropertyAll(
                                                          Colors.green)),
                                              onPressed: () {
                                                if (order.canceled == false &&
                                                    order.deleverd == false) {
                                                  order.cancelReason =
                                                      controller.text;
                                                  order.canceled = true;
                                                  context
                                                      .read<OrderController>()
                                                      .updateRecord(order);
                                                  Navigator.pop(context);
                                                }
                                              },
                                              child: const Text(
                                                "تم",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                          ElevatedButton(
                                              style: const ButtonStyle(
                                                  backgroundColor:
                                                      WidgetStatePropertyAll(
                                                          Colors.red)),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text(
                                                "الغاء",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ));
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
            const Gap(11),

            //اضافة ملاحظات
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 66),
              child: TextButton(
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                          Color.fromARGB(255, 124, 108, 54))),
                  onPressed: () async {
                    TextEditingController controller = TextEditingController();
                    controller.text = order.notes;
                    showDialog(
                        context: context,
                        builder: (c) => AlertDialog(
                              content: SizedBox(
                                height: 120,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      controller: controller,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'ملاحظات',
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        ElevatedButton(
                                            style: const ButtonStyle(
                                                backgroundColor:
                                                    WidgetStatePropertyAll(
                                                        Colors.green)),
                                            onPressed: () {
                                              order.notes = controller.text;
                                              context
                                                  .read<OrderController>()
                                                  .updateRecord(order);
                                              Navigator.pop(context);
                                            },
                                            child: const Text(
                                              "تم",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        ElevatedButton(
                                            style: const ButtonStyle(
                                                backgroundColor:
                                                    WidgetStatePropertyAll(
                                                        Colors.red)),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text(
                                              "الغاء",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ));
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
                        "تسجيل ملاحظات",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
            ),
            Text('ملاحظات : ${order.notes}')
          ],
        ),
      ),
    );
  }

  deleverd(BuildContext context, OrderModel order) {
    return showDialog(
        context: context,
        builder: (c) => AlertDialog(
              content: Daialogg(
                order: order,
              ),
            ));
  }
}

class Daialogg extends StatefulWidget {
  const Daialogg({
    Key? key,
    required this.order,
  }) : super(key: key);
  final OrderModel order;

  @override
  State<Daialogg> createState() => _DaialogState();
}

class _DaialogState extends State<Daialogg> {
  String? dropdownValue;
  TextEditingController controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .7,
      child: Column(
        children: [
          const Text('طريقة الدفع', style: TextStyle(fontSize: 30)),
          DropdownButton<String>(
            value: dropdownValue,
            items: <String>['نقدى', 'فودافون كاش']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Center(
                  child: Text(
                    value,
                    style: const TextStyle(
                        fontSize: 30, color: Color.fromARGB(255, 217, 0, 76)),
                  ),
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
          ),
          Form(
            key: _formKey,
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              keyboardType: TextInputType.number,
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'المبلغ المدفوع',
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.green)),
                  onPressed: () {
                    if (widget.order.canceled == false &&
                        _formKey.currentState!.validate() &&
                        dropdownValue != null &&
                        widget.order.deleverd == false) {
                      widget.order.payingWay = dropdownValue!;
                      widget.order.deleverd = true;
                      widget.order.chargedamount = controller.text.to_double();
                      context
                          .read<OrderController>()
                          .updateRecord(widget.order);
                      Navigator.pop(context);
                      Navigator.pop(context);
                    }
                  },
                  child: const Text(
                    "تم",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
