import 'package:flutter/material.dart';
import 'data.dart';

class ItemViewPage extends StatelessWidget {
  final FoodItem item;

  const ItemViewPage({Key? key, required this.item}) : super(key: key);

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
              initialValue: item.name),
            TextFormField(
                decoration: const InputDecoration(
                    labelText: "Category"
                ),
                initialValue: item.category),
            TextFormField(
                decoration: const InputDecoration(
                    labelText: "Expiry Date"
                ),
                initialValue: item.expiryDate),
            TextFormField(
                decoration: const InputDecoration(
                    labelText: "Notification interval"
                ),
                initialValue: item.notificationInterval),
            TextFormField(
                decoration: const InputDecoration(
                    labelText: "Notify Before Count"
                ),
                initialValue: item.notifyBeforeCount.toString()),
            TextFormField(
                decoration: const InputDecoration(
                    labelText: "Notify Before Scale"
                ),
                initialValue: item.notifyBeforeScale),
        ])
        ));
  }
}