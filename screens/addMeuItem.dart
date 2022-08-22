import 'package:flutter/material.dart';

class AddMenuItem extends StatefulWidget {
  const AddMenuItem({Key? key}) : super(key: key);

  @override
  State<AddMenuItem> createState() => _AddMenuItemState();
}
TextEditingController itemNameController = TextEditingController();
TextEditingController priceController = TextEditingController();
class _AddMenuItemState extends State<AddMenuItem> {
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text("+   Add Item"),
        onPressed: ()=>showBottomModal(context),
      ),
    );
  }

}

Future showBottomModal(BuildContext context){
  return showModalBottomSheet(context: context,
  builder: (context){
    return Container(
      child: Column(
        children: [
          TextField(
            controller: itemNameController,
            decoration: const InputDecoration(
              hintText: "Item Name",
              labelText: "Item Name",
            ),
          ),
          
        ],
      ),
    );
  });
}