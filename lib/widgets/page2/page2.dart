import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:janssen_delivery/widgets/page2/monydetails.dart';
import 'package:janssen_delivery/widgets/page2/orderdatails.dart';
import 'package:janssen_delivery/widgets/page2/strarTripbotton.dart';

class Page2 extends StatelessWidget {
  const Page2({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          children: [Gap(22), MonyDetails(), startTripbotton(), OrderDetails()],
        ),
      ),
    );
  }
}
