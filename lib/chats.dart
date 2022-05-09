import 'package:chat_mobile/constants/asset_images.dart';
import 'package:chat_mobile/constants/assets_icons.dart';
import 'package:chat_mobile/constants/color_const.dart';
import 'package:chat_mobile/conversations.dart';
import 'package:chat_mobile/models/recent_user.dart';
import 'package:chat_mobile/shared_widgets/input_text.dart';
import 'package:chat_mobile/shared_widgets/svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Chats extends StatefulWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  late Box<RecentUser> usersBox;
  List<RecentUser> users = [];

  @override
  void initState() {
    usersBox = Hive.box("sumarachat");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage(AssetImages.imageOne),
          ),
        ),
        title: const Text(
          'Chats',
          style: TextStyle(
            fontFamily: 'sf-pro-display',
            fontSize: 30.0,
            color: ColorsConst.textColorBlack,
            // fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const CircleAvatar(
              radius: 27,
              backgroundColor: ColorsConst.greyContainer,
              child: Padding(
                padding: EdgeInsets.all(4.0),
                child: SvgIcon(AssetsIcons.camera),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const CircleAvatar(
              radius: 27,
              backgroundColor: ColorsConst.greyContainer,
              child: Padding(
                padding: EdgeInsets.all(4.0),
                child: SvgIcon(AssetsIcons.bookmark),
              ),
            ),
          ),

          // Container(
          //   height: 40,
          //   width: 40,
          //   decoration: const BoxDecoration(
          //     shape: BoxShape.circle,
          //     color: ColorConst.greyContainer,
          //   ),
          //   child: const SvgIcon(

          //     AssetsIcons.camera,

          //     height: 20,
          //     width: 18,
          //   ),
          // )
        ],
      ),
      body: ValueListenableBuilder(
          valueListenable: usersBox.listenable(),
          builder: (context, Box<RecentUser> box, _) {
            final userslist = box.values.toList().cast<RecentUser>();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                  child: InputTextSearch(
                    hintText: "Search",
                    isEnabled: false,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                  ),
                ),
                SizedBox(
                  height: 85,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18, top: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 52,
                          width: 52,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorsConst.greyContainer,
                          ),
                          child: const Icon(Icons.add_outlined),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                            child: ListView.builder(
                          itemCount: userslist.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: (() {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Conversations(
                                          users: userslist[index],
                                        )));
                              }),
                              child: UserslistAvatar(user: userslist[index]),
                            );
                          },
                        ))
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                  itemCount: userslist.length,
                  itemBuilder: ((context, index) {
                    return Slidable(
                      key: ValueKey(index),
                      // The start action pane is the one at the left or the top side.
                      startActionPane: const ActionPane(
                        // A motion is a widget used to control how the pane animates.
                        motion: ScrollMotion(),

                        // A pane can dismiss the Slidable.
                        // dismissible: DismissiblePane(onDismissed: () {}),

                        // All actions are defined in the children parameter.
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: ColorsConst.iconConvocolor,
                              child: Padding(
                                padding: EdgeInsets.all(4.0),
                                child: SvgIcon(
                                  AssetsIcons.camera,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: ColorsConst.greyContainer,
                              child: Padding(
                                padding: EdgeInsets.all(4.0),
                                child: SvgIcon(AssetsIcons.phone),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 1),
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: ColorsConst.greyContainer,
                              child: Padding(
                                padding: EdgeInsets.all(4.0),
                                child: SvgIcon(AssetsIcons.video),
                              ),
                            ),
                          ),

                          // A SlidableAction can have an icon and/or a label.
                        ],
                      ),

                      endActionPane: const ActionPane(
                        motion: ScrollMotion(),
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: ColorsConst.greyContainer,
                              child: Padding(
                                padding: EdgeInsets.all(4.0),
                                child: SvgIcon(
                                  AssetsIcons.home,
                                  // color: ColorsConst.iconConvocolor,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: ColorsConst.greyContainer,
                              child: Padding(
                                padding: EdgeInsets.all(4.0),
                                child: SvgIcon(
                                  AssetsIcons.bell,
                                  // color: ColorsConst.iconConvocolor,
                                ),
                              ),
                            ),
                          ),
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.red,
                            child: Padding(
                                padding: EdgeInsets.all(4.0),
                                child: SvgIcon(
                                  AssetsIcons.recycle,
                                )
                                // color: ColorsConst.iconConvocolor,
                                ),
                          ),
                        ],
                      ),

                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 13),
                        child: ListTile(
                          onTap: (() {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Conversations(
                                      users: userslist[index],
                                    )));
                          }),
                          leading: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorsConst.greyContainer,
                              image: DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage(
                                  userslist[index].imageassets,
                                ),
                              ),
                            ),
                          ),
                          trailing: Check(
                              isChecked: userslist[index].isTime,
                              onChanged: (_) {
                                usersBox.put(
                                    userslist[index].id,
                                    userslist[index].copywith(
                                        isTime: !userslist[index].isTime));
                              }),
                          title: Text(
                            userslist[index].tittle,
                            style: const TextStyle(
                              fontFamily: 'sf-pro-text',
                              fontSize: 17.0,
                              color: ColorsConst.textColorBlack,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: Text(
                            userslist[index].subTittle,
                            style: const TextStyle(
                              fontFamily: 'sf-pro-text',
                              fontSize: 14.0,
                              color: ColorsConst.textGreyColor,
                              // fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ))
              ],
            );
          }),
    );
  }
}

class UserslistAvatar extends StatelessWidget {
  const UserslistAvatar({
    Key? key,
    required this.user,
  }) : super(key: key);

  final RecentUser user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 57,
            width: 57,
            child: Stack(
              children: [
                Container(
                  height: 52,
                  width: 52,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorsConst.greyContainer,
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(
                        user.imageassets,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 40,
                  top: 38,
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
          const Text(
            'Josuhua',
            style: TextStyle(
              fontFamily: 'sf-pro-text',
              fontSize: 13.0,

              color: ColorsConst.textGreyColor,
              // fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class Check extends StatelessWidget {
  const Check({
    Key? key,
    required this.isChecked,
    required this.onChanged,
  }) : super(key: key);

  final bool isChecked;
  final void Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(unselectedWidgetColor: Colors.grey),
      child: Checkbox(
        // side: BorderSide.,
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        shape: const CircleBorder(),
        activeColor: Colors.grey,
        checkColor: Colors.white,
        side: const BorderSide(color: Colors.grey, width: 2),
        focusColor: Colors.white,
        value: isChecked,
        onChanged: onChanged,
      ),
    );
  }
}
