// import 'package:easy_url_launcher/easy_url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:janssen_delivery/data/controller.dart';
import 'package:janssen_delivery/widgets/page3/itemHeader.dart';
import 'package:provider/provider.dart';

class Page3 extends StatelessWidget {
  const Page3({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Consumer<OrderController>(
      builder: (context, myType, child) {
        final inbox = myType.orders.values
            .where((e) => e.canceled == false && e.deleverd == false);
        final done = myType.orders.values.where((e) => e.deleverd == true);
        final canceld =
            myType.orders.values.where((e) => e.canceled == true);
        return DefaultTabController(
          length: 3,
          initialIndex: myType.pageindex,
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
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10)),
                      color: Colors.green.shade100,
                    ),
                    child: TabBar(automaticIndicatorColorAdjustment:false ,
                      onTap: (i) {
                        myType.pageindex = i;
                        myType.refreshUI();
                      },
                      indicatorSize: TabBarIndicatorSize.tab,
                      dividerColor: Colors.transparent,
                      indicator: BoxDecoration(
                        color: indicatorColor(myType.pageindex),
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                      ),
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black54,
                      tabs: [
                        TabItem(title: 'Inbox', count: inbox.length),
                        TabItem(title: 'done', count: done.length),
                        TabItem(title: 'canceled', count: canceld.length),
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
                  const SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
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
class TabItem extends StatelessWidget {
  final String title;
  final int count;

  const TabItem({
    super.key,
    required this.title,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            overflow: TextOverflow.ellipsis,
          ),
          Container(
            margin: const EdgeInsetsDirectional.only(start: 5),
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                count.toString(),
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 15,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
