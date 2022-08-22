import 'package:admin_side/widgets/orderTile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatefulWidget {
  // const OrderCard({Key? key}) : super(key: key);
  final String name, id, docId, status;

  OrderCard(this.name, this.id, this.docId, this.status);

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  // List nameitem = ['potato', "aalu", "potata"];
  // List costitem = ['121', '121', '6969'];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150,
          child: InkWell(
            onTap: (() {
              showModalBottomSheet(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width - 20),
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.grey.withOpacity(0.5),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(widget.name),
                                Text("45"),
                              ],
                            ),
                            const Divider(
                              thickness: 1, // thickness of the line

                              color: Colors
                                  .black, // The color to use when painting the line.
                              height: 10, // The divider's height extent.
                            ),
                            Expanded(
                                child: StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('Orders')
                                  .doc(widget.docId)
                                  .collection('Items')
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return Container();
                                }
                                return ListView.builder(
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    Map<String, dynamic> listOfItems =
                                        snapshot.data!.docs[index].data()
                                            as Map<String, dynamic>;
                                    return OrderSuccessItem(
                                        listOfItems['product'],
                                        listOfItems['image'],
                                        listOfItems['quantity']);
                                  },
                                );
                              },
                            )),
                            SizedBox(
                              height: 30,
                              width: 90,
                              child: widget.status == "SUCCESS"
                                  ? OutlinedButton(
                                      onPressed: () async {
                                        await FirebaseFirestore.instance
                                            .collection('Orders')
                                            .doc(widget.docId)
                                            .update({'status': 'READY'});
                                      },
                                      style: OutlinedButton.styleFrom(
                                        side: BorderSide(
                                            width: 1.0, color: Colors.red),
                                      ),
                                      child: const Text(
                                        "Ready",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    )
                                  : widget.status == "READY"
                                      ? OutlinedButton(
                                          onPressed: () async {
                                            await FirebaseFirestore.instance
                                                .collection('Orders')
                                                .doc(widget.docId)
                                                .update(
                                                    {'status': 'DELIVERED'});
                                          },
                                          style: OutlinedButton.styleFrom(
                                            side: BorderSide(
                                                width: 1.0, color: Colors.red),
                                          ),
                                          child: const Text(
                                            "Done",
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        )
                                      : Container(),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            }),
            child: Card(
              // semanticContainer: true,
              margin: EdgeInsets.all(10),
              color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //name, enroll no, total price
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(widget.name),
                        Text(widget.id),
                        Text("45"),
                      ],
                    ),

                    // price and ready button
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "₹45",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SizedBox(
                          height: 30,
                          width: 90,
                          //
                          child: widget.status == "SUCCESS"
                              ? OutlinedButton(
                                  onPressed: () async {
                                    await FirebaseFirestore.instance
                                        .collection('Orders')
                                        .doc(widget.docId)
                                        .update({'status': 'READY'});
                                  },
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                        width: 1.0, color: Colors.red),
                                  ),
                                  child: const Text(
                                    "Ready",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                )
                              : widget.status == "READY"
                                  ? OutlinedButton(
                                      onPressed: () async {
                                        await FirebaseFirestore.instance
                                            .collection('Orders')
                                            .doc(widget.docId)
                                            .update({'status': 'DELIVERED'});
                                      },
                                      style: OutlinedButton.styleFrom(
                                        side: BorderSide(
                                            width: 1.0, color: Colors.red),
                                      ),
                                      child: const Text(
                                        "Done",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    )
                                  : Container(),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
