// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:janssen_delivery/data/controller.dart';
import 'package:janssen_delivery/widgets/login/loginController.dart';
import 'package:janssen_delivery/widgets/login/loginPage.dart';
import 'package:janssen_delivery/widgets/page1/page1.dart';
import 'package:janssen_delivery/widgets/page2/page2.dart';
import 'package:janssen_delivery/widgets/page3/page3.dart';
import 'package:provider/provider.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyAbVWkXPlOSYWPfYlfQxwzg2G91fPkAnDU',
      appId: '1:1048077712638:web:1db5bc937b81d8354cf9af',
      messagingSenderId: '1048077712638',
      projectId: 'janssendelivery-ba129',
      databaseURL: "https://janssendelivery-ba129-default-rtdb.firebaseio.com",
      authDomain: "janssendelivery-ba129.firebaseapp.com",
      storageBucket: "janssendelivery-ba129.appspot.com",
    ),
  );
  // await Supabase.initialize(
  //   url: 'https://bazhicogxlurbtcjmtdz.supabase.co',
  //   anonKey:
  //       'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJhemhpY29neGx1cmJ0Y2ptdGR6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzEwNzYyODksImV4cCI6MjA0NjY1MjI4OX0.u7E_HvSrhIOupyWELIQ5wokVoMjKRpAr_8saI4XJf6U',
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => OrderController()),
        ChangeNotifierProvider(create: (context) => LoginController())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Consumer<LoginController>(
          builder: (context, myType, child) {
            return myType.loggedIn == false ? LoginPage() : MyHomePage();
          },
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final _pageController = PageController(initialPage: 1);
  final _controller = NotchBottomBarController(index: 1);
  int maxCount = 5;
  final List<Widget> bottomBarPages = [
    const Page1(),
    const Page2(),
    const Page3(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              notchBottomBarController: _controller,
              color: HexColor("9AC8CD"),
              showLabel: true,
              textOverflow: TextOverflow.visible,
              maxLine: 1,
              shadowElevation: 5,
              kBottomRadius: 28.0,
              notchColor: Colors.black87,
              removeMargins: false,
              bottomBarWidth: 500,
              showShadow: false,
              durationInMilliSeconds: 300,
              itemLabelStyle: const TextStyle(fontSize: 10),
              elevation: 1,
              bottomBarItems: const [
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.home_filled,
                    color: Color.fromARGB(255, 7, 4, 180),
                  ),
                  activeItem: Icon(
                    Icons.touch_app_outlined,
                    color: Colors.blueAccent,
                  ),
                  itemLabelWidget: Text(
                    'التحميل',
                    style: TextStyle(
                        color: Color.fromARGB(255, 7, 4, 180),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.home_filled,
                    color: Color.fromARGB(255, 7, 4, 180),
                  ),
                  activeItem: Icon(
                    Icons.touch_app_outlined,
                    color: Colors.blueAccent,
                  ),
                  itemLabelWidget: Text(
                    'Home',
                    style: TextStyle(
                        color: Color.fromARGB(255, 7, 4, 180),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.home_filled,
                    color: Color.fromARGB(255, 7, 4, 180),
                  ),
                  activeItem: Icon(
                    Icons.touch_app_outlined,
                    color: Colors.blueAccent,
                  ),
                  itemLabelWidget: Text(
                    'الاوردرات',
                    style: TextStyle(
                        color: Color.fromARGB(255, 7, 4, 180),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
              onTap: (index) {
                _pageController.jumpToPage(index);
              },
              kIconSize: 24.0,
            )
          : null,
    );
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
