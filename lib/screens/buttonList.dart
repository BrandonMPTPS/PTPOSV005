//this should technically be called button settings screen, because that is
//what this page turns into. It returns all buttons into a list, that should
//be showing all relevant information - BROKEN

import 'package:ptposv005/widgets/buttonList.dart';

import '../utils/buttonData.dart';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ButtonListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<ButtonData>(context, listen: false).getButtons();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 16.0,
        title: Text(
          'Button Settings',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                child: ButtonList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber,
          tooltip: 'Add Button',
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, '/bas');
          }),
    );
  }
}
