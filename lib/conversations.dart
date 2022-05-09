import 'dart:math';

import 'package:chat_mobile/constants/asset_images.dart';
import 'package:chat_mobile/constants/assets_icons.dart';
import 'package:chat_mobile/constants/color_const.dart';
import 'package:chat_mobile/models/messages.dart';
import 'package:chat_mobile/models/recent_user.dart';
import 'package:chat_mobile/shared_widgets/input_text.dart';
import 'package:chat_mobile/shared_widgets/svgs.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Widget conversations(Message message, FocusNode focusNode, RecentUser user) {
  if (message.showDate) {
    return Column(
      children: [
        const Day(),
        message.isCurrentUser
            ? MessageContainerUser(
                message.message,
                isViewd: message.isviwed,
                showTime: message.showTime,
                replyiedMessage: message.repliedmessage?.message,
                onRightSwipe: () {
                  // // Log.d(tag, "user side swipped");
                  // repliedMessage = message.message;
                  // focusNode.requestFocus();
                },
              )
            : MessageContainerNotUser(
                message.message,
                showTime: message.showTime,
                replyiedMessage: message.repliedmessage?.message,
                user: user,
                onRightSwipe: () {
                  // Log.d(tag, "not currernt user side swipped");
                  // repliedMessage.value = message.message;
                  // focusNode.requestFocus();
                },
              ),
      ],
    );
  } else if (message.isCurrentUser) {
    return MessageContainerUser(
      message.message,
      isViewd: message.isviwed,
      showTime: message.showTime,
      replyiedMessage: message.repliedmessage?.message,
      onRightSwipe: () {
        // repliedMessage.value = message.message;
        // Log.d(tag, " user side swipped");
        // focusNode.requestFocus();
      },
    );
  } else {
    return MessageContainerNotUser(
      message.message,
      showTime: message.showTime,
      replyiedMessage: message.repliedmessage?.message,
      user: user,
      onRightSwipe: () {
        // repliedMessage.value = message.message;
        // Log.d(tag, "not currernt user side swipped");

        // focusNode.requestFocus();
      },
    );
  }
}

class Conversations extends StatefulWidget {
  const Conversations({Key? key, required this.users}) : super(key: key);

  final RecentUser users;

  @override
  State<Conversations> createState() => _ConversationsState();
}

class _ConversationsState extends State<Conversations> {
  final String tag = "conversation";

  var showFotterIcons = true;
  // final messages = <Message>[];
  late Box<RecentUser> usersBox;
// List<RecentUser> users = [];
  @override
  void initState() {
    usersBox = Hive.box("sumarachat");
    super.initState();
  }

  final messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    FocusNode focusNode = FocusNode(); // put this up later

    // var repliedMessage = "";

