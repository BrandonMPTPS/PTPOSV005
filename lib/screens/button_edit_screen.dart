//almost the same as add button screen, but modified to accept incoming informa
//tion to be changed.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';

import '../models/button.dart';
import '../widgets/toast.dart';
import '../widgets/image_picker.dart';
import '../utils/buttonData.dart';

class ButtonEditScreen extends StatefulWidget {
  final Button currentButton;

  const ButtonEditScreen({@required this.currentButton});

  @override
  _ButtonEditScreenState createState() => _ButtonEditScreenState();
}

class _ButtonEditScreenState extends State<ButtonEditScreen> {
  String newName;
  String newOperation;
  String newChLine1;
  String newChLine2;
  Uint8List newButtonPic;

  void _editButton(context) {
    if (newName == null) {
      toastWidget('Give Button A Name');
    }
    if (newName.length < 2) {
      toastWidget('Please Use A Longer Name');
    }
    Provider.of<ButtonData>(context, listen: false).editButton(
      button: Button(
        name: newName,
        operation: newOperation,
        chLine1: newChLine1,
        chLine2: newChLine2,
        buttonPic: newButtonPic,
      ),
      buttonKey: widget.currentButton.key,
    );
    Navigator.pop(context);
  }

  final TextEditingController _nameController = TextEditingController();

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

  void initSate() {
    _nameController.text = widget.currentButton.name;
    newName = widget.currentButton.name;

    newOperation = widget.currentButton.operation;

    newChLine1 = widget.currentButton.chLine1;

    newChLine2 = widget.currentButton.chLine2;

    newButtonPic = widget.currentButton.buttonPic;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 16.0,
        title: Text(
          'Edit ${widget.currentButton.name}',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save_outlined),
            iconSize: 24.0,
            color: Colors.amber,
            tooltip: 'Save',
            onPressed: () {
              _editButton(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextField(
                  autofocus: true,
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: 'Button Name',
                  ),
                  onChanged: (v) {
                    setState(() {
                      newName = v;
                    });
                  },
                ),
                SizedBox(height: 10.0),
                DropdownButton(
                  isExpanded: true,
                  icon: Icon(Icons.arrow_drop_down_sharp),
                  hint: Text('Select Operation'),
                  value: (newOperation),
                  onChanged: (v) {
                    setState(() {
                      newOperation = v;
                    });
                  },
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
                      isExpanded: true,
                      icon: Icon(Icons.arrow_drop_down_sharp),
                      hint: Text('Select Ch.1'),
                      value: (newChLine1),
                      onChanged: (v) {
                        setState(() {
                          newChLine1 = v;
                        });
                      },
                      items: chLine1Item.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                    ),
                    Spacer(),
                    Container(
                      height: 75,
                      width: 75,
                      child: Icon(Icons.add),
                    ),
                    Spacer(),
                    DropdownButton(
                      isExpanded: true,
                      icon: Icon(Icons.arrow_drop_down_sharp),
                      hint: Text('Select Ch.2'),
                      value: (newChLine2),
                      onChanged: (v) {
                        setState(() {
                          newChLine2 = v;
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
                IconButton(
                    alignment: Alignment.center,
                    icon: Icon(Icons.save),
                    onPressed: () {
                      _editButton(context);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
