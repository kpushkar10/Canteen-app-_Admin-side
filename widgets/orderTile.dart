import 'package:flutter/material.dart';

class OrderSuccessItem extends StatefulWidget {
  //const MenuCard({ Key? key }) : super(key: key);
  final String img;
  final String itemName;
  final int quantity;
  OrderSuccessItem(this.itemName, this.img, this.quantity);

  @override
  State<OrderSuccessItem> createState() => _OrderSuccessItemState();
}

class _OrderSuccessItemState extends State<OrderSuccessItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80),
          border: Border.all(color: Colors.grey, width: 2)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Row(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.img),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(28)),
                    ),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
            const SizedBox(width: 30),
            Container(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Text(
                              widget.itemName,
                              style: TextStyle(
                                fontFamily: 'SemiBold',
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              '₹ 45',
                              style: TextStyle(
                                  fontFamily: 'Medium',
                                  fontSize: 22,
                                  color: Colors.black.withOpacity(0.7),
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        //SizedBox(width: 145),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(50)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              ' x${widget.quantity} ',
                              style: TextStyle(
                                  fontFamily: 'Medium',
                                  fontSize: 22,
                                  color: Colors.black.withOpacity(0.7),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
