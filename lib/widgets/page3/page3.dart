// import 'package:easy_url_launcher/easy_url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:janssen_delivery/data/controller.dart';
import 'package:janssen_delivery/main.dart';
import 'package:janssen_delivery/widgets/page3/itemHeader.dart';
import 'package:provider/provider.dart';

class Page3 extends StatelessWidget {
  const Page3({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Consumer<OrderController>(
          builder: (context, myType, child) {
            final inbox = myType.orders.values
                .where((e) => e.canceled == false && e.deleverd == false);
            final done = myType.orders.values.where((e) => e.deleverd == true);
            final canceld =
                myType.orders.values.where((e) => e.canceled == true);
            return Scaffold(
              appBar: AppBar(
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Container(
                      height: 40,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: Colors.green.shade100,
                      ),
                      child: TabBar(
                        onTap: (i) {
                          myType.pageindex = i;
                          myType.refreshUI();
                        },
                        indicatorSize: TabBarIndicatorSize.tab,
                        dividerColor: Colors.transparent,
                        indicator: BoxDecoration(
                          color: indicatorColor(myType.pageindex),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.black54,
                        tabs: [
                          TabItem(title: 'Inbox', count: inbox.length),
                          TabItem(title: 'done', count: done.length),
                          TabItem(title: 'Deleted', count: canceld.length),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Visibility(
                        visible: myType.pageindex == 0,
                        child: Column(
                          children: inbox
                              .map((e) => ItemHeader(
                                    order: e,
                                  ))
                              .toList(),
                        )),
                    Visibility(
                        visible: myType.pageindex == 1,
                        child: Column(
                          children: done
                              .map((e) => ItemHeader(
                                    order: e,
                                  ))
                              .toList(),
                        )),
                    Visibility(
                        visible: myType.pageindex == 2,
                        child: Column(
                          children: canceld
                              .map((e) => ItemHeader(
                                    order: e,
                                  ))
                              .toList(),
                        )),
                    SizedBox(
                      height: 100,
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }

  Color? indicatorColor(int pageIndex) {
    if (pageIndex == 0) {
      return const Color.fromARGB(255, 3, 129, 233);
    } else if (pageIndex == 1) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }
}

class test extends StatelessWidget {
  const test({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        MaterialButton(
          color: Colors.green,
          onPressed: () async {
            // await EasyLauncher.call(number: "767676776");
          },
          child: const Text("Call to a number"),
        ),
        MaterialButton(
          color: Colors.greenAccent,
          onPressed: () async {
            // await EasyLauncher.call(number: "*123#");
          },
          child: const Text("Run a ussd code"),
        ),
        MaterialButton(
          color: Colors.blue,
          onPressed: () async {
            // await EasyLauncher.sms(number: "1010", message: "Hello");
          },
          child: const Text("Send a sms"),
        ),
        MaterialButton(
          color: Colors.indigo,
          textColor: Colors.white,
          onPressed: () async {
            // await EasyLauncher.email(
            //     email: "sarwari.developer@gmail.com",
            //     subject: "Test",
            //     body: "Hello Flutter developer");
          },
          child: const Text("Send an email"),
        ),
        MaterialButton(
          color: Colors.deepPurple,
          textColor: Colors.white,
          onPressed: () async {
            // await EasyLauncher.url(url: "https://pub.dev");
          },
          child: const Text("Open url"),
        ),
        MaterialButton(
          color: Colors.red,
          textColor: Colors.white,
          onPressed: () async {
            // await EasyLauncher.openMap(
            //     lati: "36.7032925", long: "67.1891222");
          },
          child: const Text("Open Google map"),
        ),
        MaterialButton(
          color: Colors.pink,
          textColor: Colors.white,
          onPressed: () async {
            // await EasyLauncher.url(
            //     url: "https://www.instagram.com/qasim.dev",
            //     mode: Mode.platformDefault);
          },
          child: const Text("Open url in default app"),
        ),
        MaterialButton(
          color: Colors.green[700],
          textColor: Colors.white,
          onPressed: () async {
            // await EasyLauncher.sendToWhatsApp(
            //     phone: "+93700000000", message: "hi");
          },
          child: const Text("Send to whatsapp"),
        ),
      ],
    );
  }
}
