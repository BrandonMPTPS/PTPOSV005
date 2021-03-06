//this widget is transferred into addButton & editButton Screens.
//it helps the user select a image for the button

import 'dart:io';
import 'package:flutter/material.dart';

class ImagePickerWidget extends StatelessWidget {
  final File image;
  final bool isImageErrorVisible;
  final VoidCallback onPressed;

  ImagePickerWidget({this.onPressed, this.image, this.isImageErrorVisible});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          height: 125,
          width: 125,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: Colors.grey[200],
            ),
            image: image != null
                ? DecorationImage(
                    image: FileImage(image),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
        ),
        Spacer(),
        Row(
          children: <Widget>[
            isImageErrorVisible
                ? Text(
                    'Please Select Image',
                    style: TextStyle(color: Colors.red),
                  )
                : FlatButton.icon(
                    color: Colors.amberAccent,
                    onPressed: onPressed,
                    icon: Icon(Icons.image_search_outlined),
                    label: Text('Select Icon'))
          ],
        ),
      ],
    );
  }
}
