import 'package:chat_mobile/constants/asset_images.dart';
import 'package:chat_mobile/constants/assets_icons.dart';
import 'package:chat_mobile/constants/color_const.dart';
import 'package:chat_mobile/models/recent_user.dart';
import 'package:chat_mobile/shared_widgets/input_text.dart';
import 'package:chat_mobile/shared_widgets/svgs.dart';
import 'package:flutter/material.dart';

class People extends StatelessWidget {
  const People({Key? key}) : super(key: key);

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
      body: Column(
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
          // SizedBox(
          //   height: 85,
          //   child: Padding(
          //     padding: const EdgeInsets.only(left: 18, top: 10),
          //     child: Row(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Container(
          //           height: 52,
          //           width: 52,
          //           decoration: const BoxDecoration(
          //             shape: BoxShape.circle,
          //             color: ColorsConst.greyContainer,
          //           ),
          //           child: const Icon(Icons.add_outlined),
          //         ),
          //         const SizedBox(
          //           width: 15,
          //         ),
          //         Expanded(
          //             child: ListView(
          //           scrollDirection: Axis.horizontal,
          //           children: List.generate(
          //             5,
          //             (index) => const RecentUsersAvatar(),
          //           ),
          //         ))
          //       ],
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 40, bottom: 15),
            child: Text(
              'Recently active',
              style: TextStyle(
                fontFamily: 'sf-pro-text',
                fontSize: 13.0,
                color: Colors.black.withOpacity(0.34),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          Expanded(
            child: ListView.separated(
              itemBuilder: ((context, index) {
                return SizedBox(
                  height: 60,
                  child: ListTile(
                    leading: SizedBox(
                      height: 45,
                      width: 45,
                      child: Stack(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorsConst.greyContainer,
                              image: DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage(
                                  recentUsers[index].imageassets,
                                ),
                              ),
                            ),
                          ),
                          recentUsers[index].isTime
                              ? Positioned(
                                  left: 4,
                                  top: 26,
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 12,
                                    width: 32,
                                    decoration: BoxDecoration(
                                      color: ColorsConst.greenColor,
                                      // border: Border.all(
                                      //     width: 2, color: Colors.white),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: const Text(
                                      '8 min',
                                      style: const TextStyle(
                                        fontFamily: 'sf-pro-text',
                                        fontSize: 8.0,
                                        color: ColorsConst.textColorBlack,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                )
                              : Positioned(
                                  left: 30,
                                  top: 30,
                                  child: Container(
                                    height: 12,
                                    width: 12,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: ColorsConst.greenColor,
                                      border: Border.all(
                                          width: 2, color: Colors.white),
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                    title: const Text(
                      'Martin Randolph',
                      style: TextStyle(
                        fontFamily: 'sf-pro-text',
                        fontSize: 17.0,
                        color: ColorsConst.textColorBlack,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: const Text(
                      'You: What’s man! · 9:40 AM ',
                      style: TextStyle(
                        fontFamily: 'sf-pro-text',
                        fontSize: 14.0,
                        color: ColorsConst.textGreyColor,
                        // fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const CircleAvatar(
                        radius: 27,
                        backgroundColor: ColorsConst.greyContainer,
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: SvgIcon(AssetsIcons.hands),
                        ),
                      ),
                    ),
                  ),
                );
              }),
              itemCount: recentUsers.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Padding(
                padding: EdgeInsets.only(left: 70),
                child: Divider(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RecentUsersAvatar extends StatelessWidget {
  const RecentUsersAvatar({
    Key? key,
  }) : super(key: key);

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
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorsConst.greyContainer,
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(
                        AssetImages.imageTwo,
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
