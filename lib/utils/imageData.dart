//this is a support file for helping change the image file to a image u8intlist
//links to image picker widget in widgets

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_image_compress/flutter_image_compress.dart';

class ImageHelper {
  static Future<Uint8List> compressImage(File image) async {
    return await FlutterImageCompress.compressWithFile(
      image.absolute.path,
      minHeight: 100,
      minWidth: 100,
      quality: 40,
    );
  }
}
