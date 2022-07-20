import 'package:flutter/material.dart';

class OrderCard extends StatefulWidget {
  // const OrderCard({Key? key}) : super(key: key);
  final String name, id;
  final List<Map<String, dynamic>> listOfItems;
  OrderCard(this.name, this.id, this.listOfItems);

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
                      height: 200,
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
                              child: ListView.builder(
                                itemCount: widget.listOfItems.length,
                                itemBuilder: (context, index) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(widget.listOfItems[index]['name']),
                                      Divider(
                                        color: Colors.black,
                                        thickness: 2,
                                      ),
                                      Text(widget.listOfItems[index]['quantity']
                                          .toString()),
                                    ],
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              width: 90,
                              child: OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  side:
                                      BorderSide(width: 1.0, color: Colors.red),
                                ),
                                child: const Text(
                                  "Ready",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
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
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(width: 1.0, color: Colors.red),
                            ),
                            child: const Text(
                              "Ready",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
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
