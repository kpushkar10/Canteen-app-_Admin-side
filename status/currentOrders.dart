import 'package:admin_side/widgets/getName.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CurrentOrders extends StatefulWidget {
  const CurrentOrders({Key? key}) : super(key: key);

  @override
  State<CurrentOrders> createState() => _CurrentOrdersState();
}

class _CurrentOrdersState extends State<CurrentOrders> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('Orders')
          .where('status', isEqualTo: 'SUCCESS')
          .snapshots(),
      builder: (context, snapshots) {
        if (!snapshots.hasData) {
          return Container();
        }
        // print(snapshots.data!.docs[0].data());
        return ListView.builder(
          itemCount: snapshots.data!.docs.length,
          itemBuilder: (context, index) {
            Map<String, dynamic> map =
                snapshots.data!.docs[index].data() as Map<String, dynamic>;
            String docId = snapshots.data!.docs[index].id;
            return GetName(map['uid'], docId,"SUCCESS");
          },
        );
      },
    );
  }
}
