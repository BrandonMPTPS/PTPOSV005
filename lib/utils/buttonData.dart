// This is the Hive DB 'C.R.U.D' file. I believe the problem is in addButton,
// but further research needed

import './util.dart';

import '../models/button.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'dart:io';
import 'package:hive/hive.dart';
import './imageData.dart';
import '../widgets/image_picker.dart';

class ButtonData extends ChangeNotifier {
  static const String _boxName = 'buttonBox';
  File _image;
  String _buttonName;
  bool isImageErrorVisible = false;

  List<Button> _button = [];

  Button _activeButton;

  void getButtons() async {
    var box = await Hive.openBox<Button>(_boxName);

    _button = box.values.toList();

    notifyListeners();
  }

  Button getButton(index) {
    return _button[index];
  }

  void addButton(Button button) async {
    //PROBLEM WITH SAVING BUTTON NAME, BUTTON OP, AND BUTTON CHANNELS
    var box = await Hive.openBox<Button>(_boxName);
    await box.add(button);
    _button = box.values.toList();

    notifyListeners();
  }

  void deleteButton(key) async {
    var box = await Hive.openBox<Button>(_boxName);
    await box.delete(key);
    _button = box.values.toList();

    Log.i('Deleted Button with key' + key.toString());

    notifyListeners();
  }

  void editButton({Button button, int buttonKey}) async {
    var box = await Hive.openBox<Button>(_boxName);
    Uint8List buttonPic = await ImageHelper.compressImage(_image);
    await box.put(buttonKey, button);
    _button = box.values.toList();
    _activeButton = box.get(buttonKey);

    Log.i('Edited' + button.name);
  }

  void setActiveButton(key) async {
    var box = await Hive.openBox<Button>(_boxName);
    _activeButton = box.get(key);
    notifyListeners();
  }

  Button getActiveButton() {
    return _activeButton;
  }

  int get buttonCount {
    return _button.length;
  }

  void setImage(File image) {
    _image = image;
    notifyListeners();
  }

  File get image => _image;

  void checkImageError() {
    isImageErrorVisible = _image == null;
    notifyListeners();
  }
}
