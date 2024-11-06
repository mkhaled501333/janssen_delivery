import 'package:flutter/material.dart';

class MonyDetails extends StatelessWidget {
  const MonyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: 80,
          width: MediaQuery.of(context).size.width * .3,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 0, 140, 255),
            borderRadius: BorderRadius.circular(9),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "اجمالى المستحق",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "232323 EGP",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
          height: 80,
          width: MediaQuery.of(context).size.width * .3,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 253, 153, 0),
            borderRadius: BorderRadius.circular(9),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "تم الاستحقاق",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "232323 EGP",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
          height: 80,
          width: MediaQuery.of(context).size.width * .3,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 0, 189, 109),
            borderRadius: BorderRadius.circular(9),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "المتبقى",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "232323 EGP",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ].reversed.toList(),
    );
  }
}
