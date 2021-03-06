//this widget helps create each list tile for the list of buttons in button
//settings screen

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/buttonData.dart';
import '../models/button.dart';
import '../screens/ButtonView.dart';

class ButtonTile extends StatelessWidget {
  final int tileIndex;
  const ButtonTile({Key key, this.tileIndex});

  @override
  Widget build(BuildContext context) {
    return Consumer<ButtonData>(
      builder: (context, buttonData, child) {
        Button currentButton = buttonData.getButton(tileIndex);
        return (Container(
            decoration: BoxDecoration(
              color: tileIndex % 2 == 0 ? Colors.grey : Colors.white,
            ),
            child: ListTile(
              leading: Container(
                height: 50,
                width: 50,
                child: Image.memory(currentButton.buttonPic),
              ),
              title: Text(
                currentButton.name ?? "",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Operation: ${currentButton.operation} / ${currentButton.chLine1} / ${currentButton.chLine2}' ??
                    '',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              onTap: () {
                Provider.of<ButtonData>(context, listen: false)
                    .setActiveButton(currentButton.key);

                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ButtonView();
                }));
              },
            )));
      },
    );
  }
}
