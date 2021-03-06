// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'button.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ButtonAdapter extends TypeAdapter<Button> {
  @override
  final int typeId = 0;

  @override
  Button read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Button(
      name: fields[1] as String,
      operation: fields[2] as String,
      chLine1: fields[3] as String,
      chLine2: fields[4] as String,
      buttonPic: fields[5] as Uint8List,
    );
  }

  @override
  void write(BinaryWriter writer, Button obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.operation)
      ..writeByte(3)
      ..write(obj.chLine1)
      ..writeByte(4)
      ..write(obj.chLine2)
      ..writeByte(5)
      ..write(obj.buttonPic);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ButtonAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
