import 'package:admin_side/screens/addMeuItem.dart';
import 'package:admin_side/status/currentOrders.dart';
import 'package:admin_side/status/pickedUp.dart';
import 'package:admin_side/widgets/orderCard.dart';
import 'package:admin_side/status/readyOrders.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rolling_switch/rolling_switch.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: AddMenuItem(),
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
  //
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
              CurrentOrders(),
              ReadyOrders(),
              PickedUp(),
            ],
          ),
        ),
      ),
    );
  }
}
