import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: Column(
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
                          const Text(
                            " محمد خالد محمد صلاح",
                            style: TextStyle(
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
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "01225462948",
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            " : رقم التيليفون",
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                          Gap(11),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            " السعيديه مركز بلبيس الشرقيه",
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            " : العنوان",
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                          Gap(11),
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
                  const Gap(11),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(9)),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            " : اجمالى السعر",
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
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
                    backgroundColor:
                        WidgetStatePropertyAll(Color.fromARGB(255, 0, 5, 241))),
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
                    backgroundColor:
                        WidgetStatePropertyAll(Color.fromARGB(255, 0, 5, 241))),
                onPressed: () async {
                  // lunchecall("01225462948");
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
                onPressed: () async {},
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
                    backgroundColor:
                        WidgetStatePropertyAll(Color.fromARGB(255, 241, 0, 0))),
                onPressed: () async {},
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
