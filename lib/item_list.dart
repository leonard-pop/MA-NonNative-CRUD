import 'dart:developer';

import 'package:flutter/material.dart';

import 'data.dart';
import 'item_details.dart';
import 'item_add.dart';

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
  State<StatefulWidget> createState() => FoodListState();
}

class FoodListState extends State<FoodList> {
  FoodListState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          itemCount: widget._food_items.length,
          itemBuilder: _buildItems),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return ItemAddPage(state: this);
                  // return Scaffold(
                  //   appBar: AppBar(
                  //     title: Text(contact.fullName)
                  //   ),
                  //   body: Text('Hello'),
                  // );
                },
              ),
            );
          }));
  }

  Widget _buildItems(context, index) {
    return FoodListItem(widget._food_items[index], this);
  }

  void deleteItem(FoodItem item) {
    setState(() {
      widget._food_items.removeAt(widget._food_items.indexOf(item));
    });
  }

  void updateItem(FoodItem old_item, FoodItem new_item) {
    setState(() {
      widget._food_items[widget._food_items.indexOf(old_item)] = new_item;
    });
  }

  void addItem(FoodItem new_item) {
    setState(() {
      new_item.id = widget._food_items.length;
      widget._food_items.add(new_item);
    });
  }
}

class FoodListItem extends StatelessWidget {
  final FoodItem item;
  final FoodListState parent_list;

  const FoodListItem(this.item, this.parent_list);

  Widget _buildTiles(BuildContext context, FoodItem item) {
    return ListTile(
      title: Text(item.name),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return ItemViewPage(item: item, state: parent_list);
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