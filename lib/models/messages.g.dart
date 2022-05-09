// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MessageAdapter extends TypeAdapter<Message> {
  @override
  final int typeId = 2;

  @override
  Message read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Message(
      isCurrentUser: fields[9] as bool,
      showTime: fields[10] as bool,
      message: fields[11] as String,
      showDate: fields[12] as bool,
      isviwed: fields[13] as bool,
      repliedmessage: fields[14] as Message?,
    );
  }

  @override
  void write(BinaryWriter writer, Message obj) {
    writer
      ..writeByte(6)
      ..writeByte(9)
      ..write(obj.isCurrentUser)
      ..writeByte(10)
      ..write(obj.showTime)
      ..writeByte(11)
      ..write(obj.message)
      ..writeByte(12)
      ..write(obj.showDate)
      ..writeByte(13)
      ..write(obj.isviwed)
      ..writeByte(14)
      ..write(obj.repliedmessage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