    return WillPopScope(
      onWillPop: () {
        // Log.d(tag, "pop called");
        focusNode.unfocus();
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 30,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_outlined),
            color: ColorsConst.iconConvocolor,
          ),
          title: Row(
            children: [
              SizedBox(
                height: 40,
                width: 40,
                child: Stack(
                  children: [
                    Container(
                      height: 36,
                      width: 36,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorsConst.greyContainer,
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage(
                            widget.users.imageassets,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 24,
                      top: 27,
                      child: Container(
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorsConst.greenColor,
                          border: Border.all(width: 2, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, bottom: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.users.tittle,
                      style: const TextStyle(
                        fontFamily: 'sf-pro-text',
                        fontSize: 17.0,
                        color: ColorsConst.textColorBlack,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "Online",
                      style: TextStyle(
                        fontFamily: 'sf-pro-text',
                        fontSize: 13.0,
                        color: Colors.black.withOpacity(0.35),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: const [
            // IconButton(onPressed: () {}, icon:),
            SvgIcon(
              AssetsIcons.phone,
              color: ColorsConst.iconConvocolor,
            ),
            Padding(
                padding: EdgeInsets.only(left: 20, right: 30),
                child: SvgIcon(
                  AssetsIcons.video,
                  color: ColorsConst.iconConvocolor,
                )),
          ],
        ),
        body: ValueListenableBuilder(
            valueListenable: usersBox.listenable(),
            builder: (context, Box<RecentUser> box, _) {
              final userslist = box.values.toList().cast<RecentUser>();
              final clickedUser = userslist.firstWhere(
                (element) {
                  return element.id == widget.users.id;
                },
              );
              return Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AssetImages.bg),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(18, 13, 18, 20),
                          child: ListView.builder(
                            reverse: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: clickedUser.messages.length,
                            itemBuilder: (context, index) {
                              final mes =
                                  clickedUser.messages.reversed.toList();
                              // _controller.jumpTo(_controller.position.maxScrollExtent);
                              return conversations(
                                  mes[index], focusNode, widget.users);
                            },
                          ),
                        ),
                      ),
                      Container(
                        height: 78,
                        alignment: Alignment.center,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            showFotterIcons
                                ? const FooterIcons()
                                : Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 10),
                                    child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            showFotterIcons = true;
                                          });
                                        },
                                        child: const Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          color: ColorsConst.iconConvocolor,
                                        )),
                                  ),
                            Expanded(
                              child: InputTextChat(
                                  controller: messageController,
                                  replymessage: "",
                                  focusNode: focusNode,
                                  hintText: "Aa",
                                  textInputAction: TextInputAction.done,
                                  onTap: () {
                                    setState(() {
                                      showFotterIcons = false;
                                    });
                                  },
                                  keyboardType: TextInputType.text),
                            ),
                            showFotterIcons
                                ? const Padding(
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                    child: SvgIcon(
                                      AssetsIcons.thumbsUp,
                                    ),
                                  )
                                : InkWell(
                                    onTap: () async {
                                      if (messageController.text.trim() != "") {
                                        final messagesLists =
                                            clickedUser.messages;
                                        messagesLists.add(
                                          Message(
                                            isCurrentUser: true,
                                            showTime: true,
                                            message: messageController.text,
                                            showDate: false,
                                            isviwed: true,
                                          ),
                                        );
                                        usersBox.put(
                                            clickedUser.id,
                                            clickedUser.copywith(
                                                messages: messagesLists));
                                        //  messages.add(
                                        //     Message(
                                        //       isCurrentUser: true,
                                        //       showTime: true,
                                        //       message: messageController.text,
                                        //       showDate: false,
                                        //       isviwed: true,
                                        //     ),
                                        //   );

                                        await Future.delayed(
                                          const Duration(seconds: 1),
                                          () {
                                            final _random = Random();
                                            messagesLists.add(
                                              Message(
                                                isCurrentUser: false,
                                                showTime: true,
                                                message: automatedResponse[
                                                    _random.nextInt(
                                                        automatedResponse
                                                            .length)],
                                                showDate: false,
                                                isviwed: true,
                                              ),
                                            );

                                            usersBox.put(
                                                clickedUser.id,
                                                clickedUser.copywith(
                                                    messages: messagesLists));
                                          },
                                        );
                                        messageController.clear();
                                      }
                                    },
                                    child: const Padding(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Icon(
                                          Icons.send,
                                          color: ColorsConst.iconConvocolor,
                                        )),
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }),
      ),
    );
  }
}

class FooterIcons extends StatelessWidget {
  const FooterIcons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Padding(
          padding: EdgeInsets.only(left: 20, right: 10),
          child: SvgIcon(AssetsIcons.shapes),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: SvgIcon(
            AssetsIcons.camera,
            height: 25,
            color: ColorsConst.iconConvocolor,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: SvgIcon(
            AssetsIcons.picture,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: SvgIcon(
            AssetsIcons.audio,
          ),
        ),
      ],
    );
  }
}

