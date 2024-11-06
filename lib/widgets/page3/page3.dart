// import 'package:easy_url_launcher/easy_url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:janssen_delivery/main.dart';
import 'package:janssen_delivery/widgets/page3/itemHeader.dart';

class Page3 extends StatelessWidget {
  const Page3({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Container(
                  height: 40,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.green.shade100,
                  ),
                  child: TabBar(
                    onTap: (i) {
                      print(i);
                    },
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: Colors.transparent,
                    indicator: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black54,
                    tabs: const [
                      TabItem(title: 'Inbox', count: 6),
                      TabItem(title: 'Archived', count: 3),
                      TabItem(title: 'Deleted', count: 1),
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: Column(
            children: [
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     MaterialButton(
              //       color: Colors.green,
              //       onPressed: () async {
              //         await EasyLauncher.call(number: "767676776");
              //       },
              //       child: const Text("Call to a number"),
              //     ),
              //     MaterialButton(
              //       color: Colors.greenAccent,
              //       onPressed: () async {
              //         await EasyLauncher.call(number: "*123#");
              //       },
              //       child: const Text("Run a ussd code"),
              //     ),
              //     MaterialButton(
              //       color: Colors.blue,
              //       onPressed: () async {
              //         await EasyLauncher.sms(number: "1010", message: "Hello");
              //       },
              //       child: const Text("Send a sms"),
              //     ),
              //     MaterialButton(
              //       color: Colors.indigo,
              //       textColor: Colors.white,
              //       onPressed: () async {
              //         await EasyLauncher.email(
              //             email: "sarwari.developer@gmail.com",
              //             subject: "Test",
              //             body: "Hello Flutter developer");
              //       },
              //       child: const Text("Send an email"),
              //     ),
              //     MaterialButton(
              //       color: Colors.deepPurple,
              //       textColor: Colors.white,
              //       onPressed: () async {
              //         await EasyLauncher.url(url: "https://pub.dev");
              //       },
              //       child: const Text("Open url"),
              //     ),
              //     MaterialButton(
              //       color: Colors.red,
              //       textColor: Colors.white,
              //       onPressed: () async {
              //         await EasyLauncher.openMap(
              //             lati: "36.7032925", long: "67.1891222");
              //       },
              //       child: const Text("Open Google map"),
              //     ),
              //     MaterialButton(
              //       color: Colors.pink,
              //       textColor: Colors.white,
              //       onPressed: () async {
              //         await EasyLauncher.url(
              //             url: "https://www.instagram.com/qasim.dev",
              //             mode: Mode.platformDefault);
              //       },
              //       child: const Text("Open url in default app"),
              //     ),
              //     MaterialButton(
              //       color: Colors.green[700],
              //       textColor: Colors.white,
              //       onPressed: () async {
              //         await EasyLauncher.sendToWhatsApp(
              //             phone: "+93700000000", message: "hi");
              //       },
              //       child: const Text("Send to whatsapp"),
              //     ),
              //   ],
              // ),

              const ItemHeader(),
              const ItemHeader(),
              const ItemHeader(),
            ],
          ),
        ));
  }
}
