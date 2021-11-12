import 'package:flutter/material.dart';
import 'data.dart';
import 'item_list.dart';

class ItemAddPage extends StatelessWidget {
  FoodItem? edited_item = FoodItem(id: 0, name: "", category: "",
      expiryDate: "", notificationInterval: "", notifyBeforeCount: 0,
      notifyBeforeScale: "");
  final FoodListState state;

  ItemAddPage({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add item"),
        ),
        body: Container(
          child: ListView(children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Name"
              ),
              onChanged: (value) {
                edited_item!.name = value;
              },),
            TextFormField(
                decoration: const InputDecoration(
                    labelText: "Category"
                ),
                onChanged: (value) {
                  edited_item!.category = value;
                }),
            TextFormField(
                decoration: const InputDecoration(
                    labelText: "Expiry Date"
                ),
                onChanged: (value) {
                  edited_item!.expiryDate = value;
                }),
            TextFormField(
                decoration: const InputDecoration(
                    labelText: "Notification interval"
                ),
                onChanged: (value) {
                  edited_item!.notificationInterval = value;
                }),
            TextFormField(
                decoration: const InputDecoration(
                    labelText: "Notify Before Count"
                ),
                onChanged: (value) {
                  edited_item!.notifyBeforeCount = int.parse(value);
                }),
            TextFormField(
                decoration: const InputDecoration(
                    labelText: "Notify Before Scale"
                ),
                onChanged: (value) {
                  edited_item!.notifyBeforeScale = value;
                }),
        ])
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: () {
            state.addItem(edited_item!);
            Navigator.of(context).pop();
          },
        ),
    );
  }
}