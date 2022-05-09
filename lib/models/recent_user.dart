import 'dart:math';

import 'package:chat_mobile/constants/asset_images.dart';
import 'package:chat_mobile/models/messages.dart';
import 'package:hive/hive.dart';
part 'recent_user.g.dart';

@HiveType(typeId: 0)
class RecentUser {
  @HiveField(1)
  final int id;
  @HiveField(2)
  final String imageassets;
  @HiveField(3)
  final String tittle;
  @HiveField(4)
  final String subTittle;
  @HiveField(5)
  final bool isTime;
  @HiveField(6)
  final List<Message> messages;

  const RecentUser({
    required this.imageassets,
    required this.tittle,
    required this.subTittle,
    required this.id,
    required this.isTime,
    required this.messages,
  });

  RecentUser copywith(
      {int? id,
      String? imageassets,
      String? tittle,
      String? subTittle,
      bool? isTime,
      List<Message>? messages}) {
    return RecentUser(
        imageassets: imageassets ?? this.imageassets,
        tittle: tittle ?? this.tittle,
        subTittle: subTittle ?? this.subTittle,
        id: id ?? this.id,
        isTime: isTime ?? this.isTime,
        messages: messages ?? this.messages);
  }
}

final id = Random();
final List<RecentUser> recentUsers = [
  RecentUser(
    id: id.nextInt(5000),
    imageassets: AssetImages.imageThree,
    tittle: "Martin Randolph",
    subTittle: "You: What’s man! · 9:40 AM ",
    isTime: true,
    messages: [],
  ),
  RecentUser(
    id: id.nextInt(5000),
    imageassets: AssetImages.imageFour,
    tittle: "Andrew Parker",
    subTittle: "You: Ok, thanks! · 9:25 AM",
    isTime: false,
    messages: [],
  ),
  RecentUser(
    id: id.nextInt(5000),
    imageassets: AssetImages.imageFive,
    tittle: "Karen Castillo",
    subTittle: "You: Ok, See you in To… · Fri",
    isTime: false,
    messages: [],
  ),
  RecentUser(
    id: id.nextInt(5000),
    imageassets: AssetImages.imageSix,
    tittle: "Maisy Humphrey",
    subTittle: "Have a good day, Maisy! · Fri ",
    isTime: true,
    messages: [],
  ),
  RecentUser(
    id: id.nextInt(5000),
    imageassets: AssetImages.imageSeven,
    tittle: "Joshua Lawrence",
    subTittle: "The business plan loo…  · Thu  ",
    isTime: true,
    messages: [],
  ),
  RecentUser(
    id: id.nextInt(5000),
    imageassets: AssetImages.imageEightt,
    tittle: "Maximillian Jacobson",
    subTittle: "Messenger UI · Thu  ",
    isTime: true,
    messages: [],
  ),
];
