//this screen gets displayed when a user selects a button from button settings
// and provides a full page showing all information about said button

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/util.dart';
import '../utils/buttonData.dart';
import '../models/button.dart';
import './button_edit_screen.dart';

class ButtonView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _deleteConfirmation(currentButton) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: Text(
                'Are you sure?',
                style: TextStyle(color: Colors.black),
              ),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('You are about to Delete ${currentButton.name}.'),
                    SizedBox(height: 10.0),
                    Text('This action cannot be undone! Proceed?')
                  ],
                ),
              ),
              actions: [
                FlatButton(
                  onPressed: () {
                    Log.d('Deleting ${currentButton.name}');
                    Provider.of<ButtonData>(context, listen: false)
                        .deleteButton(currentButton.key);
                    Navigator.popUntil(
                      context,
                      ModalRoute.withName(Navigator.defaultRouteName),
                    );
                  },
                  child: Text(
                    'DELETE',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                FlatButton(
                    onPressed: () {
                      Log.d('Cancelling...');
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ))
              ],
            );
          });
    }

    return Consumer<ButtonData>(
      builder: (context, buttonData, child) {
        Button currentButton = buttonData.getActiveButton();
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange,
            title: Text(
              currentButton.name,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.create),
                iconSize: 24.0,
                color: Colors.amber,
                tooltip: 'Edit',
                onPressed: () {
                  Log.d('Selected to edit ${currentButton.name}');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ButtonEditScreen(currentButton: currentButton);
                      },
                    ),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.delete_forever_outlined),
                iconSize: 24.0,
                color: Colors.red,
                tooltip: 'DELETE',
                onPressed: () {
                  Log.d('Selected deletion of ${currentButton.name}');
                  _deleteConfirmation(currentButton);
                },
              ),
            ],
          ),
          body: Column(
            children: <Widget>[
              Container(
                height: 36.0,
                color: Colors.grey[300],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      'Button Name:',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      '${currentButton.name}',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 36.0,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      'Operation:',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      '${currentButton.operation}',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 36.0,
                color: Colors.grey[300],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      'First Channel:',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      '${currentButton.chLine1}',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 36.0,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      'Second Channel:',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      '${currentButton.chLine2}',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 150,
                color: Colors.grey[300],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      'Icon For Button:',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    Container(
                      height: 150,
                      width: 150,
                      child: Image.memory(currentButton.buttonPic),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
