//this is where the magic happens.  This page contains all the files to add a
//button in the add button screen.

//Image picker widget is in the widget folder, that is what it connects to

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';

import '../models/button.dart';
import '../widgets/toast.dart';
import '../widgets/image_picker.dart';
import '../utils/buttonData.dart';

class ButtonAddScreen extends StatefulWidget {
  @override
  _ButtonAddScreenState createState() => _ButtonAddScreenState();
}

class _ButtonAddScreenState extends State<ButtonAddScreen> {
  TextEditingController textEditingController;
  String name;
  String operation;
  String chLine1;
  String chLine2;
  Uint8List buttonPic;

  void _addButton(context) {
    if (name == null) {
      toastWidget('Give Button A Name');
      return;
    }
    if (name.length < 2) {
      toastWidget('Please Use A Longer Name');
      return;
    }
    Provider.of<ButtonData>(context, listen: false).addButton(
      Button(
        name: name,
        operation: operation,
        chLine1: chLine1,
        chLine2: chLine2,
        buttonPic: buttonPic,
      ),
    );
    Navigator.pop(context);
  }

  final operationItem = [
    'On/Off',
    'In-out',
    'Strobe - Wig Wag',
    'Strobe - Fast',
    'Strobe - Slow',
    'Pulse',
    'Custom'
  ];
  final chLine1Item = [
    'Ch.1',
    'Ch.2',
    'Ch.3',
    'Ch.4',
    'Ch.5',
    'Ch.6',
    'Ch.7',
    'Ch.8',
    'Ch.9',
    'Ch.10',
  ];
  final chLine2Item = [
    'None',
    'Ch.1',
    'Ch.2',
    'Ch.3',
    'Ch.4',
    'Ch.5',
    'Ch.6',
    'Ch.7',
    'Ch.8',
    'Ch.9',
    'Ch.10',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 16.0,
        title: Text(
          'Add A Button',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save_outlined),
            iconSize: 24.0,
            color: Colors.amberAccent,
            tooltip: 'Save',
            onPressed: () {
              _addButton(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextField(
                controller: textEditingController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Button Name',
                ),
                onChanged: (v) {
                  setState(
                    () {
                      name = v;
                    },
                  );
                },
              ),
              SizedBox(height: 10.0),
              DropdownButton(
                isExpanded: true,
                icon: Icon(Icons.arrow_drop_down_sharp),
                hint: Text('Select Operation'),
                onChanged: (v1) {
                  setState(() {
                    operation = v1;
                  });
                },
                value: operation,
                items: operationItem.map((valueItem) {
                  return DropdownMenuItem(
                    value: valueItem,
                    child: Text(valueItem),
                  );
                }).toList(),
              ),
              SizedBox(height: 10.0),
              Row(
                children: [
                  DropdownButton(
                    icon: Icon(Icons.arrow_drop_down_sharp),
                    hint: Text('Select Ch.1'),
                    value: (chLine1),
                    items: chLine1Item.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                    onChanged: (v2) {
                      setState(() {
                        chLine1 = v2;
                      });
                    },
                  ),
                  Spacer(),
                  Container(
                    height: 75,
                    width: 75,
                    child: Icon(Icons.add),
                  ),
                  Spacer(),
                  DropdownButton(
                    icon: Icon(Icons.arrow_drop_down_sharp),
                    hint: Text('Select Ch.2'),
                    value: (chLine2),
                    onChanged: (v3) {
                      setState(() {
                        chLine2 = v3;
                      });
                    },
                    items: chLine2Item.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Consumer<ButtonData>(
                builder: (context, buttonData, child) => ImagePickerWidget(
                  image: buttonData.image,
                  isImageErrorVisible: buttonData.isImageErrorVisible,
                  onPressed: () async {
                    buttonData.setImage(await ImagePicker.pickImage(
                        source: ImageSource.gallery));
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: FlatButton.icon(
                        color: Colors.amberAccent,
                        padding: EdgeInsets.all(10),
                        icon: Icon(Icons.save),
                        label: Text('Save Button'),
                        onPressed: () {
                          _addButton(context);
                        }),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
