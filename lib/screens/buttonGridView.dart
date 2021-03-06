//file for the main PTPOS app. This displays all buttons in a grid layout - BROKEN
//Recieves information from - buttonGrid & buttonGridTile in Widgets

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/buttonData.dart';
import '../widgets/buttonGrid.dart';

class ButtonGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<ButtonData>(context, listen: false).getButtons();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 16.0,
        title: Text('Power Tap Power App'),
        actions: [
          PopupMenuButton(
            onSelected: (int selectedValue) {
              if (selectedValue == 0) {
                Navigator.of(context).pushNamed('/bls');
              }
            },
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(child: Text('Button Settings'), value: 0),
            ],
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ButtonGrid(),
            )
          ],
        ),
      ),
    );
  }
}
