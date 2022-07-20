import 'package:admin_side/widgets/orderCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rolling_switch/rolling_switch.dart';

import './widgets/orderList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color(0xFFE8460E),
        ),
      ),
      home: AdminPage(),
    );
  }
}

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  var state = false;
  final Color activeColor = Color(0xFFE8460E);
  final Color inctivecolor = Colors.grey;
  List<Map<String, dynamic>>? listOfItems = [
    {'name': 'Samosa', 'quantity': 2},
    {'name': 'Vadapav', 'quantity': 2}
  ];
  List<Map<String, dynamic>> listOdOrders = [
    {
      'name': 'John Doe',
      'enrolNo': '19031040',
      'itemList': [
        {'name': 'Samosa', 'quantity': 2},
        {'name': 'Vadapav', 'quantity': 2}
      ],
    },
    {
      'name': 'Steve Smith',
      'enrolNo': '19031050',
      'itemList': [
        {'name': 'Samosa', 'quantity': 3},
        {'name': 'Vadapav', 'quantity': 5}
      ],
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text(
          "Admin",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: CupertinoSwitch(
              value: state,
              onChanged: (value) {
                state = value;
                setState(
                  () {},
                );
              },
              thumbColor: state ? activeColor : inctivecolor,
              activeColor: activeColor.withOpacity(0.5),
              trackColor: inctivecolor.withOpacity(0.5),
              dragStartBehavior: DragStartBehavior.start,
            ),
          ),
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(20.0),
            child: AppBar(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              flexibleSpace: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  TabBar(
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Text(
                        "Current",
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        "Ready",
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        "Picked Up",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              OrderList(listOdOrders),
              Text("Ready"),
              Text("Picked Up"),
            ],
          ),
        ),
      ),
    );
  }
}
