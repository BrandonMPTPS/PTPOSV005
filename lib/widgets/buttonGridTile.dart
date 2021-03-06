//This helps create each grid tile for our grid on the main screen

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/buttonData.dart';
import '../models/button.dart';

class ButtonGridTile extends StatelessWidget {
  final int tileIndex;
  const ButtonGridTile({Key key, this.tileIndex});

  @override
  Widget build(BuildContext context) {
    return Consumer<ButtonData>(
      builder: (context, buttonData, child) {
        Button currentButton = buttonData.getButton(tileIndex);
        return GridTile(
          child: Container(
            height: 75,
            width: 75,
            child: Column(
              children: [
                FlatButton(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 55,
                        width: 75,
                        child: Image.memory(currentButton.buttonPic),
                      ),
                      Text(
                        '${currentButton.name}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  onPressed: () {},
                  onLongPress: () {},
                ),
                // ListTile(
                //   leading: Container(
                //     height: 100,
                //     width: 125,
                //     child: Image.memory(currentButton.buttonPic),
                //   ),
                //   onTap: () {},
                // ),
                // SizedBox(height: 10),
                // Text(
                //   '${currentButton.name}',
                //   style: TextStyle(fontSize: 16),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
