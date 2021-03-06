//this may be where the image file gets saved. Again, not entirely sure at this
//point

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import '../models/button.dart';

class ButtonRepo extends ChangeNotifier {
  static const String _boxName = 'buttonBox';

  void addButton(Button button) async {
    var box = await Hive.openBox<Button>(_boxName);
    await box.add(button);
  }
}
