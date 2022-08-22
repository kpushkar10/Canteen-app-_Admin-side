import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../widgets/getName.dart';

class PickedUp extends StatefulWidget {
  const PickedUp({Key? key}) : super(key: key);

  @override
  State<PickedUp> createState() => _PickedUpState();
}

class _PickedUpState extends State<PickedUp> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('Orders')
          .where('status', isEqualTo: 'DELIVERED')
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
            return GetName(map['uid'], docId, "DELIVERED");
          },
        );
      },
    );
  }
}
