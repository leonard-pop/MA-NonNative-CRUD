import 'package:flutter/material.dart';

import 'data.dart';
import 'item_details.dart';

class ListPage extends StatelessWidget {
  Drawer buildDrawer(BuildContext context) {
    ListTile buildNavItem(var icon, String label, String route) {
      return ListTile(
        leading: Icon(icon),
        title: Text(label),
        onTap: () {
          // FIXME: Need Stateful Widget
          // setState(() {
          //   Navigator.of(context).pop();
          //   Navigator.of(context).pushNamed(route);
          // });
        },
      );
    }

    var navList = [
      buildNavItem(Icons.home, "Home", "/"),
      buildNavItem(Icons.settings, "Settings", "/contact_details"),
      buildNavItem(Icons.account_balance_wallet, "Account", "/account"),
    ];

    ListView listView = ListView(children: navList);

    return Drawer(child: listView);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Food Items"),
        ),
        drawer: buildDrawer(context),
        body: Container(
          child: FoodList(dummyContent),
        ));
  }
}

class FoodList extends StatelessWidget {
  final List<FoodItem> _food_items;

  FoodList(this._food_items);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      itemCount: _food_items.length,
      itemBuilder: _buildContacts,
    );
  }

  Widget _buildContacts(context, index) {
    return FoodListItem(_food_items[index]);
  }
}

class FoodListItem extends StatelessWidget {
  const FoodListItem(this.item);

  final FoodItem item;

  Widget _buildTiles(BuildContext context, FoodItem item) {
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(context, item);
  }
}