import 'dart:developer';

import 'package:flutter/material.dart';

import 'data.dart';
import 'item_details.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("All items"),
        ),
        body: Container(
          child: FoodList(dummyContent),
        ));
  }
}

class FoodList extends StatefulWidget {
  final List<FoodItem> _food_items;

  FoodList(this._food_items);

  @override
  State<StatefulWidget> createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  _FoodListState();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      itemCount: widget._food_items.length,
      itemBuilder: _buildItems,
    );
  }

  Widget _buildItems(context, index) {
    log("Building items");
    return FoodListItem(widget._food_items[index], this);
  }

  void deleteItem(FoodItem item) {
    setState(() {
      widget._food_items.removeAt(widget._food_items.indexOf(item));
    });
  }
}

class FoodListItem extends StatelessWidget {
  final FoodItem item;
  final _FoodListState parent_list;

  const FoodListItem(this.item, this.parent_list);

  Widget _buildTiles(BuildContext context, FoodItem item) {
    print(item.name);
    return ListTile(
      title: Text(item.name),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return ItemViewPage(item: item);
              // return Scaffold(
              //   appBar: AppBar(
              //     title: Text(contact.fullName)
              //   ),
              //   body: Text('Hello'),
              // );
            },
          ),
        );
      },
      onLongPress: () {
        parent_list.deleteItem(item);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(context, item);
  }
}