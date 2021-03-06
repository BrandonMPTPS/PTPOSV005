//this widget is used to help display the grid on the main app screen

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ptposv005/widgets/buttonGridTile.dart';

import '../utils/buttonData.dart';
import './buttonGridTile.dart';

class ButtonGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5, childAspectRatio: 0.89),
      itemBuilder: (context, index) {
        return ButtonGridTile(
          tileIndex: index,
        );
      },
      itemCount: Provider.of<ButtonData>(context).buttonCount,
      padding: EdgeInsets.all(15),
    );
  }
}