class Day extends StatelessWidget {
  const Day({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Text(
            "16:44",
            style: TextStyle(
              fontFamily: 'sf-pro-text',
              fontSize: 12.0,

              color: Colors.black.withOpacity(0.35),
              // fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}

class MessageContainerNotUser extends StatelessWidget {
  const MessageContainerNotUser(
    this.message, {
    Key? key,
    this.showTime = true,
    this.onRightSwipe,
    this.replyiedMessage,
    this.user,
  }) : super(key: key);
  final bool showTime;
  final String message;
  final String? replyiedMessage;
  final void Function()? onRightSwipe;
  final RecentUser? user;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Row(
          children: [
            Container(
              height: 28,
              width: 28,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorsConst.greyContainer,
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage(
                    user!.imageassets,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  constraints: const BoxConstraints(
                    maxWidth: 202,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.grey.withOpacity(0.1),
                    //     spreadRadius: 1,
                    //     blurStyle: BlurStyle.solid,
                    //     blurRadius: 2,
                    //     offset: const Offset(0, 3), // changes position of shadow
                    //   ),
                    // ],
                    color: Colors.black.withOpacity(0.08),
                    borderRadius: BorderRadius.only(
                      bottomLeft:
                          showTime ? const Radius.circular(18) : Radius.zero,
                      bottomRight: const Radius.circular(18),
                      topLeft:
                          showTime ? Radius.zero : const Radius.circular(18),
                      topRight: const Radius.circular(18),
                    ),
                  ),
                  child: Text(
                    message,
                    style: const TextStyle(
                      fontFamily: 'sf-pro-text',
                      fontSize: 17.0,

                      color: ColorsConst.textColorBlack,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MessageContainerUser extends StatelessWidget {
  const MessageContainerUser(
    this.message, {
    Key? key,
    this.showTime = true,
    this.isViewd = false,
    this.onRightSwipe,
    this.replyiedMessage,
  }) : super(key: key);

  final bool showTime;
  final String message;
  final bool isViewd;
  final String? replyiedMessage;
  final void Function()? onRightSwipe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  constraints: const BoxConstraints(
                    maxWidth: 202,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.grey.withOpacity(0.3),
                    //     spreadRadius: 2,
                    //     blurRadius: 2,
                    //     offset: const Offset(0, 3), // changes position of shadow
                    //   ),
                    // ],
                    color: ColorsConst.iconConvocolor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: const Radius.circular(18),
                      bottomRight:
                          showTime ? Radius.zero : const Radius.circular(18),
                      topLeft: const Radius.circular(18),
                      topRight: const Radius.circular(18),
                    ),
                  ),
                  child: Text(
                    message,
                    style: const TextStyle(
                      fontFamily: 'sf-pro-text',
                      fontSize: 17.0,

                      color: Colors.white,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 12,
              width: 12,
              margin: const EdgeInsets.only(left: 6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2, color: ColorsConst.iconConvocolor),
              ),
              child: const FittedBox(
                child: Icon(
                  Icons.done,
                  color: ColorsConst.iconConvocolor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RepliedBoxNotUser extends StatelessWidget {
  const RepliedBoxNotUser({
    Key? key,
    required this.showTime,
    required this.repliedMessage,
  }) : super(key: key);

  final bool showTime;
  final String repliedMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 200,
        maxHeight: 75,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.zero,
          bottomRight: Radius.circular(8),
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        color: ColorsConst.iconConvocolor.withOpacity(0.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          SizedBox(
            width: 13,
          ),
        ],
      ),
    );
  }
}

class RepliedBoxUser extends StatelessWidget {
  const RepliedBoxUser({
    Key? key,
    required this.showTime,
  }) : super(key: key);

  final bool showTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 200,
        maxHeight: 75,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: const Radius.circular(8),
          bottomRight: showTime ? Radius.zero : const Radius.circular(8),
          topLeft: const Radius.circular(8),
          topRight: const Radius.circular(8),
        ),
        color: Colors.white.withOpacity(0.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          // const SvgIcon(
          //   IconsAssets.reply,
          //   color: ColorsConst.blackFour,
          // ),
          SizedBox(
            width: 13,
          ),
          Flexible(
            child: Text(
              "we love you",
              style: TextStyle(
                fontFamily: 'sf-pro-text',
                fontSize: 17.0,

                color: ColorsConst.textColorBlack,
                // fontWeight: FontWeight.bold,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isFavorite = false;
    return InkWell(
        onTap: () {
          isFavorite = !isFavorite;
        },
        child: const Icon(
          Icons.star,
          color: ColorsConst.iconConvocolor,
        ));
  }
}

const String longText =
    "me are in the circle of all that matters and all that doesent matter is a goat";
const String messageTwo = "we love you";
final automatedResponse = [
  "hi how are you",
  "How was your day",
  "Have you eaten",
  "What are yor plans today",
  "do you like to play football",
  "how do you feel about politics",
];

// go and slep try the sql way 