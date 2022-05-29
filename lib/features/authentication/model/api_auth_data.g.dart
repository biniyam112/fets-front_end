// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_auth_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class APIAuthDataAdapter extends TypeAdapter<APIAuthData> {
  @override
  final int typeId = 0;

  @override
  APIAuthData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return APIAuthData(
      token: fields[0] as String,
      id: fields[1] as int,
      type: fields[2] as String,
      username: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, APIAuthData obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.token)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.username);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is APIAuthDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
