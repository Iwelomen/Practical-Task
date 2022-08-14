// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PhotoHiveAdapter extends TypeAdapter<PhotoHive> {
  @override
  final int typeId = 1;

  @override
  PhotoHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PhotoHive()
      ..albumId = (fields[1] as List)?.cast<Post>()
      ..thumbnailUrl = (fields[2] as List)?.cast<Post>();
  }

  @override
  void write(BinaryWriter writer, PhotoHive obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.albumId)
      ..writeByte(2)
      ..write(obj.thumbnailUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhotoHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
