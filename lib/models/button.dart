//Setup for the Button Model. Button requires the follwing:
// name as NAME - operation as OPERATION - chLine1 & 2 as CHANNELS
//uint8list for image file

//part 'button.g.dart' runs a script to create button.g.dart on build

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'dart:typed_data';

part 'button.g.dart';

@HiveType(typeId: 0)
class Button extends HiveObject {
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String operation;
  @HiveField(3)
  final String chLine1;
  @HiveField(4)
  final String chLine2;
  @HiveField(5)
  final Uint8List buttonPic;

  Button({
    @required this.name,
    this.operation,
    this.chLine1,
    this.chLine2,
    @required this.buttonPic,
  });
}
