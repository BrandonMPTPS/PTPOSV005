//This widget helps build our button list for button settings.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/buttonData.dart';
import './buttonTile.dart';

class ButtonList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ButtonTile(
          key: key,
          tileIndex: index,
        );
      },
      itemCount: Provider.of<ButtonData>(context).buttonCount,
      padding: EdgeInsets.all(10),
    );
  }
}
