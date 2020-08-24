import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/object_list_provider.dart';

import '../widgets/grid_item.dart';

class ListOfObjectsScreen extends StatelessWidget {
  static const routeName = "ObjectsList";

  @override
  Widget build(BuildContext context) {
    final data = context.watch<TowersList>();
    final towersList = data.towers;

    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: Text('Seznam rozhleden'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: towersList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (ctx, itemIndex) {
          return GridItem(
            towersList[itemIndex].id,
            towersList[itemIndex].city,
            towersList[itemIndex].title,
          );
        },
      ),
    );
  }
}
