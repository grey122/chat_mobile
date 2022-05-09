// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecentUserAdapter extends TypeAdapter<RecentUser> {
  @override
  final int typeId = 0;

  @override
  RecentUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecentUser(
      imageassets: fields[2] as String,
      tittle: fields[3] as String,
      subTittle: fields[4] as String,
      id: fields[1] as int,
      isTime: fields[5] as bool,
      messages: (fields[6] as List).cast<Message>(),
    );
  }

  @override
  void write(BinaryWriter writer, RecentUser obj) {
    writer
      ..writeByte(6)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.imageassets)
      ..writeByte(3)
      ..write(obj.tittle)
      ..writeByte(4)
      ..write(obj.subTittle)
      ..writeByte(5)
      ..write(obj.isTime)
      ..writeByte(6)
      ..write(obj.messages);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecentUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
