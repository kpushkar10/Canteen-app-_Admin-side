import 'package:admin_side/widgets/orderCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class GetName extends StatefulWidget {
  // const GetName({Key? key}) : super(key: key);
  final String? uid, docId, status;
  GetName(this.uid, this.docId, this.status);
  @override
  State<GetName> createState() => _GetNameState();
}

class _GetNameState extends State<GetName> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Users')
            .doc(widget.uid)
            .snapshots(),
        builder: (context, snapshots) {
          //Map<String, dynamic> map = snapshots.data! as Map<String, dynamic>;
          var map = snapshots.data;
          if (!snapshots.hasData) {
            return Container();
          }
          return OrderCard(map!['name'], widget.uid!, widget.docId!, widget.status!);
        });
  }
}
