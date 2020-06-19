import 'package:fastfoodmobile/pages/home.dart';
import 'package:fastfoodmobile/util/colors.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentIndex = 0;

  final bottomItems = [
    {"icon": "images/icons/house.png","text":"HOME"},
    {"icon": "images/icons/offer.png","text":"OFFERS"},
    {"icon": "images/icons/order.png","text":"MY ORDER"},
    {"icon": "images/icons/user.png","text":"PROFILE"},
  ];

  final pages = [
    Home(),
    Home(),
    Home(),
    Home(),
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: pages[currentIndex],
      extendBody: true,
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(0),
        height: height / 10,

        decoration: BoxDecoration(
          color: Theme.of(context).bottomAppBarColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: bottomItems
                .asMap()
                .map((i, icon) {
                  bool active = i == currentIndex;
                  final color = active ? UIColors.orange : UIColors.grey;
                  Widget button;

                  button = Column(
                    children: <Widget>[
                      IconButton(
                        icon: Image.asset(
                          icon["icon"].toString(),
                          fit: BoxFit.contain,
                          color: color,
                        ),
                        onPressed: () => setState(() => currentIndex = i),
                      ),
                      Text(
                        icon["text"].toString(),
                        style: TextStyle(color: color,fontSize: 10,fontWeight: FontWeight.w600),
                      ),
                    ],
                  );
                  return MapEntry(i, button);
                })
                .values
                .toList(),
          ),
        ),
      ),
    );
  }
}
