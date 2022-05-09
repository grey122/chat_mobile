import 'package:hive/hive.dart';
part 'messages.g.dart';

@HiveType(typeId: 2)
class Message {
  @HiveField(9)
  final bool isCurrentUser;
  @HiveField(10)
  final bool showTime;
  @HiveField(11)
  final String message;
  @HiveField(12)
  final bool showDate;
  @HiveField(13)
  final bool isviwed;
  @HiveField(14)
  final Message? repliedmessage;

  const Message({
    required this.isCurrentUser,
    required this.showTime,
    required this.message,
    required this.showDate,
    required this.isviwed,
    this.repliedmessage,
  });
}

// static const messages = [
//     Message(
//         isCurrentUser: true,
//         showTime: true,
//         message: "hi",
//         showDate: true,
//         isviwed: true,
//         repliedmessage: Message(
//             isCurrentUser: true,
//             showTime: true,
//             message: "cumama",
//             showDate: true,
//             isviwed: true)),
//     Message(
//       isCurrentUser: false,
//       showTime: false,
//       message: "I am good and you",
//       showDate: false,
//       isviwed: true,
//     ),
//     Message(
//       isCurrentUser: false,
//       showTime: true,
//       message: "what do you have for me",
//       showDate: false,
//       isviwed: true,
//     ),
//     Message(
//       isCurrentUser: true,
//       showTime: true,
//       message: "Nothing just love",
//       showDate: false,
//       isviwed: true,
//     ),
//     Message(
//       isCurrentUser: true,
//       showTime: true,
//       message: messageTwo,
//       showDate: true,
//       isviwed: true,
//     ),
//     Message(
//       isCurrentUser: false,
//       showTime: true,
//       repliedmessage: Message(
//           isCurrentUser: true,
//           showTime: true,
//           message: "cumama",
//           showDate: true,
//           isviwed: true),
//       message: messageTwo,
//       showDate: false,
//       isviwed: true,
//     ),
//     Message(
//       isCurrentUser: false,
//       showTime: false,
//       message: messageTwo,
//       showDate: false,
//       isviwed: true,
//     ),
//     Message(
//       isCurrentUser: false,
//       showTime: true,
//       message: messageTwo,
//       showDate: false,
//       isviwed: true,
//     ),
//     Message(
//       isCurrentUser: true,
//       showTime: true,
//       message: messageTwo,
//       showDate: false,
//       isviwed: true,
//     ),
//   ];
