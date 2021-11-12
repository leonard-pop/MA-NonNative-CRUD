import 'package:flutter/material.dart';
import 'data.dart';
import 'item_list.dart';

class ItemViewPage extends StatelessWidget {
  final FoodItem item;
  FoodItem? edited_item;
  final FoodListState state;

  ItemViewPage({Key? key, required this.item, required this.state}) : super(key: key) {
    edited_item = item;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(item.name),
        ),
        body: Container(
          child: ListView(children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Name"
              ),
              initialValue: item.name,
              onChanged: (value) {
                edited_item!.name = value;
              },),
            TextFormField(
                decoration: const InputDecoration(
                    labelText: "Category"
                ),
                initialValue: item.category,
                onChanged: (value) {
                  edited_item!.category = value;
                }),
            TextFormField(
                decoration: const InputDecoration(
                    labelText: "Expiry Date"
                ),
                initialValue: item.expiryDate,
                onChanged: (value) {
                  edited_item!.expiryDate = value;
                }),
            TextFormField(
                decoration: const InputDecoration(
                    labelText: "Notification interval"
                ),
                initialValue: item.notificationInterval,
                onChanged: (value) {
                  edited_item!.notificationInterval = value;
                }),
            TextFormField(
                decoration: const InputDecoration(
                    labelText: "Notify Before Count"
                ),
                initialValue: item.notifyBeforeCount.toString(),
                onChanged: (value) {
                  edited_item!.notifyBeforeCount = int.parse(value);
                }),
            TextFormField(
                decoration: const InputDecoration(
                    labelText: "Notify Before Scale"
                ),
                initialValue: item.notifyBeforeScale,
                onChanged: (value) {
                  edited_item!.notifyBeforeScale = value;
                }),
        ])
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: () {
            state.updateItem(item, edited_item!);
            Navigator.of(context).pop();
          },
        ),
    );
  }
}